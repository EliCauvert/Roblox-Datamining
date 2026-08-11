local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local enumsModule = require(profilePlatform.Common.Enums)
local viewerRelationshipUtilsModule = require(script.Parent.viewerRelationshipUtils)
local fFlagProfilePlatformUseViewerRelationshipForSocialStateModule = require(profilePlatform.Flags.FFlagProfilePlatformUseViewerRelationshipForSocialState)

return function(p0) --[[ line: 11 | named "getIsTrustedConnectionsStatusFromProfileResponse" ]]
	-- upvalues: fFlagProfilePlatformUseViewerRelationshipForSocialStateModule (ref), viewerRelationshipUtilsModule (ref), getDeepValueModule (ref), enumsModule (ref)
	if fFlagProfilePlatformUseViewerRelationshipForSocialStateModule then
		local viewerRelationshipFromProfileResponse = viewerRelationshipUtilsModule.getViewerRelationshipFromProfileResponse(p0)
		
		return if viewerRelationshipFromProfileResponse then viewerRelationshipUtilsModule.isViewerTrustedFriendsFromViewerRelationship(viewerRelationshipFromProfileResponse) else false
	end
	local var6 = getDeepValueModule(p0, `responseBody.components.{enumsModule.Components.Actions}.contextual`)
	
	return var6 ~= nil and table.find(var6, enumsModule.ProfileActions.RemoveTrustedConnection) ~= nil
end