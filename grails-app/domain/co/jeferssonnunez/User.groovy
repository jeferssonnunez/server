package co.jeferssonnunez

import java.util.Date

class User {
	static searchable = true
	
    String username
    String passwordHash
	String name
	String lastName
	String eMail
	String description
	String urlPhoto
	Boolean notification = true
	String fbToken
	String notificationToken
	/**
	 * Tipo de dispositivo en que se registra el usuario
	 * web
	 * android
	 * ios
	 * */
	String device
	String country
	
	String mobilePhone
	String address
	/**
	 * Tipo de registro de usuario
	 * re : registro
	 * fb : facebook
	 */
	String userType
    
	Date dateCreated
	Date lastUpdated
	
    static hasMany = [ roles: Role, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false, unique: true, size:1..120)
		passwordHash nullable:false, blank:false
		name nullable: false, blank: false, size:1..100
		lastName nullable: true, blank: true, size:0..100
		eMail nullable:false, blank:false, unique:true ,email:true
		description nullable:true, blank:true, size:0..400
		urlPhoto nullable:true, blank:true, size:0..1024
		notification nullable:false, blank:false
		device nullable:false, blank:false
		mobilePhone nullable:true, blank:true
		address nullable:true, blank:true
		userType nullable:false, size:2..2, inList: ['re', 'fb']
		fbToken nullable: true
		notificationToken nullable:true
		country nullable:true
    }
	
	static mapping = {
		autoTimestamp true
	}
}
