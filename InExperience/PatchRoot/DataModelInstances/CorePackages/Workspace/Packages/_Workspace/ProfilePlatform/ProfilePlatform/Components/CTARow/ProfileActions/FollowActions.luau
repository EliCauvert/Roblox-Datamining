local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local buttonVariant = require(parent.Foundation).Enums.ButtonVariant
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local groupsNetworkingModule = require(profilePlatform.Networking.GroupsNetworking)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)
local refreshProfilePlatformActionInfoModule = require(profilePlatform.Networking.refreshProfilePlatformActionInfo)
local getAvailableCommunityComponentsModule = require(profilePlatform.Hooks.getAvailableCommunityComponents)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local fFlagProfilePlatformEnableUserFollowModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableUserFollow)
local followingModule = require(parent.DataHydration.Following)
local followingStore = followingModule.FollowingStore
local followingUpdateErrorTypeEnum = followingModule.FollowingUpdateErrorTypeEnum
local createChallengeNetwork = require(parent.GenericChallenges).Middleware.createChallengeNetwork

local function handleUpdateUserFollowStatus(p1, p2, p3)
	-- upvalues: createChallengeNetwork (ref), setCurrentToastMessage (ref), refreshProfilePlatformActionInfoModule (ref), followingUpdateErrorTypeEnum (ref)
	return p2(p1.profileId, createChallengeNetwork()):andThen(function()
		-- upvalues: p1 (ref), setCurrentToastMessage (copy), p3 (ref), refreshProfilePlatformActionInfoModule (copy)
		p1.dispatch(setCurrentToastMessage({ isLocalized = true, toastMessage = p3 }))
		
		return p1.dispatch(refreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
	end, function(p4)
		-- upvalues: p1 (ref), setCurrentToastMessage (copy), followingUpdateErrorTypeEnum (copy)
		p1.dispatch(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = if p4 == nil or p4.errorType ~= followingUpdateErrorTypeEnum.Captcha then p1.localized.somethingIsWrongToast else p1.localized.userNotPassedCaptchaError
		}))
	end)
end

return {
	[enumsModule.ProfileActions.Follow] = function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), fFlagProfilePlatformEnableUserFollowModule (ref), eventNamesModule (ref), handleUpdateUserFollowStatus (ref), followingStore (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref)
		return {
			variant = buttonVariant.Standard,
			text = p1.localized[enumsModule.ProfileActions.Follow],
			onActivated = {
				[profileTypes.User] = if fFlagProfilePlatformEnableUserFollowModule then function()
					-- upvalues: p1 (ref), eventNamesModule (copy), handleUpdateUserFollowStatus (copy), followingStore (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonFollow, { buttonSurface = p1.buttonSurface })
					
					return handleUpdateUserFollowStatus(p1, followingStore.get().Follow, p1.localized.followedToast)
				end else nil,
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
		-- upvalues: enumsModule (ref), profileTypes (ref), fFlagProfilePlatformEnableUserFollowModule (ref), eventNamesModule (ref), handleUpdateUserFollowStatus (ref), followingStore (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.Unfollow],
			onActivated = {
				[profileTypes.User] = if fFlagProfilePlatformEnableUserFollowModule then function()
					-- upvalues: p1 (ref), eventNamesModule (copy), handleUpdateUserFollowStatus (copy), followingStore (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfollow, { buttonSurface = p1.buttonSurface })
					
					return handleUpdateUserFollowStatus(p1, followingStore.get().Unfollow, p1.localized.unfollowedToast)
				end else nil,
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