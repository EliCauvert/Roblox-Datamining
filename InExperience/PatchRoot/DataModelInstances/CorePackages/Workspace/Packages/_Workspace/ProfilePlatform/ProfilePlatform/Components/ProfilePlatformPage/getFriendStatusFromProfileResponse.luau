local viewerRelationshipUtilsModule = require(script.Parent.viewerRelationshipUtils)

return function(p0) --[[ line: 3 | named "getFriendStatusFromProfileResponse" ]]
	-- upvalues: viewerRelationshipUtilsModule (ref)
	return viewerRelationshipUtilsModule.mapViewerRelationshipAndContextToAnalyticsFriendStatus(viewerRelationshipUtilsModule.getViewerRelationshipFromProfileResponse(p0), viewerRelationshipUtilsModule.getContextualInformationFromProfileResponse(p0))
end