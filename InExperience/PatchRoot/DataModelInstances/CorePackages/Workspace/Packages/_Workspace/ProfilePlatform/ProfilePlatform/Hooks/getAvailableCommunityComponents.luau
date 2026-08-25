local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local _ = require(profilePlatform.Types.Component)
local enumsModule = require(profilePlatform.Common.Enums)
local getSupportedActionsForProfileTypeModule = require(profilePlatform.Hooks.getSupportedActionsForProfileType)
local fFlagAddSocialLinksToCommunityProfile = require(parent.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local fFlagAddVideoToCommunityProfile = require(parent.SharedFlags).FFlagAddVideoToCommunityProfile
local fFlagAddCommunityLockedToCommunityProfile = require(parent.SharedFlags).FFlagAddCommunityLockedToCommunityProfile
local fFlagAddEventsToCommunityProfileModule = require(profilePlatform.Flags.FFlagAddEventsToCommunityProfile)
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)

return function()
	-- upvalues: enumsModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), getSupportedActionsForProfileTypeModule (ref), fFlagAddSocialLinksToCommunityProfile (ref), fFlagAddVideoToCommunityProfile (ref), fFlagAddCommunityLockedToCommunityProfile (ref), fFlagAddEventsToCommunityProfileModule (ref)
	local list = {
		{
			component = enumsModule.Components.CommunityProfileHeader
		},
		{ component = enumsModule.Components.About },
		{
			component = enumsModule.Components.Actions,
			supportedActions = if fFlagProfilePlatformCTAsRefactorModule then getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.Community) else nil,
			isActionsV2Supported = if fFlagProfilePlatformCTAsRefactorModule then true else nil
		},
		{ component = enumsModule.Components.Experiences },
		{ component = enumsModule.Components.Store },
		{ component = enumsModule.Components.ViewFullProfile },
		{ component = enumsModule.Components.CoverPhoto }
	}
	
	if fFlagAddSocialLinksToCommunityProfile then
		table.insert(list, { component = enumsModule.Components.SocialLinks })
	end
	if fFlagAddVideoToCommunityProfile then
		table.insert(list, { component = enumsModule.Components.Videos })
	end
	if fFlagAddCommunityLockedToCommunityProfile then
		table.insert(list, { component = enumsModule.Components.CommunityLocked })
	end
	if fFlagAddEventsToCommunityProfileModule then
		table.insert(list, { component = enumsModule.Components.Events })
	end
	return list
end