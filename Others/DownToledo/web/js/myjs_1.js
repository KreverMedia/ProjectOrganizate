/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*$(function (){*/
$(document).ready(function() {
    console.log('ready');
    init();
});

function init(){
    // menú collapse
    $(".button-collapse").sideNav();
    
    // select
    $('select').material_select();
    
    //modales   
    $('#modal1').modal();
    $('#modal1').modal();
    $('.modal-trigger').modal();
    
    // Listener para guardar categoria
    saveCategoria();
}

var saveCategoria = function(){	
        $("#savecat").click(function (e){
                console.log('savecat');
                e.preventDefault();
                var frm = $("#formnuevacategoria").serialize();
                $.ajax({
                        type: "POST",
                        url: "controller.jsp?op=addcategoria",
                        data: frm,
                        success : function(info) {
                            console.log('sucess savecat');
                            console.log(info);
                            var categoria=$("#newcategoria").val();
                            $("#newcategoria").val('');
                            $("#selectcategoria").html(info);
                            $('select').material_select(); // Imprescindible para volver a construir el select con los nuevos options
                            Materialize.toast('Insertada categoria '+categoria+'...', 4000, 'rounded');
                        }
                });
        });
}
