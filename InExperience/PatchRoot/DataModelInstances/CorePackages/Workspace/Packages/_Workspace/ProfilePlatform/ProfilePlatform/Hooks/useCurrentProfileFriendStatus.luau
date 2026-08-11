local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local enumsModule = require(profilePlatform.Common.Enums)
local viewerRelationshipUtilsModule = require(profilePlatform.Components.ProfilePlatformPage.viewerRelationshipUtils)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)

return function() --[[ line: 8 ]]
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), viewerRelationshipUtilsModule (ref)
	local userProfileHeader = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader) or {}
	
	return viewerRelationshipUtilsModule.mapViewerRelationshipAndContextToAnalyticsFriendStatus(userProfileHeader.viewerRelationship, userProfileHeader.contextualInformation)
end