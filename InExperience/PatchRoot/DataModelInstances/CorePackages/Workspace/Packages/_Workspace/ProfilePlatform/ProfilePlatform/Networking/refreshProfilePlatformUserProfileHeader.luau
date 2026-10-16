local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetProfilePlatformModule = require(ProfilePlatform.Networking.getProfilePlatform)

function GetProfilePlatform(ProfileId) --[[ Line: 7 ]]
	-- upvalues: GetProfilePlatformModule (copy), EnumsModule (copy)
	return GetProfilePlatformModule.API({
		includeComponentOrdering = false,
		profileId = ProfileId,
		profileType = EnumsModule.ProfileTypes.User,
		components = { { component = EnumsModule.Components.UserProfileHeader } }
	})
end

return GetProfilePlatform