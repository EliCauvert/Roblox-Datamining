local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local images = require(parent.UIBlox).App.ImageSet.Images
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
	[enumsModule.ProfileActions.Unfriend] = function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), networkingFriendsModule (ref), setCurrentToastMessage (ref), images (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.Unfriend],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), networkingFriendsModule (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfriend, { buttonSurface = p1.buttonSurface })
					
					return (if fFlagMigrateFriendshipStatusesRemainingActions then var1.Unfriend(p1.profileId) else p1.dispatch(networkingFriendsModule.UnfriendTargetUserId.API({
						targetUserId = p1.profileId,
						currentUserId = p1.localUserId
					}))):andThen(function()
						-- upvalues: p1 (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
						p1.dispatch(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = p1.localized.friendRemovedToast,
							toastIcon = images["icons/actions/friends/friendRemove"]
						}))
						
						return p1.dispatch(refreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end)
				end
			}
		}
	end
}