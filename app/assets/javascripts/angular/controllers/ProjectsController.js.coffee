app.controller "ProjectsController", [ "$timeout", "$scope", "Project", 
($timeout, $scope, Project) ->
  
  $scope.projects = Project.query()
  $scope.projectsErrors = {}

  $scope.createProject = ->
    Project.save(project: $scope.newProject).$promise.then (data) ->
      if data.errors
        $timeout ->
          $scope.projectsErrors = data
          $scope.$apply()

      else
        $scope.projects.push data
        $scope.showCreateForm = false
        $scope.newProject = {}
  
  $scope.updateProject = (project, id) ->
    Project.update(
      id: id
      project:
        title: project.title
    ).$promise.then (data) ->
      if data.errors
        $timeout ->
          $scope.projectsErrors = data
          $scope.$apply()

      else
        project.editProject = false
  
  $scope.deleteProject = (id, index) ->
    Project.delete(id: id)
    $scope.projects.splice(index, 1)
]