local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local Images = require(Parent.UIBlox).App.ImageSet.Images
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local MyUserBlockingNetworkingModule = require(ProfilePlatform.Networking.myUserBlockingNetworking)
local RefreshProfilePlatformActionInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes
local USERBLOCKINGERRORS = require(ProfilePlatform.Common.Constants).USER_BLOCKING_ERRORS

return {
	[EnumsModule.ProfileActions.Block] = function(p1) --[[ Line: 24 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), AppPage (copy), SetCurrentToastMessageFunction (copy), Images (copy), RefreshProfilePlatformActionInfoModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.Block],
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 28 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), AppPage (upval), SetCurrentToastMessageFunction (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonBlock, { buttonSurface = p1.buttonSurface })
					p1.navigation.push(AppPage.BlockingModal, {
						navProps = {
							userId = p1.profileId,
							onBlockSuccess = function() --[[ Line: 35 ]]
								-- upvalues: p1 (upval), SetCurrentToastMessageFunction (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval)
								p1.dispatch(SetCurrentToastMessageFunction({
									isLocalized = true,
									toastMessage = p1.localized.userBlockedToast,
									toastIcon = Images["icons/actions/block"]
								}))
								p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
							end
						}
					})
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.Unblock] = function(p1) --[[ Line: 53 ]]
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), MyUserBlockingNetworkingModule (copy), RefreshProfilePlatformActionInfoModule (copy), USERBLOCKINGERRORS (copy), SetCurrentToastMessageFunction (copy)
		return {
			variant = ButtonVariant.Standard,
			text = p1.localized[EnumsModule.ProfileActions.Unblock],
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 58 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), MyUserBlockingNetworkingModule (upval), RefreshProfilePlatformActionInfoModule (upval), USERBLOCKINGERRORS (upval), SetCurrentToastMessageFunction (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonUnblock, { buttonSurface = p1.buttonSurface })
					
					return p1.dispatch(MyUserBlockingNetworkingModule.UnblockUserById.API({ userId = p1.profileId, currentUserId = p1.localUserId })):andThen(function() --[[ Line: 67 ]]
						-- upvalues: p1 (upval), RefreshProfilePlatformActionInfoModule (upval)
						return p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end):catch(function(Err) --[[ Line: 72 ]]
						-- upvalues: USERBLOCKINGERRORS (upval), p1 (upval), SetCurrentToastMessageFunction (upval)
						if Err ~= nil and tonumber(Err.Body) == USERBLOCKINGERRORS.PARENT_BLOCKED_TARGET_USER_ERROR then
							p1.dispatch(SetCurrentToastMessageFunction({
								isLocalized = true,
								toastMessage = p1.localized.unblockTargetParentManagedToast
							}))
							
							return
						end
						if Err ~= nil and tonumber(Err.Body) == USERBLOCKINGERRORS.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
							p1.dispatch(SetCurrentToastMessageFunction({
								isLocalized = true,
								toastMessage = p1.localized.unblockTargetNotBlockedToast
							}))
							
							return
						end
						if Err == nil or tonumber(Err.Body) ~= USERBLOCKINGERRORS.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
							p1.dispatch(SetCurrentToastMessageFunction({
								isLocalized = true,
								toastMessage = p1.localized.somethingIsWrongToast
							}))
							
							return
						else
							p1.dispatch(SetCurrentToastMessageFunction({
								isLocalized = true,
								toastMessage = p1.localized.blockedOnPlatformToast
							}))
						end
					end)
				end
			}
		}
	end
}