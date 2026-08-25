local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local fFlagProfilePlatformAddCurrentlyPlayingModule = require(profilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)

return function(p0)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref)
	local contextualInformation = (useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader) or {}).contextualInformation
	local context = contextualInformation and contextualInformation.context
	
	return not (not context or context == "None") and (if context == enumsModule.ContextualTypes.Presence and (p0 == enumsModule.PresenceTypes.Online or p0 == enumsModule.PresenceTypes.Offline) then false else fFlagProfilePlatformAddCurrentlyPlayingModule and p0 == enumsModule.PresenceTypes.InGame and context == enumsModule.ContextualTypes.Presence)
end