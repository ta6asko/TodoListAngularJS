app.factory "Project", [ "$resource", ($resource) ->
  $resource "/api/projects/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

 ]
app.factory "Task", [ "$resource", ($resource) ->
  $resource "/api/projects/:project_id/tasks/:id",
    project_id: "@project_id"
    id: "@id"
  ,
    update:
      method: "PUT"

 ]
app.factory "Comment", [ "$resource", ($resource, task_id) ->
  $resource "/api/tasks/:task_id/comments/:id",
    task_id: "@task_id"
    id: "@id"
  ,
    update:
      method: "PUT"

 ]
app.factory "Supplement", [ "$resource", ($resource, comment_id) ->
  $resource "/api/comments/:comment_id/supplements/:id",
    comment_id: "@comment_id"
    id: "@id"
  ,
    update:
      method: "PUT"

 ]