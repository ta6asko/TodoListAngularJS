app.directive('dp', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
         link: function (scope, element, attrs, TasksCtrl) {
            element.datepicker({
                dateFormat: 'dd,  MM, yy',
                onSelect: function (date) {
                    scope.newTask.deadline = date;
                    scope.$apply();
                }
            });
        }
    };
});

