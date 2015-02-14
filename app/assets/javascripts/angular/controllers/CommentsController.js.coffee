app.controller "CommentsController", [ "$scope", "Comment", 
($scope, Comment) ->
  
  $scope.newComment = {}

  $scope.createComment = (task_id) ->
    $scope.newComment.task_id = task_id
    comment = Comment.save(
      comment:
        text: $scope.newComment.text
      task_id: task_id
    ).$promise.then((data) ->
      $scope.task.comments.push data
      $scope.commentId = data.id
      $scope.newComment = {}
      $scope.project.addComment = false
    )

  $scope.deleteComment = (comment, index) ->
    Comment.delete(id: comment.id, task_id: $scope.task.id)
    $scope.task.comments.splice(index, 1)
 ]
