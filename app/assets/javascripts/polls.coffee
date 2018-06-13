# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#custom-radios input[type=radio]").on "click", ->
    $("#mensaje_motivo").removeClass();
    $("#agregar").show();
    @radio = $(this).val();
    $("#mensaje_motivo").css('border', 'solid 3px');
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

  $("#user_rut").blur ->
    @rut = $("#user_rut").val()
    new_rut = formateaRut @rut
    $("#user_rut").val( new_rut );
    if Valida_Rut new_rut
      $.ajax '/users/search_user',
        type: 'GET',
        dataType: 'JSON',
        data:
          rut: new_rut,
        asnyc: false,
        success: (data) ->
          console.log(data.nombre)
          document.getElementById('user_polls_attributes_0_user_id').value = data.id;
          document.getElementById('user_nombre').value = data.nombre;
          document.getElementById('user_nombre').disabled = true;
          document.getElementById('user_genero').value = data.genero;
          document.getElementById('user_genero').disabled = true;
          document.getElementById('fnacimiento').value = data.fnacimiento;
          document.getElementById('fnacimiento').disabled = true;
    else
      console.log("rut incorrecto")

  Highcharts.setOptions(Highcharts.theme);


Valida_Rut = ( objeto ) ->
  i = undefined
  s = undefined
  f = undefined
  bueno = undefined
  f = '32765432'
  r = objeto
  largo = r.length - 2
  bueno = false
  s = 0
  i = 0
  while i < largo
    s = s + parseInt(r.charAt(i)) * parseInt(f.charAt(i))
    i++
  dv = 11 - (s % 11)
  if dv == 10 and (r.charAt(9) == 'K' or r.charAt(9) == 'k')
    bueno = true
  else
    if dv == 11 and r.charAt(9) == '0'
      bueno = true
    else
      if dv == parseInt(r.charAt(9))
        bueno = true
      else
        bueno = false
  return bueno


formateaRut = (rut) ->
  actual = rut.replace(/^0+/, '')
  if actual != '' and actual.length > 1
    sinPuntos = actual.replace(/\./g, '')
    actualLimpio = sinPuntos.replace(/-/g, '')
    inicio = actualLimpio.substring(0, actualLimpio.length - 1)
    rutPuntos = ''
    i = 0
    j = 1
    i = inicio.length - 1
    while i >= 0
      letra = inicio.charAt(i)
      rutPuntos = letra + rutPuntos
      if j % 3 == 0 and j <= inicio.length - 1
        rutPuntos = rutPuntos
      j++
      i--
    dv = actualLimpio.substring(actualLimpio.length - 1)
    rutPuntos = rutPuntos + '-' + dv
  rutPuntos


Highcharts.theme =
colors: [
  '#7cb5ec'
  '#f7a35c'
  '#90ee7e'
  '#7798BF'
  '#aaeeee'
  '#ff0066'
  '#eeaaee'
  '#55BF3B'
  '#DF5353'
  '#7798BF'
  '#aaeeee'
]
chart:
  backgroundColor: null
  style: fontFamily: 'Dosis, sans-serif'
title: style:
  fontSize: '16px'
  fontWeight: 'bold'
  textTransform: 'uppercase'
tooltip:
  borderWidth: 0
  backgroundColor: 'rgba(219,219,216,0.8)'
  shadow: false
legend: itemStyle:
  fontWeight: 'bold'
  fontSize: '13px'
xAxis:
  gridLineWidth: 1
  labels: style: fontSize: '12px'
yAxis:
  minorTickInterval: 'auto'
  title: style: textTransform: 'uppercase'
  labels: style: fontSize: '12px'
plotOptions: candlestick: lineColor: '#404048'
background2: '#F0F0EA'
