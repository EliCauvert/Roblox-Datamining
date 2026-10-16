local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Types.Component)
local GetProfilePlatformModule = require(ProfilePlatform.Networking.getProfilePlatform)

function GetProfilePlatform(ProfileId) --[[ Line: 10 ]]
	-- upvalues: EnumsModule (copy), GetProfilePlatformModule (copy)
	local Components = {
		{ component = EnumsModule.Components.UserProfileHeader },
		{ component = EnumsModule.Components.About }
	}
	table.insert(Components, { component = EnumsModule.Components.ProfileBackground })
	
	return GetProfilePlatformModule.API({
		includeComponentOrdering = false,
		profileId = ProfileId,
		profileType = EnumsModule.ProfileTypes.User,
		components = Components
	})
end

return GetProfilePlatform