<%@ page import="co.jeferssonnunez.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" maxlength="120" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordHash', 'error')} required">
	<label for="passwordHash">
		<g:message code="user.passwordHash.label" default="Password Hash" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="passwordHash" required="" value="${userInstance?.passwordHash}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${userInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" maxlength="100" value="${userInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'eMail', 'error')} required">
	<label for="eMail">
		<g:message code="user.eMail.label" default="E Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="eMail" required="" value="${userInstance?.eMail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="user.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="400" value="${userInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'urlPhoto', 'error')} ">
	<label for="urlPhoto">
		<g:message code="user.urlPhoto.label" default="Url Photo" />
		
	</label>
	<g:textArea name="urlPhoto" cols="40" rows="5" maxlength="1024" value="${userInstance?.urlPhoto}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'notification', 'error')} ">
	<label for="notification">
		<g:message code="user.notification.label" default="Notification" />
		
	</label>
	<g:checkBox name="notification" value="${userInstance?.notification}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'device', 'error')} required">
	<label for="device">
		<g:message code="user.device.label" default="Device" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="device" required="" value="${userInstance?.device}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'mobilePhone', 'error')} ">
	<label for="mobilePhone">
		<g:message code="user.mobilePhone.label" default="Mobile Phone" />
		
	</label>
	<g:textField name="mobilePhone" value="${userInstance?.mobilePhone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="user.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${userInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userType', 'error')} required">
	<label for="userType">
		<g:message code="user.userType.label" default="User Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="userType" from="${userInstance.constraints.userType.inList}" required="" value="${userInstance?.userType}" valueMessagePrefix="user.userType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fbToken', 'error')} ">
	<label for="fbToken">
		<g:message code="user.fbToken.label" default="Fb Token" />
		
	</label>
	<g:textField name="fbToken" value="${userInstance?.fbToken}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'notificationToken', 'error')} ">
	<label for="notificationToken">
		<g:message code="user.notificationToken.label" default="Notification Token" />
		
	</label>
	<g:textField name="notificationToken" value="${userInstance?.notificationToken}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="user.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${userInstance?.country}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'permissions', 'error')} ">
	<label for="permissions">
		<g:message code="user.permissions.label" default="Permissions" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'roles', 'error')} ">
	<label for="roles">
		<g:message code="user.roles.label" default="Roles" />
		
	</label>
	<g:select name="roles" from="${co.jeferssonnunez.Role.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.roles*.id}" class="many-to-many"/>

</div>

