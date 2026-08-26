local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local images = require(parent.UIBlox).App.ImageSet.Images
local buttonVariant = require(parent.Foundation).Enums.ButtonVariant
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local networkingFriendsModule = require(profilePlatform.Networking.NetworkingFriends)
local refreshProfilePlatformActionInfoModule = require(profilePlatform.Networking.refreshProfilePlatformActionInfo)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var1 = require(parent.DataHydration).Friends.FriendsStore.get()

return {
	[enumsModule.ProfileActions.AcceptFriendRequest] = function(p1)
		-- upvalues: enumsModule (ref), buttonVariant (ref), profileTypes (ref), eventNamesModule (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), networkingFriendsModule (ref), setCurrentToastMessage (ref), images (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.AcceptFriendRequest],
			variant = buttonVariant.Emphasis,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), enumsModule (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), networkingFriendsModule (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonAcceptFriendRequest, {
						buttonSurface = p1.buttonSurface,
						absolutePosition = p1.profileWrapperContext.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = p1.profileWrapperContext.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
						isRecommendation = p1.profileWrapperContext.sourceInfo.isRecommendation,
						source = p1.profileWrapperContext.sourceInfo.source,
						contextualInfoType = p1.profileWrapperContext.sourceInfo.contextualInfoType,
						recommendationContextType = p1.profileWrapperContext.sourceInfo.recommendationContextType,
						recommendationRank = p1.profileWrapperContext.sourceInfo.recommendationRank,
						recommendationSessionId = p1.profileWrapperContext.sourceInfo.recommendationSessionId
					})
					
					return (if fFlagMigrateFriendshipStatusesRemainingActions then var1.AcceptFriendRequest(p1.profileId) else p1.dispatch(networkingFriendsModule.AcceptFriendRequestFromUserId.API({
						targetUserId = p1.profileId,
						currentUserId = p1.localUserId
					}))):andThen(function()
						-- upvalues: p1 (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
						p1.dispatch(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = p1.localized.friendAcceptedToast,
							toastIcon = images["icons/actions/friends/friendAdd"]
						}))
						
						return p1.dispatch(refreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), networkingFriendsModule (ref), setCurrentToastMessage (ref), images (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), networkingFriendsModule (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriendFromContacts, {
						shareLinkId = p1.profileWrapperContext.sourceInfo.shareLinkId
					})
					
					return p1.dispatch(networkingFriendsModule.AcceptFriendRequestWithToken.API({
						targetUserId = p1.profileId,
						currentUserId = p1.localUserId,
						friendingToken = p1.profileWrapperContext.offNetworkFriendRequestToken
					})):andThen(function()
						-- upvalues: p1 (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
						p1.dispatch(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = p1.localized.friendAcceptedToast,
							toastIcon = images["icons/actions/friends/friendAdd"]
						}))
						
						return p1.dispatch(refreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end)
				end
			}
		}
	end
}