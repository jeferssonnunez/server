<%@ page import="co.jeferssonnunez.User" %>



<div class="hidden">
  <input type="password"/>
</div>
      
<input type="hidden" name="query" id="params-query" value="${params.query }" />

<div class="form-group ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name" class="col-sm-4 control-label">
		<g:message code="user.name.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-8">
		<g:textField name="name" class="input-sm col-xs-8 col-sm-8" required="" value="${userInstance?.name}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
	<label for="lastName" class="col-sm-4 control-label">
		<g:message code="user.lastName.label" default="Apellidos" />
	</label>
	<div class="col-sm-8">
		<g:textField name="lastName" class="input-sm col-xs-8 col-sm-8" value="${userInstance?.lastName}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username" class="col-sm-4 control-label">
		<g:message code="user.username.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-8">
		<g:textField name="username" class="input-sm col-xs-8 col-sm-8" required="" value="${userInstance?.username}"/>
	</div>
</div>

<div class="div-content-password">
	<div class="form-group ${hasErrors(bean: userInstance, field: 'passwordHash', 'error')} required">
		<label for="passwordHash" class="col-sm-4 control-label">
			<g:message code="user.passwordHash.label" default="Contraseña" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-sm-8">
			<input name="passwordHash" type="password" class="input-sm col-xs-8 col-sm-8" readonly onfocus="this.removeAttribute('readonly');" value="${userInstance?.passwordHash}"/>
		</div>
	</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'eMail', 'error')} required">
	<label for="eMail" class="col-sm-4 control-label">
		<g:message code="user.eMail.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-8">
		<input type="email" name="eMail" class="input-sm col-xs-8 col-sm-8" required="required" autocomplete="off" value="${userInstance?.eMail}">
	</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'description', 'error')} ">
	<label for="description" class="col-sm-4 control-label">
		<g:message code="user.description.label" default="Descripción" />
	</label>
	<div class="col-sm-8">
		<div class="form-group col-sm-9">
			<textArea name="description" id="descripcion" class="form-control" rows="2">${userInstance?.description }</textArea>
		</div>
	</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'roles', 'error')} ">
	<label for="roles" class="col-sm-4 control-label">
		<g:message code="user.roles.label" default="Perfiles" />
	</label>
	<div class="col-sm-8">
		<g:select name="roles" from="${roleInstanceList}" multiple="true" data-placeholder="Ninguno" optionKey="id" optionValue="name" value="${userInstance?.roles*.id}" class="chosen-select"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'mobilePhone', 'error')} required">
	<label for="mobilePhone" class="col-sm-4 control-label">
		<g:message code="user.mobilePhone.label" default="Celular" />
	</label>
	<div class="col-sm-8">
		<g:textField name="mobilePhone" class="input-sm col-xs-8 col-sm-8" value="${userInstance?.mobilePhone}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'address', 'error')} required">
	<label for="address" class="col-sm-4 control-label">
		<g:message code="user.address.label" default="Dirección" />
	</label>
	<div class="col-sm-8">
		<g:textField name="address" class="input-sm col-xs-8 col-sm-8" value="${userInstance?.address}"/>
	</div>
</div>