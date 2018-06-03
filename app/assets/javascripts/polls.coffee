# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#custom-radios input[type=radio]").on "click", ->
    $("#mensaje_motivo").removeClass();
    @radio = $(this).val();
    if @radio == "3"
      $("#mensaje_motivo").addClass('alert-danger');
      $("h4.text_motivo").html("<h4>Presionaste el Botón de la Carita Triste</h4>");
      $("#motivo").slideDown();
    else if @radio == "2"
      $("#mensaje_motivo").addClass('alert-warning');
      $("h4.text_motivo").html("<h4>Presionaste el Botón de la Carita ni Fu ni Fa</h4>");
      $("#motivo").slideDown();
    else
      $("#mensaje_motivo").addClass('alert-success');
      $("h4.text_motivo").html("<h4>Presionaste el Botón de la Carita Feliz</h4>");
      $("#motivo").hide();
