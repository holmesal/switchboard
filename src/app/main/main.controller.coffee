angular.module "switchboard"
  .controller "MainCtrl", ($scope, $interval) ->

    # FAKE DATA

    $scope.items = [
      type: 'synth'
      name: 'Bass Buzzer'
      id: 1
    ,
      type: 'synth'
      name: 'BrassMonster'
      id: 2
    ,
      type: 'sample'
      name: 'Booma Peow'
      id: 3
    ,
      type: 'synth'
      name: 'Alonso-d-lux'
      id: 4
    ,
      type: 'sample'
      name: 'z-band'
      id: 5
    ]

    $scope.set = []
    # $scope.set.push
    #   name: 'zwopwop'
    #   items: $scope.items
    $scope.set.push
      name: 'alonso'
      items: [$scope.items[0]]

    # /FAKE DATA

    $interval ->
      $scope.items[0].name = "Bass Buzzer #{Date.now()}"



    $scope.draggableOptions = 
      revert: 'invalid'
      revertDuration: 200

    # $scope.droppableOptions = 
    #   accept: ->
    #     console.log 'checking if accepted'
    #     true

    $scope.startedDragging = (ev, ui, item) ->
      $scope.currentlyDragging = item
      item.dragging = true

    resetDrag = () ->
      console.log 'resetting drag'
      $scope.currentlyDragging.dragging = false
      $scope.currentlyDragging = null

    $scope.stoppedDragging = (ev, ui, item) ->
      console.log 'should reset drag here'
      # resetDrag()

    $scope.draggedOver = (ev, ui, folder) ->
      # unless this item is in the list, drop it in
      unless (item for item in folder.items when item.id is $scope.currentlyDragging.id).length > 0
        console.log 'does not exist, pushing!'
        folder.items.push $scope.currentlyDragging

    $scope.draggedOut = (ev, ui, folder) ->
      idx = folder.items.indexOf($scope.currentlyDragging)
      console.log "dragged out - removing item #{idx}"
      folder.items.splice idx, 1

    $scope.dropped = (ev, ui, folder) ->
      # remove the last item, which is always provisional
      idx = folder.items.indexOf($scope.currentlyDragging)
      console.log "dropped - removing item #{idx}"
      folder.items.splice idx, 1
