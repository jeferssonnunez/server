<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login</title>
    
    <asset:stylesheet src="bootstrap.min.css" />
    <asset:stylesheet src="font-awesome/css/font-awesome.css" />
    <asset:stylesheet src="animate.css" />
    <asset:stylesheet src="style.css" />

</head>

<body class="gray-bg">

    <div class="loginColumns animated fadeInDown">
        <div class="row">

            <div class="col-md-6">
                <h2 class="font-bold"><g:message code="my.welcome.code" /></h2>

                <p>
                    <g:message code="my.paragraph.code" />
                </p>

                <p>
                    <g:message code="my.paragraphTwo.code" />
                </p>

                <p>
                    <g:message code="my.paragraphThree.code" />
                </p>

                <p>
                    <small><g:message code="my.paragraphFour.code" /></small>
                </p>

            </div>
            <div class="col-md-6">
                <div class="ibox-content">
                	<g:if test="${flash.message}">
					    <div class="message">${flash.message}</div>
					</g:if>
                    <form class="m-t" role="form" action="signIn">
                    	<input type="hidden" name="targetUri" value="${targetUri}" />
                        <div class="form-group">
                            <input type="text" class="form-control" name="username"  placeholder="<g:message code="my.username.code" />" required="" value="${username}">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="<g:message code="my.password.code" />" required="" name="password" value="">
                        </div>
                        <button type="submit" class="btn btn-primary block full-width m-b"><g:message code="my.login.code" /></button>

                      

                       
                    </form>
                    <p class="m-t">
                        <small><g:message code="my.framework.code" /> &copy; 2017</small>
                    </p>
                </div>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-md-6">
                Copyright Jefersson Nuñez Nava
            </div>
            <div class="col-md-6 text-right">
               <small>© 2017</small>
            </div>
        </div>
    </div>

</body>

</html>



