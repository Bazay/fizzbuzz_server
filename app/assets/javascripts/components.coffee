$ ->
  # Scroll functionality
  window.onscroll = ->
    scrollTrigger()
  scrollTrigger = ->
    if document.body.scrollTop > 20 or document.documentElement.scrollTop > 20
      $(document).find('.c-back-to-top').show()
    else
      $(document).find('.c-back-to-top').hide()
  scrollToTop = ->
    document.body.scrollTop = 0
    document.documentElement.scrollTop = 0

  # Listeners
  $(document).on 'click', '.c-back-to-top', ->
    scrollToTop()
  $(document).on 'click', '.b-fizz-buzz-item-favourite', ->
    toggleFavouriteFizzBuzz @

  # Favourite functionality
  # If time permitted, entire front-end would be implemented with javascript framework e.g. Marionette.js
  toggleFavouriteFizzBuzz = (el) ->
    $el = $(el).find('.l-fizz-buzz-favourite-icon')
    fizzBuzzNumber = $el.data 'number'
    fizzBuzzIsFavourite = $el.hasClass 'glyphicon-star'
    $.ajax
      url: '/api/v1.0/fizz_buzz'
      type: 'POST'
      data:
        fizz_buzz:
          number: fizzBuzzNumber
          favourite: !fizzBuzzIsFavourite
      success: =>
        updateFizzBuzzFavourite $el, !fizzBuzzIsFavourite

  updateFizzBuzzFavourite = ($el, isFavourite) ->
    if isFavourite
      $el.removeClass 'glyphicon-star-empty'
      $el.addClass 'glyphicon-star'
    else
      $el.addClass 'glyphicon-star-empty'
      $el.removeClass 'glyphicon-star'

