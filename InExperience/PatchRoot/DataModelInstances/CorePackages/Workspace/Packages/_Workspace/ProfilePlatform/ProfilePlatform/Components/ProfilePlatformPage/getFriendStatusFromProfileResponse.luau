local ViewerRelationshipUtilsModule = require(script.Parent.viewerRelationshipUtils)

return function(p1) --[[ Line: 3 | Named "getFriendStatusFromProfileResponse" ]]
	-- upvalues: ViewerRelationshipUtilsModule (copy)
	return ViewerRelationshipUtilsModule.mapViewerRelationshipAndContextToAnalyticsFriendStatus(ViewerRelationshipUtilsModule.getViewerRelationshipFromProfileResponse(p1), (ViewerRelationshipUtilsModule.getContextualInformationFromProfileResponse(p1)))
end