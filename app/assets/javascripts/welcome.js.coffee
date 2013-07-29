# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  formatCode = (input) ->
    email = $(input).val()
    code = """<a href="mailto:#{email}" title="Pair program with me!">
                <img  src="http://pairprogramwith.me/assets/badge.svg"
                      alt="Pair program with me!" />
              </a>"""

  $('#get-badge-code').on 'submit', (e) ->
    $('.badge-code').html(formatCode('#badge-email')).
                    removeAttr('disabled').
                    removeClass('hide').
                    focus().select()
    false

  $('#badge-email').focus ->
    $('.badge-code').html('Code goes here when you submit your email').
                    attr('disabled', true)
