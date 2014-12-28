angular.module "switchboard"
  .directive "filters", () ->
    templateUrl: 'components/filters/filters.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      console.log 'filter directive running'