<%@ page import="co.jeferssonnunez.Role" %>




<div class="form-group ${hasErrors(bean: roleInstance, field: 'name', 'error')} required">
	<label for="name" class="col-sm-4 control-label">
		<g:message code="role.name.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-8">
		<g:textField name="name" class="input-sm col-xs-8 col-sm-8" required="" value="${roleInstance?.name}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: roleInstance, field: 'permissions', 'error')} ">
	<label for="permissions" class="col-sm-4 control-label">
		<g:message code="role.permissions.label" default="Permisos" />
	</label>
	<div class="col-sm-8">
			<input type="hidden" id="permisos" value="${roleInstance?.permissions}">
			<g:select name="permissions" id="permissions" from="" multiple="true" data-placeholder="Ninguno" optionKey="" optionValue="" value="${roleInstance?.permissions}" 
				class="chosen-select"/>
	</div>
</div>



