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
local var5 = require(parent.DataHydration).Friends.FriendsStore.get()

return {
	[enumsModule.ProfileActions.AcceptFriendRequest] = function(p0) --[[ line: 23 ]]
		-- upvalues: enumsModule (ref), buttonVariant (ref), profileTypes (ref), eventNamesModule (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var5 (ref), networkingFriendsModule (ref), setCurrentToastMessage (ref), images (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.AcceptFriendRequest],
			variant = buttonVariant.Emphasis,
			onActivated = {
				[profileTypes.User] = function() --[[ line: 28 ]]
					-- upvalues: p0 (ref), eventNamesModule (copy), enumsModule (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var5 (copy), networkingFriendsModule (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonAcceptFriendRequest, {
						buttonSurface = p0.buttonSurface,
						absolutePosition = p0.profileWrapperContext.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = p0.profileWrapperContext.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
						isRecommendation = p0.profileWrapperContext.sourceInfo.isRecommendation,
						source = p0.profileWrapperContext.sourceInfo.source,
						contextualInfoType = p0.profileWrapperContext.sourceInfo.contextualInfoType,
						recommendationContextType = p0.profileWrapperContext.sourceInfo.recommendationContextType,
						recommendationRank = p0.profileWrapperContext.sourceInfo.recommendationRank,
						recommendationSessionId = p0.profileWrapperContext.sourceInfo.recommendationSessionId
					})
					
					return (if fFlagMigrateFriendshipStatusesRemainingActions then var5.AcceptFriendRequest(p0.profileId) else p0.dispatch(networkingFriendsModule.AcceptFriendRequestFromUserId.API({
						targetUserId = p0.profileId,
						currentUserId = p0.localUserId
					}))):andThen(function() --[[ line: 47 ]]
						-- upvalues: p0 (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
						p0.dispatch(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = p0.localized.friendAcceptedToast,
							toastIcon = images["icons/actions/friends/friendAdd"]
						}))
						
						return p0.dispatch(refreshProfilePlatformActionInfoModule(p0.profileId, p0.actionsComponentRequest))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = function(p1) --[[ line: 62 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), networkingFriendsModule (ref), setCurrentToastMessage (ref), images (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 66 ]]
					-- upvalues: p1 (ref), eventNamesModule (copy), networkingFriendsModule (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriendFromContacts, {
						shareLinkId = p1.profileWrapperContext.sourceInfo.shareLinkId
					})
					
					return p1.dispatch(networkingFriendsModule.AcceptFriendRequestWithToken.API({
						targetUserId = p1.profileId,
						currentUserId = p1.localUserId,
						friendingToken = p1.profileWrapperContext.offNetworkFriendRequestToken
					})):andThen(function() --[[ line: 76 ]]
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