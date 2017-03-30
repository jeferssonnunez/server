
<%@ page import="co.jeferssonnunez.Role" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'role.label', default: 'Perfil')}" />
<title><g:message code="role.title.label" /></title>
<asset:stylesheet src="plugins/sweetalert/sweetalert.css" />
</head>
<body>

	<div class="col-lg-12">
	<g:hiddenField id="urlBase" name="urlBase" value="${createLink(uri:'/')}" />
	    <div class="ibox float-e-margins">
	        <div class="ibox-title">
	            <h3>
					<g:message code="role.header.show.label" />
				</h3>
	            <div class="ibox-tools">
	            </div>
	        </div>
	        <div class="ibox-content ibox-heading">
	           <g:if test="${flash.message}">
					<div class="alert alert-info alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						${flash.message}
					</div>
				</g:if>
				<div class="container-fluid">
					<div class="col-md-6 col-sm-6">
						<dl>
							<g:if test="${roleInstance?.name}">
								<dt>
									<g:message code="role.name.label" default="Nombre" />
								</dt>
		
								<dd>
									<g:fieldValue bean="${roleInstance}" field="name" />
								</dd>
		
							</g:if>
						</dl>
					</div>
					<div class="col-md-6 col-sm-6">
						<dl>
							<g:if test="${roleInstance?.permissions}">
								<dt>
									<g:message code="role.permissions.label" default="Permisos" />
								</dt>
								<g:each in="${roleInstance.permissions}" status="x" var="permisos">
									<g:each in="${permisosList}" status="ix" var="permi">
										<dd>
											<g:if test="${permi.CODIGO == permisos || permisos == '*:*'}">
												${permi.NOMBRE }
											</g:if>
										</dd>
									</g:each>
								</g:each>
								
							</g:if>
						</dl>
					</div>
				</div>
	        </div>
	        <div class="ibox-content inspinia-timeline">
	
	            <div class="timeline-item">
	                <div class="row">
	                    
	                    <g:form>
							<g:hiddenField name="id" value="${roleInstance?.id}" id="role" />
							<div class="form-actions">
								<g:link id="editButton"
									class="btn btn-info" action="edit"
									id="${roleInstance?.id}">
									<i class="fa fa-pencil"></i>
									<g:message code="default.button.edit.label" default="Editar" />
								</g:link>
								<button id="deleteButton" class="btn btn-danger demo4" type="button" >
									<i class="fa fa-trash"></i>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>
							</div>
						</g:form>
	                    
	                </div>
	            </div>
	           
	           
	            
	
	        </div>
	    </div>
	</div>
	
<asset:javascript src="plugins/sweetalert/sweetalert.min.js" />
<script type="text/javascript">
	var urlBase = $("#urlBase").val();
	$('.demo4').click(function () {
		var title = '<g:message code="default.sure.delete.label"/>'
		var text = '<g:message code="default.text.delete.label"/>'
		var confirmButtonText = '<g:message code="default.confirmButtonText.label"/>'
		var cancelButtonText = '<g:message code="default.cancelButtonText.label"/>'
	    swal({
	                title: title,
	                text: text,
	                type: "warning",
	                showCancelButton: true,
	                confirmButtonColor: "#DD6B55",
	                confirmButtonText: confirmButtonText,
	                cancelButtonText: cancelButtonText,
	                closeOnConfirm: false,
	                closeOnCancel: false },
	            function (isConfirm) {
	                if (isConfirm) {
	                    $.ajax({
	            			type:'POST',
	            			url : urlBase + 'role/delete',
	            			data : {'id':$('#role').val()},
	            			success : function(data) {
	            				if (!data.ErrorUpdate) {
	            					swal('<g:message code="default.deleted.label"/>', '<g:message code="default.deleted.text.label"/>', "success");
	            					setTimeout($(location).attr('href', urlBase+'role/index'), 1000);
	            				}else{
	            					swal('<g:message code="default.error.label"/>', data.error , "error");
	            				}
	            			},
	            			error : function() { // En caso de error en la petición
	            				swal('<g:message code="default.error.label"/>','<g:message code="default.error.ajax.label"/>' ,'error');
	            			}
	            		});
	                } else {
	                    swal('<g:message code="default.cancelled.label"/>', '<g:message code="default.cancelled.text.label"/>', "error");
	                }
	            });
	});
</script>
</body>
</html>

