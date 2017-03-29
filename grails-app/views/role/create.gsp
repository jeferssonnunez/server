<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div class="col-lg-12">
			<g:hiddenField id="urlBase" name="urlBase" value="${createLink(uri:'/')}" />
			    <div class="ibox float-e-margins">
			        <div class="ibox-title">
			            <h3>
							<g:message code="create.role.label" />
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
							
							
							<div class="modal-body form-horizontal">
                  				<g:hasErrors bean="${roleInstance}">
									<ul class="errors" role="alert">
										<g:eachError bean="${roleInstance}" var="error">
											<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
										</g:eachError>
									</ul>
								</g:hasErrors>
								<br>
			                  	<fieldset >
				                  	<div >
				                  		<g:form id="${ roleInstance?.id}" action="create" method="POST" >
											<fieldset class="form">
												<g:render template="form"/>
											</fieldset>
											<br>
											<fieldset class="text-center">
												<button id="editButton" class="btn btn-primary" type="submit" >
													
													<g:message code="default.button.create.label" default="Crear" />
												</button>
											</fieldset>
										</g:form>
				                  	</div>
			                  	</fieldset>
			                  
			                </div>
							
							
						</div>
			        </div>
			    </div>
		</div>
		
		<script type="text/javascript">
		var urlBase = $("#urlBase").val();
		$.ajax({
			type : 'GET',
			url : urlBase + 'role/permisos',
			success : function(data) {
				$.each(data, function(i, d) {
	            	$('#permissions').append('<option value="' + d['CODIGO'] + '">' +d['NOMBRE']+ '</option>');	                   
	            });
				$('.chosen-select').chosen({
					no_results_text: '<i class="fa fa-exclamation-circle"></i> No se encontró nigún resultado <i class="fa fa-hand-o-right"></i>',
					allow_single_deselect: true,
					width: "68%"
				});
				
			},
			error : function() { // En caso de error en la petición
				alert('Ups!',"Ocurrió un error en la ejecución del proceso...",'error');
			}
		});
		function alert(title,text,type  ){
			toastr.options = {
		            closeButton: true,
		            progressBar: true,
		            showMethod: 'slideDown',
		            timeOut: 4000
		        };
		    toastr[type](text, title);
		}
		</script>
		
	</body>
</html>
