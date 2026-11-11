local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ConvertPrimaryActionToFriendStatusModule = require(ProfilePlatform.Hooks.convertPrimaryActionToFriendStatus)
local ViewerRelationshipUtilsModule = require(ProfilePlatform.Components.ProfilePlatformPage.viewerRelationshipUtils)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local FFlagProfilePlatformUseViewerRelationshipForSocialStateModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUseViewerRelationshipForSocialState)

return function()
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), FFlagProfilePlatformUseViewerRelationshipForSocialStateModule (copy), ViewerRelationshipUtilsModule (copy), ConvertPrimaryActionToFriendStatusModule (copy)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader) or {}
	
	if FFlagProfilePlatformUseViewerRelationshipForSocialStateModule then
		return ViewerRelationshipUtilsModule.mapViewerRelationshipAndContextToAnalyticsFriendStatus(UseProfileJsonComponentModuleResult.viewerRelationship, UseProfileJsonComponentModuleResult.contextualInformation)
	else
		local Buttons = UseProfileJsonComponentModule(EnumsModule.Components.Actions).buttons
		
		return ConvertPrimaryActionToFriendStatusModule(if Buttons and Buttons[1] then Buttons[1].type else nil)
	end
end