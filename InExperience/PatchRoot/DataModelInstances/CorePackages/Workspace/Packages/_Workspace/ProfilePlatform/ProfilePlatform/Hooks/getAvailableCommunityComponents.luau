local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(ProfilePlatform.Types.Component)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetSupportedActionsForProfileTypeModule = require(ProfilePlatform.Hooks.getSupportedActionsForProfileType)
local FFlagAddSocialLinksToCommunityProfile = require(Parent.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local FFlagAddCommunityLockedToCommunityProfile = require(Parent.SharedFlags).FFlagAddCommunityLockedToCommunityProfile
local FFlagAddEventsToCommunityProfileModule = require(ProfilePlatform.Flags.FFlagAddEventsToCommunityProfile)
local FFlagGroupAnnouncementsSdui = require(Parent.SharedFlags).FFlagGroupAnnouncementsSdui
local FFlagGroupForumsDiscoverySdui = require(Parent.SharedFlags).FFlagGroupForumsDiscoverySdui

return function()
	-- upvalues: EnumsModule (copy), GetSupportedActionsForProfileTypeModule (copy), FFlagAddSocialLinksToCommunityProfile (copy), FFlagAddCommunityLockedToCommunityProfile (copy), FFlagAddEventsToCommunityProfileModule (copy), FFlagGroupAnnouncementsSdui (copy), FFlagGroupForumsDiscoverySdui (copy)
	local List = {
		{
			component = EnumsModule.Components.CommunityProfileHeader
		},
		{ component = EnumsModule.Components.About },
		{
			isActionsV2Supported = true,
			component = EnumsModule.Components.Actions,
			supportedActions = GetSupportedActionsForProfileTypeModule(EnumsModule.ProfileTypes.Community)
		},
		{ component = EnumsModule.Components.Experiences },
		{ component = EnumsModule.Components.Store },
		{ component = EnumsModule.Components.ViewFullProfile },
		{ component = EnumsModule.Components.CoverPhoto }
	}
	
	if FFlagAddSocialLinksToCommunityProfile then
		table.insert(List, { component = EnumsModule.Components.SocialLinks })
	end
	if FFlagAddCommunityLockedToCommunityProfile then
		table.insert(List, { component = EnumsModule.Components.CommunityLocked })
	end
	if FFlagAddEventsToCommunityProfileModule then
		table.insert(List, { component = EnumsModule.Components.Events })
	end
	if FFlagGroupAnnouncementsSdui then
		table.insert(List, { component = EnumsModule.Components.Announcements })
	end
	if FFlagGroupForumsDiscoverySdui then
		table.insert(List, { component = EnumsModule.Components.GroupForumsDiscovery })
	end
	return List
end