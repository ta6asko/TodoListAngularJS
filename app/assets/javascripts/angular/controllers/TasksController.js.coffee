app.controller "TasksController", [ "$scope", "Task", 
($scope, Task) ->
  
  $scope.newTask = {}

  $scope.createTask = (project_id) ->
    task = Task.save(
      task:
        title: $scope.newTask.title
        deadline: $scope.newTask.deadline
      project_id: project_id
    )
    $scope.project.tasks.push task
    $scope.newTask = {}

  $scope.updateTask = (project_id, task_id, task) ->
    Task.update
      id: task_id
      task:
        completed: task.completed
        title: task.title
      project_id: project_id
    task.editTask = false

  $scope.sortableOptions = stop: ->
    tasks = $scope.project.tasks
    tasks.map (task) ->
      index = $scope.project.tasks.indexOf(task)
      Task.update
        id: task.id
        task:
          position: index
        project_id: $scope.project.id

  $scope.deleteTask = (id, index) ->
      Task.delete
        id: id 
        project_id: $scope.project.id
      $scope.project.tasks.splice(index, 1)
]