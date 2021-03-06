
<%@ page import="co.jeferssonnunez.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuarios')}" />
		<title><g:message code="user.label" /></title>
	</head>
	<body>
		
		<div class="row">
			<g:hiddenField id="urlBase" name="urlBase" value="${createLink(uri:'/')}" />
			<link href="${g.resource(dir: 'assets/images', file: 'camera.png', absolute: true)}" id="link-src-camera"/>
		    <div class="col-lg-12">
		        <div class="row">
		        	<div class="ibox float-e-margins">
	                     <div class="ibox-title">
	                         <h5><g:message code="user.label" /></h5>
	                     </div>  
						 <div class="ibox-content">
	                          <div class="feed-activity-list">
	                          	
	                                 <div class="row">
	                                 	
	                                 	
						                    <!---------------- Panel de Busqueda ----------------------------------------------------------->	
											<div class="col-lg-8">
												
													<g:form action="search" class="form-horizontal" id="form-search-usuario" name="form-search-usuario">
														<div class="col-xs-12 col-sm-12">
															<div class="input-group">
																<input type="text" class="input-sm form-control search-query" id="query"
																		placeholder="<g:message code="default.placeholder.search.label"/>" name="query"
																		value="${params.query}"> 
																	<span class="input-group-btn">
																		<button type="submit" class="btn btn-sm btn-warning">
																			<g:message code="default.button.search.label"/>
																			<i class=" fa fa-search"></i>
																		</button>
																	</span>
															</div>
														</div>
													</g:form>
												</div>
											
											<!--------------- Termina panel de Busqueda ---------------------------------------------------->
											<div class="container-fluid col-lg-4 pull-right tooltip-demo">
												
												<button class="btn btn-success btn-outline" type="button" id="btn-adicionar-usuario"
															data-toggle="tooltip" title="<g:message code="default.tooltip.create.label"/>" data-placement="top" ><i class="fa fa-plus"></i></button>
												<button class="btn btn-danger btn-outline" type="button" id="btn-eliminar-usuario"
															data-toggle="tooltip" title="<g:message code="default.tooltip.delete.label"/>" data-placement="top" ><i class="fa fa-times"></i></button>
												<button class="btn btn-info btn-outline" type="button" id="btn-editar-usuario"
															data-toggle="tooltip" title="<g:message code="default.tooltip.edit.label"/>" data-placement="top" ><i class="fa fa-pencil"></i></button>
												
											</div>
										
							            
	                                 </div>
	                                 <br>
	                                 <div id="div-content-list-usuarios">
	                                 	<g:render template="listUsuarios" ></g:render>
	                                 </div>
	                                  
	                          </div>
	                     </div>
	                </div>
		        </div>
	        </div>
	       
		</div>
		
	  <!-- MODAL CREAR 	USUARIO -->   
      <div class="modal inmodal" id="modal-adicionar-usuario" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
          	<g:form class="form-horizontal" name="form-create-usuario" autocomplete="off" enctype="multipart/form-data">
	          <div class="modal-content animated bounceInRight">
                  <div class="modal-header">
                      <button type="button" class="close btn-modal-cerrar" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                      <h4 class="modal-title"><g:message code="user.create.label" /></h4>
                  </div>
                  <div class="modal-body form-horizontal">
                  
                  	<fieldset >
	                  	<div id="div-content-form-create-usuario">
	                  		
	                  	</div>
                  	</fieldset>
                  
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-white btn-modal-cerrar" data-dismiss="modal"><g:message code="default.cerrar.label" /></button>
                      <button type="submit" class="btn btn-primary btn-guardar-modal"><g:message code="default.save.label" /></button>
                  </div>
	           </div>
          	</g:form>
          </div>
      </div>
	
	<!-- MODAL EDITAR USUARIO -->   
      <div class="modal inmodal" id="modal-editar-usuario" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
          	<g:form class="form-horizontal" name="form-edit-user" autocomplete="off" enctype="multipart/form-data">
	          <div class="modal-content animated bounceInRight">
	                  <div class="modal-header">
	                      <button type="button" class="close btn-modal-cerrar" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                      <h4 class="modal-title"><g:message code="user.edit.label" /></h4>
	                  </div>
	                  <div class="modal-body form-horizontal">
	                  
	                  	<fieldset >
		                  	<div id="div-content-form-edit-usuario">
		                  		
		                  	</div>
	                  	</fieldset>
	                  
	                  </div>
	                  <div class="modal-footer">
	                      <button type="button" class="btn btn-white btn-modal-cerrar" data-dismiss="modal"><g:message code="default.cerrar.label" /></button>
	                      <button type="submit" class="btn btn-primary btn-guardar-modal"><g:message code="default.save.label" /></button>
	                  </div>
	              </div>
	          	</g:form>
	          </div>
	      </div>
	      
	  <!-- MODAL ELIMINAR USUARIO -->   
      <div class="modal inmodal" id="modal-eliminar-usuario" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
	          <div class="modal-content animated bounceInRight">
	                  <div class="modal-header">
	                      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                      <h4 class="modal-title"><g:message code="user.delete.label" /></h4>
	                  </div>
	                  <div class="modal-body form-horizontal">
	                  
	                  	<fieldset >
		                  	<div id="div-content-delete-usuario">
		                  		
		                  	</div>
	                  	</fieldset>
	                  
	                  </div>
	                  <div class="modal-footer">
	                      <button type="button" class="btn btn-white" data-dismiss="modal"><g:message code="default.cerrar.label" /></button>
	                      <button type="button" class="btn btn-danger btn-confirmar-eliminar-usuario btn-guardar-modal"><g:message code="default.delete.label" /></button>
	                  </div>
	              </div>
	          </div>
	      </div>
	      
	      <!-- MODAL FOTO USUARIO -->   
      <div class="modal inmodal" id="modal-foto" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
	          <div class="modal-content animated bounceInRight">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                      <h4 class="modal-title"><g:message code="user.photo.label" /></h4>
                  </div>
                  <div class="modal-body form-horizontal">
                  
                  	<div class="text-center">
						<img id="imagen-modal-foto"
							class="editable img-responsive editable-empty img-thumbnail"
							src="" />
					</div>
                  
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-white" data-dismiss="modal"><g:message code="default.cerrar.label" /></button>
                  </div>
              </div>
          </div>
      </div>
	      
	<asset:javascript src="jquery.form.js" />
	<asset:javascript src="usuarios.js" />
	</body>
</html>