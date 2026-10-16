local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local Images = require(Parent.UIBlox).App.ImageSet.Images
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local NetworkingFriendsModule = require(ProfilePlatform.Networking.NetworkingFriends)
local RefreshProfilePlatformActionInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes
local FFlagMigrateFriendshipStatusesRemainingActions = require(Parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()

return {
	[EnumsModule.ProfileActions.AcceptFriendRequest] = function(p1) --[[ Line: 23 ]]
		-- upvalues: EnumsModule (copy), ButtonVariant (copy), ProfileTypes (copy), EventNamesModule (copy), FFlagMigrateFriendshipStatusesRemainingActions (copy), GetResult (copy), NetworkingFriendsModule (copy), SetCurrentToastMessageFunction (copy), Images (copy), RefreshProfilePlatformActionInfoModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.AcceptFriendRequest],
			variant = ButtonVariant.Emphasis,
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 28 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), EnumsModule (upval), FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), NetworkingFriendsModule (upval), SetCurrentToastMessageFunction (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonAcceptFriendRequest, {
						buttonSurface = p1.buttonSurface,
						absolutePosition = p1.profileWrapperContext.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = p1.profileWrapperContext.sourceInfo.source == EnumsModule.Sources.HomepageFriendsCarousel,
						isRecommendation = p1.profileWrapperContext.sourceInfo.isRecommendation,
						source = p1.profileWrapperContext.sourceInfo.source,
						contextualInfoType = p1.profileWrapperContext.sourceInfo.contextualInfoType,
						recommendationContextType = p1.profileWrapperContext.sourceInfo.recommendationContextType,
						recommendationRank = p1.profileWrapperContext.sourceInfo.recommendationRank,
						recommendationSessionId = p1.profileWrapperContext.sourceInfo.recommendationSessionId
					})
					
					return (if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.AcceptFriendRequest(p1.profileId) else p1.dispatch(NetworkingFriendsModule.AcceptFriendRequestFromUserId.API({
						targetUserId = p1.profileId,
						currentUserId = p1.localUserId
					}))):andThen(function() --[[ Line: 47 ]]
						-- upvalues: p1 (upval), SetCurrentToastMessageFunction (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval)
						p1.dispatch(SetCurrentToastMessageFunction({
							isLocalized = true,
							toastMessage = p1.localized.friendAcceptedToast,
							toastIcon = Images["icons/actions/friends/friendAdd"]
						}))
						
						return p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end)
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = function(p1) --[[ Line: 62 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), NetworkingFriendsModule (copy), SetCurrentToastMessageFunction (copy), Images (copy), RefreshProfilePlatformActionInfoModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.AcceptOffNetworkFriendRequest],
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 66 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), NetworkingFriendsModule (upval), SetCurrentToastMessageFunction (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonAddFriendFromContacts, {
						shareLinkId = p1.profileWrapperContext.sourceInfo.shareLinkId
					})
					
					return p1.dispatch(NetworkingFriendsModule.AcceptFriendRequestWithToken.API({
						targetUserId = p1.profileId,
						currentUserId = p1.localUserId,
						friendingToken = p1.profileWrapperContext.offNetworkFriendRequestToken
					})):andThen(function() --[[ Line: 76 ]]
						-- upvalues: p1 (upval), SetCurrentToastMessageFunction (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval)
						p1.dispatch(SetCurrentToastMessageFunction({
							isLocalized = true,
							toastMessage = p1.localized.friendAcceptedToast,
							toastIcon = Images["icons/actions/friends/friendAdd"]
						}))
						
						return p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end)
				end
			}
		}
	end
}