
<%@ page import="co.jeferssonnunez.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.passwordHash}">
				<li class="fieldcontain">
					<span id="passwordHash-label" class="property-label"><g:message code="user.passwordHash.label" default="Password Hash" /></span>
					
						<span class="property-value" aria-labelledby="passwordHash-label"><g:fieldValue bean="${userInstance}" field="passwordHash"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="user.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.eMail}">
				<li class="fieldcontain">
					<span id="eMail-label" class="property-label"><g:message code="user.eMail.label" default="E Mail" /></span>
					
						<span class="property-value" aria-labelledby="eMail-label"><g:fieldValue bean="${userInstance}" field="eMail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="user.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${userInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.urlPhoto}">
				<li class="fieldcontain">
					<span id="urlPhoto-label" class="property-label"><g:message code="user.urlPhoto.label" default="Url Photo" /></span>
					
						<span class="property-value" aria-labelledby="urlPhoto-label"><g:fieldValue bean="${userInstance}" field="urlPhoto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.notification}">
				<li class="fieldcontain">
					<span id="notification-label" class="property-label"><g:message code="user.notification.label" default="Notification" /></span>
					
						<span class="property-value" aria-labelledby="notification-label"><g:formatBoolean boolean="${userInstance?.notification}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.device}">
				<li class="fieldcontain">
					<span id="device-label" class="property-label"><g:message code="user.device.label" default="Device" /></span>
					
						<span class="property-value" aria-labelledby="device-label"><g:fieldValue bean="${userInstance}" field="device"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.mobilePhone}">
				<li class="fieldcontain">
					<span id="mobilePhone-label" class="property-label"><g:message code="user.mobilePhone.label" default="Mobile Phone" /></span>
					
						<span class="property-value" aria-labelledby="mobilePhone-label"><g:fieldValue bean="${userInstance}" field="mobilePhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="user.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${userInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.userType}">
				<li class="fieldcontain">
					<span id="userType-label" class="property-label"><g:message code="user.userType.label" default="User Type" /></span>
					
						<span class="property-value" aria-labelledby="userType-label"><g:fieldValue bean="${userInstance}" field="userType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.fbToken}">
				<li class="fieldcontain">
					<span id="fbToken-label" class="property-label"><g:message code="user.fbToken.label" default="Fb Token" /></span>
					
						<span class="property-value" aria-labelledby="fbToken-label"><g:fieldValue bean="${userInstance}" field="fbToken"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.notificationToken}">
				<li class="fieldcontain">
					<span id="notificationToken-label" class="property-label"><g:message code="user.notificationToken.label" default="Notification Token" /></span>
					
						<span class="property-value" aria-labelledby="notificationToken-label"><g:fieldValue bean="${userInstance}" field="notificationToken"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="user.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${userInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="user.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${userInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="user.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${userInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.permissions}">
				<li class="fieldcontain">
					<span id="permissions-label" class="property-label"><g:message code="user.permissions.label" default="Permissions" /></span>
					
						<span class="property-value" aria-labelledby="permissions-label"><g:fieldValue bean="${userInstance}" field="permissions"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.roles}">
				<li class="fieldcontain">
					<span id="roles-label" class="property-label"><g:message code="user.roles.label" default="Roles" /></span>
					
						<g:each in="${userInstance.roles}" var="r">
						<span class="property-value" aria-labelledby="roles-label"><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
