'use strict'

###*
 # @ngdoc overview
 # @name soundboardApp
 # @description
 # # soundboardApp
 #
 # Main module of the application.
###
angular
  .module 'soundboardApp', [
    'ngAnimate'
    'ngResource'
    'ngRoute'
    'ngSanitize'
    'ngTouch'
    'SoundboardConfig'
    'restangular'
    'angular-flash.service'
    'angular-flash.flash-alert-directive'
    'ngFileUpload'
    'ngBootbox'
  ]
  .config ($routeProvider, flashProvider, UrlConfig, RestangularProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/edit/:id',
        templateUrl: 'views/edit.html'
        controller: 'EditCtrl'
      .when '/new',
        templateUrl: 'views/edit.html'
        controller: 'EditCtrl'
      .otherwise
        redirectTo: '/'

    flashProvider.errorClassnames.push('alert-danger');

    RestangularProvider
      .setBaseUrl(UrlConfig.baseUrl)
      .setRequestSuffix('.json')
