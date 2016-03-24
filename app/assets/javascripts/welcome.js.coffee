# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  mode = "email"

  twitterHref = (handle) ->
    message = encodeURIComponent "DM #{handle} Are you interested in pairing on <DESCRIPTION>?"
    "https://twitter.com/intent/tweet?text=#{message}"

  emailHref = (email) ->
    email = encodeURIComponent email
    subject = encodeURIComponent 'Pair program with me'
    "mailto:#{email}?subject=#{subject}"

  formatCode = (input) ->
    value = $(input).val()
    href = switch mode
      when 'email'
        emailHref value
      when 'twitter'
        twitterHref value
    """<a href="#{href}" title="Pair program with me!">
         <img  src="http://pairprogramwith.me/badge.png"
               alt="Pair program with me!" />
       </a>"""

  $('#get-badge-code').on 'submit', (e) ->
    $('.badge-code').html(formatCode("#badge-#{mode}")).
                    removeAttr('disabled').
                    removeClass('hide').
                    focus().select()
    false

  $('#badge-email,#badge-twitter').focus ->
    $('.badge-code').html('Code goes here when you submit').
                    attr('disabled', true)

  $('#pick-email,#pick-twitter').click ({target}) ->
    $('#badge-email,#badge-twitter').removeClass('hide')
    $('#pick-email,#pick-twitter').removeClass('active')
    switch $(target).attr('id')
      when 'pick-email'
        mode = 'email'
        $('#badge-twitter').addClass('hide')
        $('#pick-email').addClass('active')
      when 'pick-twitter'
        mode = 'twitter'
        $('#badge-email').addClass('hide')
        $('#pick-twitter').addClass('active')
