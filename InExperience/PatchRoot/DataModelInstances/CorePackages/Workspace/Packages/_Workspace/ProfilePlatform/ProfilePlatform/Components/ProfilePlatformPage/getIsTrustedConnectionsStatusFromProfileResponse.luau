local ViewerRelationshipUtilsModule = require(script.Parent.viewerRelationshipUtils)

return function(p1) --[[ Line: 3 | Named "getIsTrustedConnectionsStatusFromProfileResponse" ]]
	-- upvalues: ViewerRelationshipUtilsModule (copy)
	local ViewerRelationshipFromProfileResponse = ViewerRelationshipUtilsModule.getViewerRelationshipFromProfileResponse(p1)
	
	return if ViewerRelationshipFromProfileResponse then ViewerRelationshipUtilsModule.isViewerTrustedFriendsFromViewerRelationship(ViewerRelationshipFromProfileResponse) else false
end