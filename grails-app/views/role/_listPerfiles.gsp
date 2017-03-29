	<g:if test="${flash.message}">
		<div class="alert alert-info alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			${flash.message}
		</div>
	</g:if>
	<br>
	<g:if test="${roleInstanceList.empty}">
		<p id="noEntries"><g:message code="default.noEntries.label"/></p>
	</g:if>
	<g:else>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th class="text-center"><g:message code="role.name.label" /></th>
					<th class="text-center"><g:message code="role.permissions.label" /></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${roleInstanceList}" status="i" var="roleInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'} fil" data-id="${roleInstance.id }">
					
					<td class="text-center">${fieldValue(bean: roleInstance, field: "name")}</td>
					<td class="text-center">
					
						<g:each in="${roleInstance.permissions}" status="x" var="permisos">
							
							<g:each in="${permisosList}" status="ix" var="permi">
							
								<g:if test="${permi.CODIGO == permisos || permisos == '*:*'}">
									${permi.NOMBRE },
								</g:if>
								
							</g:each>
							
						</g:each>
					</td>
					<td class="text-center">
						<g:link action="show" id="${roleInstance?.id}" class="btn btn-primary pull-right">
							<i class="fa fa-search-plus" aria-hidden="true"></i>
							<g:message code="default.button.details.label" />
						</g:link>
					</td>
				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination mi-paginacion-ajax">
			<g:paginate total="${roleInstanceCount ?: 0}" params="${params}"/>
		</div>
	</g:else>