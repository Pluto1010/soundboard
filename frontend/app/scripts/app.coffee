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
  ]
  .config ($routeProvider, UrlConfig, RestangularProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .otherwise
        redirectTo: '/'

    RestangularProvider
      .setBaseUrl(UrlConfig.baseUrl)
      .setRequestSuffix('.json')

