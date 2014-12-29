angular.module "switchboard"
  .directive "freespace", ($famous, $timeout, $interval) ->
    templateUrl: 'components/freespace/freespace.html'
    restrict: 'E'
    scope:
      current: '='
    link: (scope, element, attrs) ->
      # loading famou.us directives
      Transitionable = $famous['famous/transitions/Transitionable']

      # options to be broken out into a directive later
      chunks = 16
      scope.height = 8
      duration = 500


      scope.dividers = [0...chunks]

      scope.gridOptions = 
        dimensions: [scope.dividers.length, 1]
        gutterSize: [0,0]

      scope.progress = new Transitionable 0
      # scope.current = 0 unless scope.current

      scope.$watch 'current', (current) ->
        target = scope.current/chunks
        console.info "moving to to #{current} ---> #{target}"
        scope.progress.set target,
          duration: duration
          curve: 'easeInOut'

        $timeout scope.setLabel, duration * 0.8

      scope.setLabel = ->
        scope.label = "#{scope.current} #{scope.noun}"
        scope.label += 's' if scope.current isnt 1

      scope.setLabel()

      # $interval ->
      #   scope.current += 1
      #   if scope.current > chunks
      #     scope.current = 0
      # , 1000
