local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(ProfilePlatform.Types.Component)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetSupportedActionsForProfileTypeModule = require(ProfilePlatform.Hooks.getSupportedActionsForProfileType)
local FFlagAddSocialLinksToCommunityProfile = require(Parent.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local FFlagAddVideoToCommunityProfile = require(Parent.SharedFlags).FFlagAddVideoToCommunityProfile
local FFlagAddCommunityLockedToCommunityProfile = require(Parent.SharedFlags).FFlagAddCommunityLockedToCommunityProfile
local FFlagAddEventsToCommunityProfileModule = require(ProfilePlatform.Flags.FFlagAddEventsToCommunityProfile)
local FFlagProfilePlatformCTAsRefactorModule = require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)

return function()
	-- upvalues: EnumsModule (copy), FFlagProfilePlatformCTAsRefactorModule (copy), GetSupportedActionsForProfileTypeModule (copy), FFlagAddSocialLinksToCommunityProfile (copy), FFlagAddVideoToCommunityProfile (copy), FFlagAddCommunityLockedToCommunityProfile (copy), FFlagAddEventsToCommunityProfileModule (copy)
	local List = {
		{
			component = EnumsModule.Components.CommunityProfileHeader
		},
		{ component = EnumsModule.Components.About },
		{
			component = EnumsModule.Components.Actions,
			supportedActions = if FFlagProfilePlatformCTAsRefactorModule then GetSupportedActionsForProfileTypeModule(EnumsModule.ProfileTypes.Community) else nil,
			isActionsV2Supported = if FFlagProfilePlatformCTAsRefactorModule then true else nil
		},
		{ component = EnumsModule.Components.Experiences },
		{ component = EnumsModule.Components.Store },
		{ component = EnumsModule.Components.ViewFullProfile },
		{ component = EnumsModule.Components.CoverPhoto }
	}
	
	if FFlagAddSocialLinksToCommunityProfile then
		table.insert(List, { component = EnumsModule.Components.SocialLinks })
	end
	if FFlagAddVideoToCommunityProfile then
		table.insert(List, { component = EnumsModule.Components.Videos })
	end
	if FFlagAddCommunityLockedToCommunityProfile then
		table.insert(List, { component = EnumsModule.Components.CommunityLocked })
	end
	if FFlagAddEventsToCommunityProfileModule then
		table.insert(List, { component = EnumsModule.Components.Events })
	end
	return List
end