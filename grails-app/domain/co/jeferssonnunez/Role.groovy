package co.jeferssonnunez

import java.util.Date

class Role {
	static searchable = true
	
    String name

    static hasMany = [ users: User, permissions: String ]
    static belongsTo = User

	Date dateCreated
	Date lastUpdated
	
    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }
	
	static mapping = {
		autoTimestamp true
	}
	
}
