local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local enumsModule = require(profilePlatform.Common.Enums)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)

function GetProfilePlatform(p1)
	-- upvalues: getProfilePlatformModule (ref), enumsModule (ref)
	return getProfilePlatformModule.API({
		includeComponentOrdering = false,
		profileId = p1,
		profileType = enumsModule.ProfileTypes.User,
		components = { { component = enumsModule.Components.UserProfileHeader } }
	})
end

return GetProfilePlatform