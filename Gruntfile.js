module.exports = function(grunt) {

  'use strict';

  var pkg = grunt.file.readJSON('package.json');

  grunt.initConfig({
    pkg: pkg,

    hogan: {
      precompile: {
        options: {
          prettify: true,
          namespace: "JST",
          defaultName: function(filename) {
            filename = filename.replace(/app\/assets\/javascripts\/templates\//g, '');
            return filename.split(".")[0];
          },
          amdWrapper: false
        },
        files: {
          'app/assets/javascripts/templates/template.js':
            [ 'app/assets/javascripts/templates/**/*.mustache' ]
        }
      }
    },

    watch: {
      hogan_precompile: {
        files: ['app/assets/javascripts/templates/**/*.mustache'],
        tasks: ['hogan:precompile']
      }
    }
  });

  var taskName;
  for(taskName in pkg.devDependencies) {
    if(taskName.substring(0, 6) == 'grunt-') {
      grunt.loadNpmTasks(taskName);
    }
  }

  grunt.registerTask('default', ['watch']);

};