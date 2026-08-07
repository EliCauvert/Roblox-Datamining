local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local enumsModule = require(profilePlatform.Common.Enums)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)
local _ = require(profilePlatform.Types.Component)
local fFlagProfilePlatformAddCurrentlyPlayingModule = require(profilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local fFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(profilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)

function GetProfilePlatform(p0, p1) --[[ line: 16 ]]
	-- upvalues: fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), enumsModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), getProfilePlatformModule (ref)
	local list = {
		{ component = enumsModule.Components.UserProfileHeader },
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule and p1 ~= nil then p1 else {
			component = enumsModule.Components.Actions,
			isActionsV2Supported = if fFlagProfilePlatformCTAsRefactorModule then true else nil
		}
	}
	
	if fFlagProfilePlatformAddCurrentlyPlayingModule then
		table.insert(list, { component = enumsModule.Components.CurrentlyPlaying })
	end
	return getProfilePlatformModule.API({
		includeComponentOrdering = false,
		profileId = p0,
		profileType = enumsModule.ProfileTypes.User,
		components = list
	})
end

return GetProfilePlatform