local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local buttonVariant = require(profilePlatform.Parent.Foundation).Enums.ButtonVariant
local groupsNetworkingModule = require(profilePlatform.Networking.GroupsNetworking)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)
local getAvailableCommunityComponentsModule = require(profilePlatform.Hooks.getAvailableCommunityComponents)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.Follow] = function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref)
		return {
			variant = buttonVariant.Standard,
			text = p1.localized[enumsModule.ProfileActions.Follow],
			onActivated = {
				[profileTypes.Community] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonFollow, { buttonSurface = p1.buttonSurface })
					
					return p1.dispatch(groupsNetworkingModule.JoinGroup.API({ groupId = p1.profileId })):andThen(function()
						-- upvalues: p1 (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
						p1.dispatch(getProfilePlatformModule.API({
							includeComponentOrdering = true,
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = getAvailableCommunityComponentsModule()
						}))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.Unfollow] = function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.Unfollow],
			onActivated = {
				[profileTypes.Community] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfollow, { buttonSurface = p1.buttonSurface })
					
					return p1.dispatch(groupsNetworkingModule.LeaveGroup.API({ groupId = p1.profileId, userId = p1.localUserId })):andThen(function()
						-- upvalues: p1 (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
						p1.dispatch(getProfilePlatformModule.API({
							includeComponentOrdering = true,
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = getAvailableCommunityComponentsModule()
						}))
					end)
				end
			}
		}
	end
}