local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetProfilePlatformModule = require(ProfilePlatform.Networking.getProfilePlatform)
local _ = require(ProfilePlatform.Types.Component)
local FFlagProfilePlatformAddCurrentlyPlayingModule = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local FFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local FFlagProfilePlatformGracefulVisibilityModule = require(ProfilePlatform.Flags.FFlagProfilePlatformGracefulVisibility)

function GetProfilePlatform(ProfileId, p1)
	-- upvalues: FFlagProfilePlatformRefreshActionsRespectPoliciesModule (copy), EnumsModule (copy), FFlagProfilePlatformAddCurrentlyPlayingModule (copy), FFlagProfilePlatformGracefulVisibilityModule (copy), GetProfilePlatformModule (copy)
	local List = {
		{ component = EnumsModule.Components.UserProfileHeader },
		if FFlagProfilePlatformRefreshActionsRespectPoliciesModule and p1 ~= nil then p1 else {
			isActionsV2Supported = true,
			component = EnumsModule.Components.Actions
		}
	}
	
	if FFlagProfilePlatformAddCurrentlyPlayingModule then
		table.insert(List, { component = EnumsModule.Components.CurrentlyPlaying })
	end
	if FFlagProfilePlatformGracefulVisibilityModule then
		table.insert(List, { component = EnumsModule.Components.Friends })
	end
	return GetProfilePlatformModule.API({
		includeComponentOrdering = false,
		profileId = ProfileId,
		profileType = EnumsModule.ProfileTypes.User,
		components = List
	})
end

return GetProfilePlatform