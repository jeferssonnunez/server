import co.jeferssonnunez.Role
import co.jeferssonnunez.User
import org.apache.shiro.crypto.hash.Sha256Hash
import grails.util.GrailsUtil

class BootStrap {

    def init = { servletContext ->
		
		//if (GrailsUtil.environment == "development") {
			
			def superAdminRole= new Role(name: 'Super Administrador')
			superAdminRole.addToPermissions('*:*')
			superAdminRole.save()
			
			def userRole = new Role(name: "USER_ROLE")
			userRole.addToPermissions("*:index")
			userRole.save()
			println "userRole.errors : "+userRole.errors
			
			def user = new User(username: "jeferssonnunez", passwordHash: new Sha256Hash("jefer").toHex(),name:"Jefersson",eMail:"jeferssonnunez@gmail.com",
				device:"web",userType:"re")
			user.addToRoles(superAdminRole)
			user.save()
			println user.errors
			
		//}
		
    }
    def destroy = {
    }
}
