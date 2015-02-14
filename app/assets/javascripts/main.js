var app = angular.module('Todo', ['ngResource', "ngRoute", "ngMessages", "templates", 'ui.bootstrap', 'mgcrea.ngStrap', 'ui.sortable', 'angularFileUpload']);

app.config(["$routeProvider", "$locationProvider", function($routeProvider, $locationProvider) {
    $routeProvider.when("/main", {
      templateUrl: 'angular/templates/index.html',
      controller: "ProjectsController"
    });

    return $routeProvider.otherwise({
      redirectTo: "/main"
    });
  }
]);
