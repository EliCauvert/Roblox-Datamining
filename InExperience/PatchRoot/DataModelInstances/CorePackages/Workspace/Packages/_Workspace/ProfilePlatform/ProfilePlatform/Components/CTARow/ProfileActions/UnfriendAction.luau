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

return {
	[enumsModule.ProfileActions.Unfriend] = function(p0) --[[ line: 17 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), networkingFriendsModule (ref), setCurrentToastMessage (ref), images (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.Unfriend],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 21 ]]
					-- upvalues: p0 (ref), eventNamesModule (copy), networkingFriendsModule (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfriend, { buttonSurface = p0.buttonSurface })
					
					return p0.dispatch(networkingFriendsModule.UnfriendTargetUserId.API({
						targetUserId = p0.profileId,
						currentUserId = p0.localUserId
					})):andThen(function() --[[ line: 30 ]]
						-- upvalues: p0 (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
						p0.dispatch(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = p0.localized.friendRemovedToast,
							toastIcon = images["icons/actions/friends/friendRemove"]
						}))
						
						return p0.dispatch(refreshProfilePlatformActionInfoModule(p0.profileId, p0.actionsComponentRequest))
					end)
				end
			}
		}
	end
}