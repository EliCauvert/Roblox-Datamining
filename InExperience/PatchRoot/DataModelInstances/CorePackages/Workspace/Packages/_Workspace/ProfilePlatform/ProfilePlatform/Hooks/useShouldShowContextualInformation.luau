local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local FFlagProfilePlatformAddCurrentlyPlayingModule = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local FFlagRemoveMutualFriendsContextualInfoModule = require(ProfilePlatform.Flags.FFlagRemoveMutualFriendsContextualInfo)

return function(InGame): boolean
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), FFlagProfilePlatformAddCurrentlyPlayingModule (copy), FFlagRemoveMutualFriendsContextualInfoModule (copy)
	local ContextualInformation = (UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader) or {}).contextualInformation
	local Context = ContextualInformation and ContextualInformation.context
	
	return if Context and Context ~= "None" then (Context ~= EnumsModule.ContextualTypes.Presence or InGame ~= EnumsModule.PresenceTypes.Online and InGame ~= EnumsModule.PresenceTypes.Offline) and ((not FFlagProfilePlatformAddCurrentlyPlayingModule or InGame ~= EnumsModule.PresenceTypes.InGame or Context ~= EnumsModule.ContextualTypes.Presence) and (not FFlagRemoveMutualFriendsContextualInfoModule or Context ~= EnumsModule.ContextualTypes.MutualFriends)) else false
end