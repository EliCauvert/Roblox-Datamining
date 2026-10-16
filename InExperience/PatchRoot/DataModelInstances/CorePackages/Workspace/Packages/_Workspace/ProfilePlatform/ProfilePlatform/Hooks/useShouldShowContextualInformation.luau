local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local FFlagProfilePlatformAddCurrentlyPlayingModule = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)

return function(InGame): boolean --[[ Line: 8 ]]
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), FFlagProfilePlatformAddCurrentlyPlayingModule (copy)
	local ContextualInformation = (UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader) or {}).contextualInformation
	local Context = ContextualInformation and ContextualInformation.context
	
	return if Context and Context ~= "None" then (Context ~= EnumsModule.ContextualTypes.Presence or InGame ~= EnumsModule.PresenceTypes.Online and InGame ~= EnumsModule.PresenceTypes.Offline) and (not FFlagProfilePlatformAddCurrentlyPlayingModule or InGame ~= EnumsModule.PresenceTypes.InGame or Context ~= EnumsModule.ContextualTypes.Presence) else false
end