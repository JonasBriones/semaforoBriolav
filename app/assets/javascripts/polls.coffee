# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("input[type=radio]").on "click", ->
    @radio = $(this).val();
    if @radio == "-1"
      $('#motivo').show();
    else
      $('#motivo').hide();
