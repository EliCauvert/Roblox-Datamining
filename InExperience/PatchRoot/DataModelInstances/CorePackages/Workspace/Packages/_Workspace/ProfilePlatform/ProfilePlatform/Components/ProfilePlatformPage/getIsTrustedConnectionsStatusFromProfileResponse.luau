local viewerRelationshipUtilsModule = require(script.Parent.viewerRelationshipUtils)

return function(p0) --[[ line: 3 | named "getIsTrustedConnectionsStatusFromProfileResponse" ]]
	-- upvalues: viewerRelationshipUtilsModule (ref)
	local viewerRelationshipFromProfileResponse = viewerRelationshipUtilsModule.getViewerRelationshipFromProfileResponse(p0)
	
	return if viewerRelationshipFromProfileResponse then viewerRelationshipUtilsModule.isViewerTrustedFriendsFromViewerRelationship(viewerRelationshipFromProfileResponse) else false
end