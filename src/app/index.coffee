angular.module "switchboard", [
  'ngAnimate'
  'ngCookies'
  'ngTouch'
  'ngSanitize'
  'restangular'
  'ui.router'
  'ui.bootstrap'
  'dndLists'
  'famous.angular'
]
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "app/main/main.html",
        controller: "MainCtrl"

    $urlRouterProvider.otherwise '/'

