local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ViewerRelationshipUtilsModule = require(ProfilePlatform.Components.ProfilePlatformPage.viewerRelationshipUtils)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)

return function()
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), ViewerRelationshipUtilsModule (copy)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader) or {}
	
	return ViewerRelationshipUtilsModule.mapViewerRelationshipAndContextToAnalyticsFriendStatus(UseProfileJsonComponentModuleResult.viewerRelationship, UseProfileJsonComponentModuleResult.contextualInformation)
end