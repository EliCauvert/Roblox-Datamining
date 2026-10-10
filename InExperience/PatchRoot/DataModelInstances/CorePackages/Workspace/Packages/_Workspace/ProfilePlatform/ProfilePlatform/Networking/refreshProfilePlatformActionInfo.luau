local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local enumsModule = require(profilePlatform.Common.Enums)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)
local _ = require(profilePlatform.Types.Component)
local fFlagProfilePlatformAddCurrentlyPlayingModule = require(profilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local fFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(profilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)

function GetProfilePlatform(p1, p2)
	-- upvalues: fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), enumsModule (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), getProfilePlatformModule (ref)
	local list = {
		{ component = enumsModule.Components.UserProfileHeader },
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule and p2 ~= nil then p2 else {
			isActionsV2Supported = true,
			component = enumsModule.Components.Actions
		}
	}
	
	if fFlagProfilePlatformAddCurrentlyPlayingModule then
		table.insert(list, { component = enumsModule.Components.CurrentlyPlaying })
	end
	return getProfilePlatformModule.API({
		includeComponentOrdering = false,
		profileId = p1,
		profileType = enumsModule.ProfileTypes.User,
		components = list
	})
end

return GetProfilePlatform