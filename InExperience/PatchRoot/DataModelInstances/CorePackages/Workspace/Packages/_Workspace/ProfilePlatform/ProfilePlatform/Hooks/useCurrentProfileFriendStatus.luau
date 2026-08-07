local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local enumsModule = require(profilePlatform.Common.Enums)
local convertPrimaryActionToFriendStatusModule = require(profilePlatform.Hooks.convertPrimaryActionToFriendStatus)
local viewerRelationshipUtilsModule = require(profilePlatform.Components.ProfilePlatformPage.viewerRelationshipUtils)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local fFlagProfilePlatformUseViewerRelationshipForSocialStateModule = require(profilePlatform.Flags.FFlagProfilePlatformUseViewerRelationshipForSocialState)

return function() --[[ line: 12 ]]
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), fFlagProfilePlatformUseViewerRelationshipForSocialStateModule (ref), viewerRelationshipUtilsModule (ref), convertPrimaryActionToFriendStatusModule (ref)
	local userProfileHeader = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader) or {}
	
	if fFlagProfilePlatformUseViewerRelationshipForSocialStateModule then
		return viewerRelationshipUtilsModule.mapViewerRelationshipAndContextToAnalyticsFriendStatus(userProfileHeader.viewerRelationship, userProfileHeader.contextualInformation)
	end
	local buttons = useProfileJsonComponentModule(enumsModule.Components.Actions).buttons
	
	return convertPrimaryActionToFriendStatusModule(if buttons and buttons[1] then buttons[1].type else nil)
end