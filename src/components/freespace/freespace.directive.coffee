angular.module "switchboard"
  .directive "freespace", ($famous, $timeout, $interval) ->
    templateUrl: 'components/freespace/freespace.html'
    restrict: 'E'
    scope:
      current: '='
      capacity: '='
      height: '='
      color: '='
      layout: '='
      noun: '='
    link: (scope, element, attrs) ->
      # loading famou.us directives
      Transitionable = $famous['famous/transitions/Transitionable']

      # options to be broken out into a directive later
      # capacity = 16
      duration = 500


      scope.dividers = [0...scope.capacity]

      scope.gridOptions =
        dimensions: [scope.dividers.length, 1]
        gutterSize: [0,0]

      scope.progress = new Transitionable 0
      scope.current = 0 unless scope.current
      scope.layout = 'top' unless scope.layout

      scope.layouts =
        indicator:
          translate:
            top: [0,-17,0]
            bottom: [0,17,0]
          rotate:
            top: 0
            bottom: Math.PI
        value:
          translate:
            top: [0,-36,0]
            bottom: [0,36,0]

      scope.$watch 'current', (current) ->
        target = scope.current/scope.capacity
        # console.info "moving to to #{current} ---> #{target}"
        scope.progress.set target,
          duration: duration
          curve: 'easeInOut'

        $timeout scope.setLabel, duration * 0.8

      scope.setLabel = ->
        scope.label = "#{scope.current} #{scope.noun}"
        scope.label += 's' if scope.current isnt 1

      scope.setLabel()

      $timeout ->
        $interval ->
          scope.current += 1
          if scope.current > scope.capacity
            scope.current = 0
        , 1000
      , Math.random()*3000
