$ ->
  # Component elements
  $backToTopButton = $('.c-back-to-top')

  # Scroll functionality
  window.onscroll = ->
    scrollTrigger()
  scrollTrigger = ->
    if $backToTopButton.length >= -1 and document.body.scrollTop > 20 or document.documentElement.scrollTop > 20
      $backToTopButton.show()
    else
      $backToTopButton.hide()
  scrollToTop = ->
    document.body.scrollTop = 0
    document.documentElement.scrollTop = 0

  $backToTopButton.on 'click', ->
    scrollToTop()
