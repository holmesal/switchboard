angular.module "switchboard"
  .controller "MainCtrl", ($scope, $interval, $window) ->

    # FAKE DATA

    $scope.items = [
      type: 'synth'
      name: 'Bass Buzzer'
      id: 0
    ,
      type: 'synth'
      name: 'BrassMonster'
      id: 1
    ,
      type: 'sample'
      name: 'Booma Peow'
      id: 2
    ,
      type: 'synth'
      name: 'Alonso-d-lux'
      id: 3
    ,
      type: 'sample'
      name: 'z-band'
      id: 4
    ,
      type: 'sample'
      name: 'apollo'
      id: 5
    ,
      type: 'sample'
      name: 'wassup'
      id: 6
    ,
      type: 'synth'
      name: 'overtones'
      id: 7
    ,
      type: 'sample'
      name: 'lols'
      id: 8
    ]

    $scope.set = []
    $scope.trash = []
    # $scope.set.push
    #   name: 'zwopwop'
    #   items: $scope.items
    # for i in [0...100]
    $scope.set.push
      name: 'alonso'
      items: [$scope.items[0]]

    $scope.set.push
      name: 'another'
      items: [$scope.items[2]]

    # /FAKE DATA

    # $interval ->
    #   n = Date.now().toString()
    #   last = n[n.length-1]
    #   $scope.items[0].name = "Bass Buzzer #{last}"
    # , 200

    $scope.getSourceClass = (item) ->
      c = item.type
      if item.id in $scope.used.all
        c += ' used'
      return c

    $scope.getScrollviewHeight = ->
      # tooo - fix this
      available = $window.innerHeight - 54 - 68 - 50
      return "#{available}px"



    # Watch for used synths to recalculate quotas and to fade already-used sources
    $scope.$watch 'set', (set) ->
      console.log 'set changed!'
      console.log set
      # Calculate the used synths
      $scope.used =
        all: []
        synths: []
        samples: []
      for folder in set
        for item in folder.items
          $scope.used.all.push item.id
          if item.type is 'sample'
            $scope.used.samples.push item.id 
          else if item.type is 'synth'
            $scope.used.synths.push item.id
      console.log $scope.used
    , true

    # todo - 
    # fade source synths after they've been added once
    # allow re-arranging


    $scope.dragOver = (item) ->
      console.log 'dragover: '
      console.log item
      false

    $scope.drop = (item, folder) ->
      console.log item
      unless (existing for existing in folder.items when existing.id is item.id).length > 0
        return $scope.items[item.id]
      else
        console.info 'not allowing drop because item is already in list'
        return false

    # $scope.draggableOptions =
    #   revert: 'invalid'
    #   revertDuration: 200

    # $scope.droppableOptions =
    #   accept: ->
    #     console.log 'checking if accepted'
    #     true

    # $scope.startedDragging = (ev, ui, item) ->
    #   $scope.currentlyDragging = item
    #   item.dragging = true

    # resetDrag = () ->
    #   console.log 'resetting drag'
    #   $scope.currentlyDragging.dragging = false
    #   $scope.currentlyDragging = null

    # $scope.stoppedDragging = (ev, ui, item) ->
    #   console.log 'should reset drag here'
    #   # resetDrag()

    # $scope.draggedOver = (ev, ui, folder) ->
    #   # unless this item is in the list, drop it in
    #   unless (item for item in folder.items when item.id is $scope.currentlyDragging.id).length > 0
    #     console.log 'does not exist, pushing!'
    #     folder.items.push $scope.currentlyDragging

    # $scope.draggedOut = (ev, ui, folder) ->
    #   idx = folder.items.indexOf($scope.currentlyDragging)
    #   console.log "dragged out - removing item #{idx}"
    #   folder.items.splice idx, 1

    # $scope.dropped = (ev, ui, folder) ->
    #   # remove the last item, which is always provisional
    #   idx = folder.items.indexOf($scope.currentlyDragging)
    #   console.log "dropped - removing item #{idx}"
    #   folder.items.splice idx, 1
