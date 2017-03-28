var urlBase = $("#urlBase").val();

$(document).ready(function() {
	
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    });
    
    
    /* VALIDA QUE SOLO SE SELECCIONE UN CHECKBOX A LA VEZ */
    /**********************************************************************************************************************************/
    $("body").on('ifChecked',"input[name='ckeckbox-usuarios']",function(event){
		var id = $(this).data('id');
		$('.fil').each(function(index,fila){
			var td = $(this).find("td").eq(0);
			if(td.find("input[name='ckeckbox-usuarios']").data('id') != id){
				$(td.find("input[name='ckeckbox-usuarios']")).iCheck('uncheck');
			}
		});
	});
    /**********************************************************************************************************************************/
    
    /* BORRAR FORMULARIOS DE MODALS CUANDO SE CIERRAN */
    /**********************************************************************************************************************************/
    $('#modal-adicionar-usuario').on('hidden.bs.modal', function (e) {
		$('#div-content-form-create-usuario').html('');
	});
    $('#modal-editar-usuario').on('hidden.bs.modal', function (e) {
		$('#div-content-form-edit-usuario').html('');
	});
    /**********************************************************************************************************************************/
    
    //DETECCIÓN DEL BOTÓN ADICIONAR USUARIO
    //---------------------------------------------------------------------------------------------------------------------------------
	$("#btn-adicionar-usuario").on('click',function(){
		$('.btn-guardar-modal').attr('disabled',false);
		//Borrar modal del tooltip al hacer click
		var r = $('.tooltip');
		r.remove();
		//---------------------------------------
		$.ajax({
			type : 'GET',
			url : urlBase + 'user/create',
			success : function(data) {
					$('#div-content-form-create-usuario').html(data);
					$('#params-query').val($('#query').val());
					 $('.chosen-select').chosen({
						no_results_text: '<i class="fa fa-exclamation-circle"></i> No se encontró nigún resultado <i class="fa fa-hand-o-right"></i>',
						allow_single_deselect: true,
						width: "68%"
					});
					 var today = convertDate();
					 $(".fechaNacimiento").datepicker({
						autoclose : true,
						todayHighlight : true,
						format : 'dd/mm/yyyy',
						language : 'es',
						endDate : today
					});
					$('#modal-adicionar-usuario').modal('show');
			},
			error : function() { // En caso de error en la petición
				alert('Ups!',"Ocurrió un error en la ejecución del proceso...",'error');
			}
		});
	});
	//---------------------------------------------------------------------------------------------------------------------------------
    
	//DETECCIÓN DEL FORMULARIO CREAR USUARIO
    //---------------------------------------------------------------------------------------------------------------------------------
	$("form[name='form-create-usuario']").submit(function(event){
		$('.btn-guardar-modal').attr('disabled',true);
		$.ajax({
			type : 'POST',
			url : urlBase + 'user/create',
			data : $(this).serialize(),
			success : function(data) {
				if(data.split('@')[0] == 'error'){
					alert('Ups!',data.split('@')[1],'error');
					$('.btn-guardar-modal').attr('disabled',false);
				}else{
					alert('Correcto',"Se guardó exitosamente",'success');
					$('#div-content-list-usuarios').html(data);
					$('.i-checks').iCheck({
				        checkboxClass: 'icheckbox_square-green',
				        radioClass: 'iradio_square-green'
				    });
					$('#modal-adicionar-usuario').modal('hide');
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
	
	//DETECCIÓN DEL BOTÓN EDITAR USUARIO
    //---------------------------------------------------------------------------------------------------------------------------------
	$("#btn-editar-usuario").on('click',function(){
		//Borrar modal del tooltip al hacer click
		var r = $('.tooltip');
		r.remove();
		//---------------------------------------
		var count = 0;
		$('.fil').each( function(i, d){
			var td = $(this).find("td");
			var id = $(this).data('id');
			var checked = td.eq(0).find('.i-checks').is(':checked');
			if(checked){
				count = count + 1;
				idUsuario = id;
			}
		});
		
		if (count == 1){
			$('.btn-guardar-modal').attr('disabled',false);
			$.ajax({
				type : 'GET',
				url : urlBase + 'user/edit',
				data:{'id':idUsuario},
				success : function(data) {
					if (!data.ErrorUpdate) {
						$('#div-content-form-edit-usuario').html(data);
						$('.div-content-password').html('');
						//$('.div-content-correo').html('');
						$('#params-query').val($('#query').val());
						$('.chosen-select').chosen({
							no_results_text: '<i class="fa fa-exclamation-circle"></i> No se encontró nigún resultado <i class="fa fa-hand-o-right"></i>',
							allow_single_deselect: true,
							width: "68%"
						});
						 var today = convertDate();
						$(".fechaNacimiento").datepicker({
							autoclose : true,
							todayHighlight : true,
							format : 'dd/mm/yyyy',
							language : 'es',
							endDate : today
						});
						$('#modal-editar-usuario').modal('show');
					}else{
						alert('Ups!',data.error,'error');
					}
				},
				error : function() { // En caso de error en la petición
					alert('Ups!',"Ocurrió un error en la ejecución del proceso...",'error');
				}
			});
		}else{
			alert('Ups!',"Se debe seleccionar un usuario",'warning');
		}
	});
	//---------------------------------------------------------------------------------------------------------------------------------
	
	//DETECCIÓN DEL FORMULARIO EDITAR USUARIO
    //---------------------------------------------------------------------------------------------------------------------------------
	$("form[name='form-edit-user']").submit(function(event){
		$('.btn-guardar-modal').attr('disabled',true);
		$.ajax({
			type : 'POST',
			url : urlBase + 'user/edit/'+idUsuario,
			data : $(this).serialize(),
			success : function(data) {
				if(data.split('@')[0] == 'error'){
					alert('Ups!',data.split('@')[1],'error');
					$('.btn-guardar-modal').attr('disabled',false);
				}else{
					if (!data.ErrorUpdate) {
						alert('Correcto',"Se editó correctamente",'success');
						$('#div-content-list-usuarios').html(data);
						$('.i-checks').iCheck({
					        checkboxClass: 'icheckbox_square-green',
					        radioClass: 'iradio_square-green'
					    });
						$('#modal-editar-usuario').modal('hide');
					}else{
						alert('Ups!',"Otro usuario actualizó mientras editaba",'error');
						setTimeout($(location).attr('href', urlBase+'user/index'), 2000);	
					}
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
	
	//DETECCIÓN DEL BOTÓN ELIMINAR USUARIO
    //---------------------------------------------------------------------------------------------------------------------------------
	$("#btn-eliminar-usuario").on('click',function(){
		//Borrar modal del tooltip al hacer click
		var r = $('.tooltip');
		r.remove();
		//---------------------------------------
		var count = 0;
		$('.fil').each( function(i, d){
			var td = $(this).find("td");
			var checked = td.eq(0).find('.i-checks').is(':checked');
			if(checked){
				count = count + 1;
			}
		});
		
		if(count == 1){
			$('#div-content-delete-usuario').html('Esta seguro de eliminar este usuario?');
			$('.btn-guardar-modal').attr('disabled',false);
			$('#modal-eliminar-usuario').modal('show');
		}else{
			alert('Ups!',"Se debe seleccionar un usuario",'warning');
		}
	});
	//---------------------------------------------------------------------------------------------------------------------------------
	
	//DETECCIÓN DEL BOTÓN CONFIRMAR ELIMINAR USUARIO
    //---------------------------------------------------------------------------------------------------------------------------------
	$(".btn-confirmar-eliminar-usuario").on('click',function(){
		$('.btn-guardar-modal').attr('disabled',true);
		
		$('.fil').each( function(i, d){
			var td = $(this).find("td");
			var id = $(this).data('id');
			var checked = td.eq(0).find('.i-checks').is(':checked');
			if(checked){
				$.ajax({
					type:'POST',
					url : urlBase + 'user/delete/'+id,
					data: {'query':$('#query').val()},
					success : function(data) {
						if (!data.ErrorUpdate) {
							
								$('#div-content-list-usuarios').html(data);
								$('#modal-eliminar-usuario').modal('hide');
								alert('Correcto',"Se eliminó exitosamente el usuario",'success');
								$('.i-checks').iCheck({
							        checkboxClass: 'icheckbox_square-green',
							        radioClass: 'iradio_square-green'
							    });
							
							
						}else{
							alert('Ups!',data.error,'error');
							$('.btn-guardar-modal').attr('disabled',false);
						}
					},
					error : function() { // En caso de error en la petición
						alert('Ups!',"Ocurrió un error en la ejecución del proceso...",'error');
					}
				});
			}
		});
		
	});
    //---------------------------------------------------------------------------------------------------------------------------------
	
	//DETECCIÓN DEL FORMULARIO BUSCAR USUARIO
    //---------------------------------------------------------------------------------------------------------------------------------
	$("form[name='form-search-usuario']").submit(function(event){
		$.ajax({
			type:'GET',
			url : urlBase + 'user/search',
			data : $(this).serialize(),
			success : function(data) {
				if (!data.ErrorUpdate) {
					$('#div-content-list-usuarios').html(data);
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
		var paginacion = $(this).attr('href').replace(metodo[0],urlBase + 'user/search' );
	    $.ajax({
	        url: paginacion,
	        data:{'query':$('#query').val()},
	        success:function(data){
	            $('#div-content-list-usuarios').hide().empty().html(data);
	            $('.i-checks').iCheck({
			        checkboxClass: 'icheckbox_square-green',
			        radioClass: 'iradio_square-green'
			    });
	        },
	        error:function(XMLHttpRequest,textStatus,errorThrown){
	        	alert('Ups!',"No se ha podido recuperar información del listado",'error');
	        },
	        complete:function(){
	            $('#div-content-list-usuarios').show();
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

//Da formato a fechas
function convertDate() {
	  function pad(s) { return (s < 10) ? '0' + s : s; }
	  var d = new Date();
	  return [pad(d.getDate()), pad(d.getMonth()+1), d.getFullYear()].join('/');
	}

function alert(title,text,type  ){
	toastr.options = {
            closeButton: true,
            progressBar: true,
            showMethod: 'slideDown',
            timeOut: 4000
        };
    toastr[type](text, title);
}
