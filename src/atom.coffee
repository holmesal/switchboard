app = require 'app'
BrowserWindow = require 'browser-window'
crashstagram = require 'crash-reporter'
ipc = require 'ipc'
dialog = require 'dialog'

# ward off evil spirits
mainWindow = null

# clean yo-self up
app.on 'window-all-closed', ->
  unless process.platform is 'darwin'
    app.quit()

# ready set go
app.on 'ready', ->

  console.log 'ello ello there wasssup'

  # bootstrap the main window

  mainWindow = new BrowserWindow
    width: 960,
    height: 700,
    'min-width': 900,
    'min-height': 600,
    frame: false
    fullscreen: false

  mainWindow.loadUrl 'http://localhost:3000'

  mainWindow.on 'closed', ->
    mainWindow = null

  # listen for some events
  ipc.on 'openFilepicker', (ev, data) ->
    console.log 'opening filepicker...'
    dialog.showOpenDialog
      properties: ['openFile', 'openDirectory', 'multiSelections']


