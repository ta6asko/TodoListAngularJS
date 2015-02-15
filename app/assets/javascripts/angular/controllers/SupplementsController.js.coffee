app.controller "SupplementsController", [ "$scope", "Supplement", "FileUploader", 
($scope, Supplement, FileUploader) ->
  
  $scope.getCommentId = (commentId) ->
    $scope.commentId = commentId
    uploader = $scope.uploader = new FileUploader(
      url: "/api/comments/" + $scope.commentId + "/supplements"
      removeAfterUpload: true
      autoUpload: true
    )
    uploader.onSuccessItem = (fileItem, response, status, headers) ->
      $scope.comment.supplements.push response

  $scope.deleteFile = (id, index) ->
    Supplement.delete
      id: id
      comment_id: $scope.comment.id
    $scope.comment.supplements.splice(index, 1)
]
