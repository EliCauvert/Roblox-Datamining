local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ViewerRelationshipUtilsModule = require(script.Parent.viewerRelationshipUtils)
local FFlagProfilePlatformUseViewerRelationshipForSocialStateModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUseViewerRelationshipForSocialState)

return function(p1)
	-- upvalues: FFlagProfilePlatformUseViewerRelationshipForSocialStateModule (copy), ViewerRelationshipUtilsModule (copy), GetDeepValueModule (copy), EnumsModule (copy)
	if FFlagProfilePlatformUseViewerRelationshipForSocialStateModule then
		local ViewerRelationshipFromProfileResponse = ViewerRelationshipUtilsModule.getViewerRelationshipFromProfileResponse(p1)
		
		return if ViewerRelationshipFromProfileResponse then ViewerRelationshipUtilsModule.isViewerTrustedFriendsFromViewerRelationship(ViewerRelationshipFromProfileResponse) else false
	else
		local DeepValueModule = GetDeepValueModule(p1, `responseBody.components.{EnumsModule.Components.Actions}.contextual`)
		
		return DeepValueModule ~= nil and table.find(DeepValueModule, EnumsModule.ProfileActions.RemoveTrustedConnection) ~= nil
	end
end