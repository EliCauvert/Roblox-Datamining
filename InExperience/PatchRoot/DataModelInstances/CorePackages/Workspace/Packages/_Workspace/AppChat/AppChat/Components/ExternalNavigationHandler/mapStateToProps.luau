return function(p1, _)
	return {
		screen = p1.ChatAppReducer.ExternalNavigationRequest.screen,
		params = p1.ChatAppReducer.ExternalNavigationRequest.params,
		requestId = p1.ChatAppReducer.ExternalNavigationRequest.requestId,
		completedRequestId = p1.ChatAppReducer.ExternalNavigationRequest.completedRequestId
	}
end