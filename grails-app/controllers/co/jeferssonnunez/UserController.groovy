package co.jeferssonnunez



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.shiro.crypto.hash.Sha256Hash
import org.springframework.dao.DataIntegrityViolationException


class UserController {
	def searchableService
	def FileUploadService
	
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

    def edit() {
        switch (request.method) {
			case 'GET':
				def userInstance = User.get(params.id)
				if (!userInstance) {
					render(contentType: 'text/json'){[
							'ErrorUpdate' : 'true',
							'error' : 'No se encontr� el usuario'
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
					render 'No se encontr� el usuario'
					return
				}
				if(!params.roles){
					params.roles = null
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
					'error' : 'No se encontr� el usuario'
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
	
	def subirImagen(imagenFile){
		FileUploadService.uploadFile(imagenFile)
	}
	
	def updatePhoto(){
		def res = [:]
		
		def userInstance = User.findByUsername(params.username)
		if (!userInstance) {
			res['status'] = "error"
			res['message'] = "No se encontró el usuario"
			render res as JSON
			return
		}
		//Subir foto
		def foto = request.getFile('file')
		if(foto){
			//Borrar imagen anterior
			def webrootDir
			if(userInstance?.urlPhoto){
				def file
				if (GrailsUtil.environment == "production") {
					webrootDir = '/usr/share/tomcat/webapps/img'
					file = new File(webrootDir,userInstance?.urlPhoto.split("img")[1])
				}else{
					webrootDir = servletContext.getRealPath("assets") //app directory
					file = new File(webrootDir,userInstance?.urlPhoto.split("assets")[1])
				}
				file.delete()
			}
			//Guardar imagen perfil
			webrootDir = servletContext.getRealPath("/") //app directory
			params.url = subirImagen(foto)
			
			userInstance.urlPhoto = params.url
			
			if (!userInstance.save(flush: true)) {
				res['status'] = "error"
				res['message'] = "No se pudo actualizar la foto"
				render res as JSON
				return
			}

			res['status'] = "success"
			res['message'] = "Se guardó la foto"
			res['urlPhoto'] = params.url
		}else{
			res['status'] = "error"
			res['message'] = "No hay foto"
		}
		
		render res as JSON
		return
	}
	
	def editProfile(){
		def res = [:]
		
		def userInstance = User.findByUsername(params.username)
		if (!userInstance) {
			res['status'] = "error"
			res['message'] = "No se encontró el usuario"
			render res as JSON
			return
		}
		
		userInstance.properties = params
		
		if (!userInstance.save(flush: true)) {
			res['status'] = "error"
			res['message'] = "No se pudo editar el perfil"
			render res as JSON
			return
		}
		
		res['status'] = "success"
		res['message'] = "Se editó satisfactoriamente"
		
		render res as JSON
	}
}
