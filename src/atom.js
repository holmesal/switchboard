var app = require('app');  // Module to control application life.
var BrowserWindow = require('browser-window');  // Module to create native browser window.

// Report crashes to our server.
require('crash-reporter').start();

// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the javascript object is GCed.
var mainWindow = null;

// Quit when all windows are closed.
app.on('window-all-closed', function() {
  if (process.platform != 'darwin')
    app.quit();
});

// This method will be called when atom-shell has done everything
// initialization and ready for creating browser windows.
app.on('ready', function() {
  // Create the browser window.
  mainWindow = new BrowserWindow({
    width: 960, 
    height: 700, 
    'min-width': 900,
    'min-height': 600,
    frame: false});

  // and load the index.html of the app.
  // mainWindow.loadUrl('file://' + __dirname + '/../dist/index.html');
  mainWindow.loadUrl('http://localhost:3000');

  // Emitted when the window is closed.
  mainWindow.on('closed', function() {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    mainWindow = null;
  });


  // In browser.
  var ipc = require('ipc');
  ipc.on('openFilepicker', function(event, arg) {
    console.log("got open-filepicker message");  // prints "ping"
    // event.sender.send('asynchronous-reply', 'pong');
    var dialog = require('dialog');
    console.log(dialog.showOpenDialog({ properties: [ 'openFile', 'openDirectory', 'multiSelections' ]}));
    
  });
});