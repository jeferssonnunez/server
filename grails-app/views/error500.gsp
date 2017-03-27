<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>500 Error</title>

	<asset:stylesheet src="bootstrap.min.css" />
    <asset:stylesheet src="font-awesome/css/font-awesome.css" />
	<asset:stylesheet src="animate.css" />
    <asset:stylesheet src="style.css" />

</head>

<body class="gray-bg">


    <div class="middle-box text-center animated fadeInDown">
        <h1>500</h1>
        <h3 class="font-bold"><g:message code="my.error500.code" /></h3>

        <div class="error-desc">
        	<g:message code="my.error.code" />
            <br/><a href="auth/login" class="btn btn-primary m-t"><g:message code="my.inicio.code" /></a>
        </div>
    </div>

    <!-- Mainly scripts -->
    <asset:javascript src="jquery-2.1.1.js" />
    <asset:javascript src="bootstrap.min.js" />

</body>

</html>
