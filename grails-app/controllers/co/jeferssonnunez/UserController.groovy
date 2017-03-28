package co.jeferssonnunez



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.shiro.crypto.hash.Sha256Hash
import org.springframework.dao.DataIntegrityViolationException


class UserController {
	def searchableService
	
	def permisosList = [['CODIGO':'user:*','NOMBRE':'Gestión de usuarios'],['CODIGO':'role:*','NOMBRE':'Gestión de perfiles'],['CODIGO':'sensorRegistry:*','NOMBRE':'Gestión de sensores'],
		['CODIGO':'verticalGarden:*','NOMBRE':'Gestión de huertas'],['CODIGO':'newsItem:*','NOMBRE':'Gestión de noticias'],['CODIGO':'notification:*','NOMBRE':'Gestión de notificaciones']]

    static allowedMethods = [save: "POST", update: "PUT", delete: ['GET', 'POST'],create: ['GET', 'POST'], edit: ['GET', 'POST']]

    def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def userInstanceList = User.list(params)
		[userInstanceList:userInstanceList,userInstanceCount: User.count()]
    }

    def search(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def total = 0
		def list = [:]
		if (!params.query?.trim()) {
			list = User.list(params)
			total = User.count()
		}else{
			def searchResults = User.search(params.query, params)
			total = searchResults.total
			list = searchResults.results
		}
		params.remove("query")
		render template:'listUsuarios',model:[userInstanceList:list,userInstanceCount:total]
		return
	}

    def create() {
		switch (request.method) {
			case 'GET':
				def roleInstanceList = Role.findAll(){
					name != 'Super Administrador'
				}
				render template:'form',model:[userInstance:new User(params),roleInstanceList:roleInstanceList]
			break
			case 'POST':
				def userInstance = new User(params)
				userInstance.passwordHash = new Sha256Hash(params.passwordHash).toHex()
				userInstance.userType = 're'
				if (!userInstance.save(flush: true)) {
					flash.errors = userInstance.errors
					render 'error@'
					render template:'errors'
					return
				}
				redirect(action: "search", params: params)
				return
			break
		}
    }

	def permisos(){
		render permisosList as JSON
	}

    def edit() {
        switch (request.method) {
			case 'GET':
				def userInstance = User.get(params.id)
				if (!userInstance) {
					render(contentType: 'text/json'){[
							'ErrorUpdate' : 'true',
							'error' : 'No se encontró el usuario'
							]}
					return
				}
				def roleInstanceList = Role.findAll(){
					name != 'Super Administrador'
				}
				render template:'form', model:[userInstance:userInstance,roleInstanceList:roleInstanceList]
			break
			case 'POST':
				def userInstance = User.get(params.id)
				if (!userInstance) {
					render 'error@'
					render 'No se encontró el usuario'
					return
				}
				if (params.version) {
					def version = params.version.toLong()
					if (userInstance.version > version) {
						render 0
						return
					}
				}
				userInstance.properties = params
				
				if (!userInstance.save(flush: true)) {
					flash.errors = userInstance.errors
					render 'error@'
					render template:'errors'
					return
				}
				redirect(action: "search", params: params)
				return
			break
		}
    }
	
	def delete() {
		def userInstance = User.get(params.id)
		if (!userInstance) {
			render(contentType: 'text/json'){[
					'ErrorUpdate' : 'true',
					'error' : 'No se encontró el usuario'
					]}
			return
		}
	
		try {
			userInstance.delete(flush: true)
			redirect(action: "search", params: params)
			return
		}
		catch (DataIntegrityViolationException e) {
			render(contentType: 'text/json'){[
					'ErrorUpdate' : 'true',
					'error' : 'El usuario no pudo ser eliminado'
					]}
			return
		}
	}
}
