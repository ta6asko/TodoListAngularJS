app.factory('Project', ['$resource', function($resource){
	 return $resource('/api/projects/:id',
			{id: '@id'},
			{update: {method: "PUT"}
		});
}])

app.factory('Task', ['$resource', function($resource){
	 return $resource('/api/projects/:project_id/tasks/:id',
			{project_id: '@project_id', id: '@id'},
			{update: {method: "PUT"}
		});
}])

app.factory('Comment', ['$resource', function($resource, task_id){
	 return $resource('/api/tasks/:task_id/comments/:id',
			{task_id: '@task_id', id: '@id'},
			{update: {method: "PUT"}
		});
}])

app.factory('Supplement', ['$resource', function($resource, comment_id){
	 return $resource('/api/comments/:comment_id/supplements/:id',
			{comment_id: "@comment_id", id: '@id'},
			{update: {method: "PUT"}
		});
}])