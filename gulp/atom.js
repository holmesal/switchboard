'use strict';

var gulp = require('gulp');

var downloadatomshell = require('gulp-download-atom-shell');

var colors = require('colors');

var shell = require('gulp-shell');

var spawn = require('child_process').spawn;

var running = null;

var log = function(args){
  var sig = '['+colors.green('atom')+']';
  var args = Array.prototype.slice.call(arguments);
  args.unshift(sig);
  console.log.apply(console, args);
}

var stderr = function(args){
  var sig = '['+colors.cyan('atom')+']';
  var args = Array.prototype.slice.call(arguments);
  args.unshift(sig);
  console.log.apply(console, args);
}

gulp.task('downloadatomshell', function(cb){
    downloadatomshell({
        version: '0.20.2',
        outputDir: 'binaries'
    }, cb);
});

var launch = function(){
  log('launching atom-shell');
  running = spawn('./Atom', [__dirname + '/../'], {cwd: __dirname + '/../binaries/Atom.app/Contents/MacOS'});

  running.stdout.on('data', function (data) {
    log(data.toString());
  });

  running.stderr.on('data', function (data) {
    stderr(data.toString());
  });

  running.on('exit', function (code) {
    log('child process exited with code ' + code);
    if(code === 0){
      log('killing gulp :-(');
      process.exit();
    }
  });
}

gulp.task('atom', ['scripts'], function(){
  if(running){
    // var delay = 2000;
    // log('waiting ' + delay + 'ms...');
    running.kill();
    // setTimeout(launch, delay);
    launch();
  } else {
    log('starting atom-shell');
    gulp.watch('src/atom.coffee', ['atom']);
    launch();
  }

  
});