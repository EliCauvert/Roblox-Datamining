local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local _ = require(profilePlatform.Types.Component)
local enumsModule = require(profilePlatform.Common.Enums)
local getSupportedActionsForProfileTypeModule = require(profilePlatform.Hooks.getSupportedActionsForProfileType)
local fFlagAddSocialLinksToCommunityProfile = require(parent.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local fFlagAddCommunityLockedToCommunityProfile = require(parent.SharedFlags).FFlagAddCommunityLockedToCommunityProfile
local fFlagAddEventsToCommunityProfileModule = require(profilePlatform.Flags.FFlagAddEventsToCommunityProfile)
local fFlagGroupAnnouncementsSdui = require(parent.SharedFlags).FFlagGroupAnnouncementsSdui

return function()
	-- upvalues: enumsModule (ref), getSupportedActionsForProfileTypeModule (ref), fFlagAddSocialLinksToCommunityProfile (ref), fFlagAddCommunityLockedToCommunityProfile (ref), fFlagAddEventsToCommunityProfileModule (ref), fFlagGroupAnnouncementsSdui (ref)
	local list = {
		{
			component = enumsModule.Components.CommunityProfileHeader
		},
		{ component = enumsModule.Components.About },
		{
			isActionsV2Supported = true,
			component = enumsModule.Components.Actions,
			supportedActions = getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.Community)
		},
		{ component = enumsModule.Components.Experiences },
		{ component = enumsModule.Components.Store },
		{ component = enumsModule.Components.ViewFullProfile },
		{ component = enumsModule.Components.CoverPhoto }
	}
	
	if fFlagAddSocialLinksToCommunityProfile then
		table.insert(list, { component = enumsModule.Components.SocialLinks })
	end
	if fFlagAddCommunityLockedToCommunityProfile then
		table.insert(list, { component = enumsModule.Components.CommunityLocked })
	end
	if fFlagAddEventsToCommunityProfileModule then
		table.insert(list, { component = enumsModule.Components.Events })
	end
	if fFlagGroupAnnouncementsSdui then
		table.insert(list, { component = enumsModule.Components.Announcements })
	end
	return list
end