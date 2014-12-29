'use strict';

var gulp = require('gulp');

var downloadatomshell = require('gulp-download-atom-shell');

var shell = require('gulp-shell');

gulp.task('downloadatomshell', function(cb){
    downloadatomshell({
        version: '0.20.2',
        outputDir: 'binaries'
    }, cb);
});

gulp.task('atom', shell.task([
    'binaries/Atom.app/Contents/MacOS/Atom ./'
]));