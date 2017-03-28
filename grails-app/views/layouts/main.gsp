<%@ page import="org.apache.shiro.SecurityUtils"%>

<!DOCTYPE html>
<html>
	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Demo"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'icon_profile.ico')}" type="image/x-icon">
		
		<asset:stylesheet src="bootstrap.min.css" />
    	<asset:stylesheet src="font-awesome/css/font-awesome.min.css" />
    	
    	<!-- Toastr style -->
    	<asset:stylesheet src="plugins/toastr/toastr.min.css" />
		
		<asset:stylesheet src="animate.css" />
	    <asset:stylesheet src="style.css" />
	    
	    <!-- iCheck -->
    	<asset:stylesheet src="plugins/iCheck/custom.css" />
    	
    	<!-- Chosen -->
    	<asset:stylesheet src="plugins/chosen/chosen.css" />
		
		<!-- Mainly scripts -->
	    <asset:javascript src="jquery-2.1.1.js" />
	    <asset:javascript src="bootstrap.min.js" />
		<asset:javascript src="plugins/metisMenu/jquery.metisMenu.js" />
		<asset:javascript src="plugins/slimscroll/jquery.slimscroll.min.js" />
		
		 <!-- Toastr script -->
	    <asset:javascript src="plugins/toastr/toastr.min.js" />
    
		<!-- iCheck -->
    	<asset:javascript src="plugins/iCheck/icheck.min.js" />
	
	    <!-- Custom and plugin javascript -->
	    <asset:javascript src="inspinia.js" />
	    <asset:javascript src="plugins/pace/pace.min.js" />
	    
	    <!-- Chosen -->
		<asset:javascript src="plugins/chosen/chosen.jquery.js" />
  		
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body class="pace-done skin-1">

    <div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                          
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> 
                            
                             </span></span> </a>
                    </div>
                    <div class="logo-element">
                        
                    </div>
                </li>
                 <g:if test="${SecurityUtils.subject.isPermitted('user:index') || SecurityUtils.subject.isPermitted('role:index')}">
	                <li class="${controllerName == 'user' || controllerName == 'role' ? 'active' : ''}">		
	                    <a href="index.html"><i class="fa fa-users"></i> <span class="nav-label"><g:message code="default.users.label" /></span> <span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                    	<shiro:hasPermission permission="user:index">
	                       		<li class="${controllerName == 'user' && actionName == 'index' ? 'active' : ''}"><g:link controller="user" action="index"><g:message code="default.users.label" /></g:link></li>
	                        </shiro:hasPermission>
	                        <shiro:hasPermission permission="role:index">
	                        	<li class="${controllerName == 'role' && actionName == 'index' ? 'active' : ''}"><g:link controller="role" action="index"><g:message code="default.profiles.label" /></g:link></li>
	                        </shiro:hasPermission>
	                    </ul>
	                </li>
	            </g:if>
                <g:if test="${SecurityUtils.subject.isPermitted('notificacion:index')}">
	                <li class="${controllerName == 'notificacion' ? 'active' : ''}">
	                    <a href="#"><i class="fa fa-shekel"></i> <span class="nav-label"><g:message code="default.notifications.label" /></span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                    	<shiro:hasPermission permission="notificacion:index">
	                    		<li class="${controllerName == 'notificacion' && actionName == 'index' ? 'active' : ''}"><g:link controller="notificacion" action="index"><g:message code="default.notifications.label" /></g:link></li>
	                    	</shiro:hasPermission>
	                    </ul>
	                </li>
                </g:if>
                <g:if test="${SecurityUtils.subject.isPermitted('reporte:index')}">
	                <li class="${controllerName == 'reporte' ? 'active' : ''}">
	                    <a href="#"><i class="fa fa-area-chart"></i> <span class="nav-label"><g:message code="default.reports.label" /></span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                    	<shiro:hasPermission permission="trackingInfo:index">
	                    		<li class="${controllerName == 'reporte' && actionName == 'index' ? 'active' : ''}"><g:link controller="reporte" action="index"><g:message code="default.report.label" /></g:link></li>
	                    	</shiro:hasPermission>
	                    </ul>
	                </li>
                </g:if>
            </ul>

        </div>
    </nav>
    	

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
			<nav class="navbar navbar-static-top  " role="navigation" style="margin-bottom: 0">
	        <div class="navbar-header">
	            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
	            <div class="navbar-form-custom">
	                <div class="pull-right">
	                	
	                </div>
	            </div>
	        </div>
	            <ul class="nav navbar-top-links navbar-right">
	                <li>
	                	<g:link action="signOut" controller="auth">
							<i class="fa fa-sign-out"></i> <g:message code="default.logout.label" />
						</g:link>
	                </li>
	            </ul>
	
	        </nav>
        </div>
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-7">
                    <ol class="breadcrumb">
						
                    </ol>
                </div>
            </div>

            <div class="wrapper wrapper-content">
				<g:layoutBody />
            </div>
            
            
            <div class="footer">
                <div class="pull-right">
                   	Demo
                </div>
                <div>
                    <strong>Copyright</strong> Jefersson Nuñez &copy; 2017
                </div>
            </div>

        </div>
        </div>


    

	</body>
</html>
