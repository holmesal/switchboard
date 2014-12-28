angular.module "switchboard"
  .controller "MainCtrl", ($scope) ->

    $scope.draggableOptions = 
      revert: true
      revertDuration: 200