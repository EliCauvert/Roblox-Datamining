local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local Images = require(Parent.UIBlox).App.ImageSet.Images
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
	[EnumsModule.ProfileActions.Unfriend] = function(p1)
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), FFlagMigrateFriendshipStatusesRemainingActions (copy), GetResult (copy), NetworkingFriendsModule (copy), SetCurrentToastMessageFunction (copy), Images (copy), RefreshProfilePlatformActionInfoModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.Unfriend],
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), NetworkingFriendsModule (upval), SetCurrentToastMessageFunction (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonUnfriend, { buttonSurface = p1.buttonSurface })
					
					return (if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.Unfriend(p1.profileId) else p1.dispatch(NetworkingFriendsModule.UnfriendTargetUserId.API({
						targetUserId = p1.profileId,
						currentUserId = p1.localUserId
					}))):andThen(function()
						-- upvalues: p1 (upval), SetCurrentToastMessageFunction (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval)
						p1.dispatch(SetCurrentToastMessageFunction({
							isLocalized = true,
							toastMessage = p1.localized.friendRemovedToast,
							toastIcon = Images["icons/actions/friends/friendRemove"]
						}))
						
						return p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end)
				end
			}
		}
	end
}