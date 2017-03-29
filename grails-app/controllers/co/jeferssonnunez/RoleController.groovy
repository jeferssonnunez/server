package co.jeferssonnunez



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

class RoleController {
	def searchableService
	
	def permisosList = [['CODIGO':'user:*','NOMBRE':'Gestión de usuarios'],['CODIGO':'role:*','NOMBRE':'Gestión de perfiles'],['CODIGO':'*:index','NOMBRE':'Listar']]

    static allowedMethods = [save: "POST", update: "PUT", delete: ['GET', 'POST'],create: ['GET', 'POST'], edit: ['GET', 'POST']]

    def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def roleList = Role.findAll(params){
			name != 'Super Administrador'
		}
		[roleInstanceList:roleList,roleInstanceCount: roleList.totalCount,permisosList:permisosList]
    }
	
	def search(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def total = 0
		def list = [:]
		if (!params.query?.trim()) {
			list = Role.findAll(params){
				name != 'Super Administrador'
			}
		}else{
			list = Role.findAll(params){
				like('name','%'+params.query+'%') && name != 'Super Administrador'
			}
		}
		total = list.totalCount
		params.remove("query")
		render template:'listPerfiles',model:[roleInstanceList:list,roleInstanceCount:total,permisosList:permisosList]
		return
	}

	def permisos(){
		render permisosList as JSON
	}
	
    def show() {
		def roleInstance = Role.get(params.id)
		if(!roleInstance){
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])
			redirect action: "index"
		}
		[roleInstance: roleInstance,permisosList:permisosList]
    }

    def create() {
		switch (request.method) {
			case 'GET':
				def roleInstanceList = Role.findAll(){
					name != 'Super Administrador'
				}
				render view:'create', model:[roleInstance:new Role(params),roleInstanceList:roleInstanceList]
			break
			case 'POST':
				def roleInstance = new Role(params)
				if (!roleInstance.save(flush: true)) {
					flash.errors = roleInstance.errors
					render view: 'create', model: [roleInstance: roleInstance]
					return
				}
				flash.message = message(code: 'default.created.message', args: [message(code: 'role.label', default: 'Perfil'), roleInstance.id])
				redirect action: 'show', id: roleInstance.id
			break
		}
    }
	
	def edit() {
		switch (request.method) {
			case 'GET':
				def roleInstance = Role.get(params.id)
				if (!roleInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])
					render view:'index'
					return
				}
				def roleInstanceList = Role.findAll(){
					name != 'Super Administrador'
				}
				render view:'edit', model:[roleInstance:roleInstance,roleInstanceList:roleInstanceList]
			break
			case 'POST':
				def roleInstance = Role.get(params.id)
				if (!roleInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])
					render view:'index'
					return
				}
				def roleInstanceList = Role.findAll(){
					name != 'Super Administrador'
				}
				if (params.version) {
					def version = params.version.toLong()
					if (roleInstance.version > version) {
						roleInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
							  [message(code: 'role.label', default: 'Role')] as Object[],
							  "Another user has updated this Profile while you were editing")
						render view:'edit', model:[roleInstance:roleInstance,roleInstanceList:roleInstanceList]
						return
					}
				}
				roleInstance.properties = params
				
				if (!roleInstance.save(flush: true)) {
					flash.errors = roleInstance.errors
					render view:'edit', model:[roleInstance:roleInstance,roleInstanceList:roleInstanceList]
					return
				}
				flash.message = message(code: 'default.updated.message', args: [message(code: 'role.label', default: 'Role'), params.id])
				redirect action: 'show', id: roleInstance.id
				return
			break
		}
	}

    def delete() {

        def roleInstance = Role.get(params.id)
		if (!roleInstance) {
			render(contentType: 'text/json'){[
					'ErrorUpdate' : 'true',
					'error' : 'No se encontró el perfil'
					]}
			return
		}
	
		try {
			roleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'role.label', default: 'Perfil'), roleInstance.id])
			render 5
			return
		}
		catch (DataIntegrityViolationException e) {
			render(contentType: 'text/json'){[
					'ErrorUpdate' : 'true',
					'error' : 'El perfil no pudo ser eliminado'
					]}
			return
		}
    }
}
