# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.store .decrement_cell > input').click ->
    $(this).parent().parent().parent().paranet().css({'background-color':'blue'}).animate({'background-color':'#114411'}, 1000);

