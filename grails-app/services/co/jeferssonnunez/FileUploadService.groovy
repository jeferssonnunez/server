package co.jeferssonnunez

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile
import grails.util.GrailsUtil
import org.codehaus.groovy.grails.web.context.ServletContextHolder

@Transactional
class FileUploadService {

	def String uploadFile(MultipartFile file) {
		
		String name = UUID.randomUUID().toString()+".jpg"
		String storagePath = ""
		String linkBase = ""
		if (GrailsUtil.environment == "production") {
			storagePath = '/usr/share/tomcat/webapps/img'
			linkBase = 'http://www.veggiesapp.com/img'

		} else {
			def servletContext = ServletContextHolder.servletContext
			storagePath = servletContext.getRealPath('assets')
			linkBase = 'http://192.168.0.108:8093/assets'
		}


		// Create storage path directory if it does not exist
		def storagePathDirectory = new File(storagePath)
		if (!storagePathDirectory.exists()) {
			
			if (storagePathDirectory.mkdirs()) {
				println "SUCCESS"
			} else {
				println "FAILED"
			}
		}

		// Store file
		if (!file.isEmpty()) {
			file.transferTo(new File("${storagePath}/${name}"))
			
			return "${linkBase}/${name}"
		} else {
			
			return null
		}
	}
	
}
