
<%@ page import="co.jeferssonnunez.Role" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
		<title><g:message code="role.list.label" /></title>
	</head>
	<body>
		<div class="row">
			<g:hiddenField id="urlBase" name="urlBase" value="${createLink(uri:'/')}" />
		    <div class="col-lg-12">
		        <div class="row">
		        	<div class="ibox float-e-margins">
	                     <div class="ibox-title">
	                         <h5><g:message code="role.list.label" /></h5>
	                     </div>  
						 <div class="ibox-content">
	                          <div class="feed-activity-list">
	                          	
	                                 <div class="row">
	                                 	
	                                 	
						                    <!---------------- Panel de Busqueda ----------------------------------------------------------->	
											<div class="col-lg-8">
												
													<g:form action="search" class="form-horizontal" id="form-search-perfil" name="form-search-perfil">
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
										
							            
	                                 </div>
	                                 <br>
	                                 <div id="div-content-list-perfiles">
	                                 	<g:render template="listPerfiles" ></g:render>
	                                 </div>
	                                  
	                          </div>
	                     </div>
	                </div>
		        </div>
	        </div>
	       
		</div>
	      
	<asset:javascript src="perfiles.js" />
	</body>
</html>