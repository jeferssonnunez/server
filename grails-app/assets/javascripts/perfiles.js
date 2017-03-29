var urlBase = $("#urlBase").val();

$(document).ready(function() {
	
	var idPerfil;
	
	//DETECCIÓN DEL FORMULARIO BUSCAR PERFIL
    //---------------------------------------------------------------------------------------------------------------------------------
	$("form[name='form-search-perfil']").submit(function(event){
		$.ajax({
			type:'GET',
			url : urlBase + 'role/search',
			data : $(this).serialize(),
			success : function(data) {
				if (!data.ErrorUpdate) {
					$('#div-content-list-perfiles').html(data);
					$('.i-checks').iCheck({
				        checkboxClass: 'icheckbox_square-green',
				        radioClass: 'iradio_square-green'
				    });
				}else{
					alert('Ups!',data.error,'error');
				}
			},
			error : function() { // En caso de error en la petición
				alert('Ups!',"Ocurrió un error en la ejecución del proceso...",'error');
			}
		});
		event.preventDefault();
		return false;
	});
    //---------------------------------------------------------------------------------------------------------------------------------
	
	//PAGINACIÓN 
    //---------------------------------------------------------------------------------------------------------------------------------
	$('body').on('click','.mi-paginacion-ajax a', function(event){  
		var metodo = $(this).attr('href').split("?");
		var paginacion = $(this).attr('href').replace(metodo[0],urlBase + 'role/search' );
	    $.ajax({
	        url: paginacion,
	        data:{'query':$('#query').val()},
	        success:function(data){
	            $('#div-content-list-perfiles').hide().empty().html(data);
	            $('.i-checks').iCheck({
			        checkboxClass: 'icheckbox_square-green',
			        radioClass: 'iradio_square-green'
			    });
	        },
	        error:function(XMLHttpRequest,textStatus,errorThrown){
	        	alert('Ups!',"No se ha podido recuperar información del listado",'error');
	        },
	        complete:function(){
	            $('#div-content-list-perfiles').show();
	            $('.i-checks').iCheck({
			        checkboxClass: 'icheckbox_square-green',
			        radioClass: 'iradio_square-green'
			    });
	        }
	    });
	    event.preventDefault();
	});
    //---------------------------------------------------------------------------------------------------------------------------------
	
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