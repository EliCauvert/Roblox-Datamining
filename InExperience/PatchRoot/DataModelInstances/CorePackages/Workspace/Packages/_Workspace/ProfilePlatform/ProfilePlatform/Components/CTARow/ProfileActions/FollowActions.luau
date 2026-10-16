local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local GroupsNetworkingModule = require(ProfilePlatform.Networking.GroupsNetworking)
local GetProfilePlatformModule = require(ProfilePlatform.Networking.getProfilePlatform)
local RefreshProfilePlatformActionInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local GetAvailableCommunityComponentsModule = require(ProfilePlatform.Hooks.getAvailableCommunityComponents)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes
local FFlagProfilePlatformEnableUserFollowModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableUserFollow)
local FollowingModule = require(Parent.DataHydration.Following)
local FollowingStore = FollowingModule.FollowingStore
local FollowingUpdateErrorTypeEnum = FollowingModule.FollowingUpdateErrorTypeEnum
local CreateChallengeNetworkFunction = require(Parent.GenericChallenges).Middleware.createChallengeNetwork

local function handleUpdateUserFollowStatus(p1, Callback, ToastMessage) --[[ Line: 24 ]]
	-- upvalues: CreateChallengeNetworkFunction (copy), SetCurrentToastMessageFunction (copy), RefreshProfilePlatformActionInfoModule (copy), FollowingUpdateErrorTypeEnum (copy)
	return Callback(p1.profileId, CreateChallengeNetworkFunction()):andThen(function() --[[ Line: 29 ]]
		-- upvalues: p1 (copy), SetCurrentToastMessageFunction (upval), ToastMessage (copy), RefreshProfilePlatformActionInfoModule (upval)
		p1.dispatch(SetCurrentToastMessageFunction({ isLocalized = true, toastMessage = ToastMessage }))
		
		return p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
	end, function(p2) --[[ Line: 35 ]]
		-- upvalues: p1 (copy), SetCurrentToastMessageFunction (upval), FollowingUpdateErrorTypeEnum (upval)
		p1.dispatch(SetCurrentToastMessageFunction({
			isLocalized = true,
			toastMessage = if p2 == nil or p2.errorType ~= FollowingUpdateErrorTypeEnum.Captcha then p1.localized.somethingIsWrongToast else p1.localized.userNotPassedCaptchaError
		}))
	end)
end

return {
	[EnumsModule.ProfileActions.Follow] = function(p1) --[[ Line: 46 ]]
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy), FFlagProfilePlatformEnableUserFollowModule (copy), EventNamesModule (copy), handleUpdateUserFollowStatus (copy), FollowingStore (copy), GroupsNetworkingModule (copy), GetProfilePlatformModule (copy), GetAvailableCommunityComponentsModule (copy)
		return {
			variant = ButtonVariant.Standard,
			text = p1.localized[EnumsModule.ProfileActions.Follow],
			onActivated = {
				[ProfileTypes.User] = if FFlagProfilePlatformEnableUserFollowModule then function() --[[ Line: 52 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), handleUpdateUserFollowStatus (upval), FollowingStore (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonFollow, { buttonSurface = p1.buttonSurface })
					
					return handleUpdateUserFollowStatus(p1, FollowingStore.get().Follow, p1.localized.followedToast)
				end else nil,
				[ProfileTypes.Community] = function() --[[ Line: 63 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), GroupsNetworkingModule (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonFollow, { buttonSurface = p1.buttonSurface })
					
					return p1.dispatch(GroupsNetworkingModule.JoinGroup.API({ groupId = p1.profileId })):andThen(function() --[[ Line: 71 ]]
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
	end,
	[EnumsModule.ProfileActions.Unfollow] = function(p1) --[[ Line: 84 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), FFlagProfilePlatformEnableUserFollowModule (copy), EventNamesModule (copy), handleUpdateUserFollowStatus (copy), FollowingStore (copy), GroupsNetworkingModule (copy), GetProfilePlatformModule (copy), GetAvailableCommunityComponentsModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.Unfollow],
			onActivated = {
				[ProfileTypes.User] = if FFlagProfilePlatformEnableUserFollowModule then function() --[[ Line: 89 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), handleUpdateUserFollowStatus (upval), FollowingStore (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonUnfollow, { buttonSurface = p1.buttonSurface })
					
					return handleUpdateUserFollowStatus(p1, FollowingStore.get().Unfollow, p1.localized.unfollowedToast)
				end else nil,
				[ProfileTypes.Community] = function() --[[ Line: 100 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), GroupsNetworkingModule (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonUnfollow, { buttonSurface = p1.buttonSurface })
					
					return p1.dispatch(GroupsNetworkingModule.LeaveGroup.API({ groupId = p1.profileId, userId = p1.localUserId })):andThen(function() --[[ Line: 110 ]]
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
	end
}