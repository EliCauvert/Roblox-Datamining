local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetProfilePlatformModule = require(ProfilePlatform.Networking.getProfilePlatform)
local _ = require(ProfilePlatform.Types.Component)
local FFlagProfilePlatformAddCurrentlyPlayingModule = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local FFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)

function GetProfilePlatform(ProfileId, p1)
	-- upvalues: FFlagProfilePlatformRefreshActionsRespectPoliciesModule (copy), EnumsModule (copy), FFlagProfilePlatformAddCurrentlyPlayingModule (copy), GetProfilePlatformModule (copy)
	local Components = {
		{ component = EnumsModule.Components.UserProfileHeader },
		if FFlagProfilePlatformRefreshActionsRespectPoliciesModule and p1 ~= nil then p1 else {
			isActionsV2Supported = true,
			component = EnumsModule.Components.Actions
		}
	}
	
	if FFlagProfilePlatformAddCurrentlyPlayingModule then
		table.insert(Components, { component = EnumsModule.Components.CurrentlyPlaying })
	end
	return GetProfilePlatformModule.API({
		includeComponentOrdering = false,
		profileId = ProfileId,
		profileType = EnumsModule.ProfileTypes.User,
		components = Components
	})
end

return GetProfilePlatform