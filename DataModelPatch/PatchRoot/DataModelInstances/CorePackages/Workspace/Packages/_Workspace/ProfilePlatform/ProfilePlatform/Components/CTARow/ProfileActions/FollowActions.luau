local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ButtonVariant = require(ProfilePlatform.Parent.Foundation).Enums.ButtonVariant
local GroupsNetworkingModule = require(ProfilePlatform.Networking.GroupsNetworking)
local GetProfilePlatformModule = require(ProfilePlatform.Networking.getProfilePlatform)
local GetAvailableCommunityComponentsModule = require(ProfilePlatform.Hooks.getAvailableCommunityComponents)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes
local FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)

return {
	[EnumsModule.ProfileActions.Follow] = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then function(p1)
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), GroupsNetworkingModule (copy), GetProfilePlatformModule (copy), GetAvailableCommunityComponentsModule (copy)
		return {
			variant = ButtonVariant.Standard,
			text = p1.localized[EnumsModule.ProfileActions.Follow],
			onActivated = {
				[ProfileTypes.Community] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), GroupsNetworkingModule (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonFollow, { buttonSurface = p1.buttonSurface })
					
					return p1.dispatch(GroupsNetworkingModule.JoinGroup.API({ groupId = p1.profileId })):andThen(function()
						-- upvalues: p1 (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
						p1.dispatch(GetProfilePlatformModule.API({
							includeComponentOrdering = true,
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = GetAvailableCommunityComponentsModule()
						}))
					end)
				end
			}
		}
	end else nil,
	[EnumsModule.ProfileActions.Unfollow] = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then function(p1)
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), GroupsNetworkingModule (copy), GetProfilePlatformModule (copy), GetAvailableCommunityComponentsModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.Unfollow],
			onActivated = {
				[ProfileTypes.Community] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), GroupsNetworkingModule (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonUnfollow, { buttonSurface = p1.buttonSurface })
					
					return p1.dispatch(GroupsNetworkingModule.LeaveGroup.API({ groupId = p1.profileId, userId = p1.localUserId })):andThen(function()
						-- upvalues: p1 (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
						p1.dispatch(GetProfilePlatformModule.API({
							includeComponentOrdering = true,
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = GetAvailableCommunityComponentsModule()
						}))
					end)
				end
			}
		}
	end else nil
}