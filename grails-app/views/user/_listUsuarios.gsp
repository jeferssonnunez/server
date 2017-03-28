	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<g:if test="${userInstanceList.empty}">
		<p id="noEntries"><g:message code="default.noEntries.label"/></p>
	</g:if>
	<g:else>
		<div class="table-responsive"> 
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th class="mail-box check-mail"><input type="checkbox" value="" name="" class="i-checks" disabled/></th>
						<th class="text-center"><g:message code="user.nombreCompleto.label" /></th>
						<th class="text-center"><g:message code="user.correo.label" /></th>
						<th class="text-center"><g:message code="user.fechaNacimiento.label" /></th>
						<th class="text-center"><g:message code="user.descripcion.label" /></th>
						<th class="text-center"><g:message code="user.roles.label" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'} fil" data-id="${userInstance.id }">
						
						<td>
							<input type="checkbox" value="" name="ckeckbox-usuarios" class="i-checks" data-id="${userInstance.id }" ${userInstance.username == 'superAdmin' ? 'disabled' : ''}/>
	                                      					 
						</td>
						<td class="text-center">${fieldValue(bean: userInstance, field: "name")}</td>
					
						<td class="text-center">${fieldValue(bean: userInstance, field: "eMail")}</td>
						<td></td>
						<td class="text-center">${fieldValue(bean: userInstance, field: "description")}</td>
						<td class="text-center">${userInstance?.roles?.name}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
		<div class="pagination mi-paginacion-ajax">
			<g:paginate total="${userInstanceCount ?: 0}" params="${params}"/>
		</div>
	</g:else>