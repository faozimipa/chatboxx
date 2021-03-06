angular.module('noAnimateToCenter', [])

.directive 'noanimatetocenter', ($window) ->
  (scope, element, attr) ->

    speed = parseInt attr.noanimatespeed || 1000
    offsetx = parseInt attr.noanimateoffsetx || 0
    offsety = parseInt attr.noanimateoffsety || 0
    x = ($window.innerHeight / 2) - (element.height() / 2) + offsetx
    y = ($window.innerWidth / 2) - (element.width() / 2) + offsety

    console.log 'params: ' + offsetx + ',' + offsety + ',' + speed

    w = attr.noanimatewidth || element.width()
    h = attr.noanimateheight || element.height()

    element.css
      left: 0 + 'px'
      top: 0 + 'px'
      width: 0 + 'px'
      height: 0 + 'px'

    element.animate
      top: x + 'px'
      left: y + 'px'
      width: w + 'px'
      height: h + 'px'
    , speed, () ->
      element.removeAttr 'noanimatetocenter'
