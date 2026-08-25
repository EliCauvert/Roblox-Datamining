local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Types.Component)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)

function GetProfilePlatform(p0)
	-- upvalues: enumsModule (ref), getProfilePlatformModule (ref)
	local list = {
		{ component = enumsModule.Components.UserProfileHeader },
		{ component = enumsModule.Components.About }
	}
	table.insert(list, { component = enumsModule.Components.ProfileBackground })
	
	return getProfilePlatformModule.API({
		includeComponentOrdering = false,
		profileId = p0,
		profileType = enumsModule.ProfileTypes.User,
		components = list
	})
end

return GetProfilePlatform