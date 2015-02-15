app.directive "dp", ->
  restrict: "A"
  require: "ngModel"
  link: (scope, element, attrs, TasksCtrl) ->
    element.datepicker
      dateFormat: "dd,  MM, yy"
      onSelect: (date) ->
        scope.newTask.deadline = date
        scope.$apply()
