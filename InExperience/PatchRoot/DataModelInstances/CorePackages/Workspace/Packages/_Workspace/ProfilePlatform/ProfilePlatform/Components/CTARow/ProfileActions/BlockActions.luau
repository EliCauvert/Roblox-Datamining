local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local buttonVariant = foundationModule.Enums.ButtonVariant
local images = UIBloxModule.App.ImageSet.Images
local appPage = robloxAppEnumsModule.AppPage
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local myUserBlockingNetworkingModule = require(profilePlatform.Networking.myUserBlockingNetworking)
local refreshProfilePlatformActionInfoModule = require(profilePlatform.Networking.refreshProfilePlatformActionInfo)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local constantsModule = require(profilePlatform.Common.Constants)
local profileTypes = enumsModule.ProfileTypes
local fFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage)
local USER_BLOCKING_ERRORS = constantsModule.USER_BLOCKING_ERRORS

return {
	[enumsModule.ProfileActions.Block] = function(p0) --[[ line: 27 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), setCurrentToastMessage (ref), images (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.Block],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 31 ]]
					-- upvalues: p0 (ref), eventNamesModule (copy), appPage (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonBlock, { buttonSurface = p0.buttonSurface })
					p0.navigation.push(appPage.BlockingModal, {
						navProps = {
							userId = p0.profileId,
							onBlockSuccess = function() --[[ line: 38 ]]
								-- upvalues: p0 (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
								p0.dispatch(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = p0.localized.userBlockedToast,
									toastIcon = images["icons/actions/block"]
								}))
								p0.dispatch(refreshProfilePlatformActionInfoModule(p0.profileId, p0.actionsComponentRequest))
							end
						}
					})
				end
			}
		}
	end,
	[enumsModule.ProfileActions.Unblock] = function(p1) --[[ line: 56 ]]
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), myUserBlockingNetworkingModule (ref), refreshProfilePlatformActionInfoModule (ref), USER_BLOCKING_ERRORS (ref), setCurrentToastMessage (ref), fFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule (ref)
		return {
			variant = buttonVariant.Standard,
			text = p1.localized[enumsModule.ProfileActions.Unblock],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 61 ]]
					-- upvalues: p1 (ref), eventNamesModule (copy), myUserBlockingNetworkingModule (copy), refreshProfilePlatformActionInfoModule (copy), USER_BLOCKING_ERRORS (copy), setCurrentToastMessage (copy), fFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonUnblock, { buttonSurface = p1.buttonSurface })
					
					return p1.dispatch(myUserBlockingNetworkingModule.UnblockUserById.API({ userId = p1.profileId, currentUserId = p1.localUserId })):andThen(function() --[[ line: 70 ]]
						-- upvalues: p1 (copy), refreshProfilePlatformActionInfoModule (copy)
						return p1.dispatch(refreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end):catch(function(p2) --[[ line: 75 ]]
						-- upvalues: USER_BLOCKING_ERRORS (copy), p1 (copy), setCurrentToastMessage (copy), fFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule (copy)
						if p2 ~= nil and tonumber(p2.Body) == USER_BLOCKING_ERRORS.PARENT_BLOCKED_TARGET_USER_ERROR then
							p1.dispatch(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = p1.localized.unblockTargetParentManagedToast
							}))
							
							return
						elseif p2 ~= nil and tonumber(p2.Body) == USER_BLOCKING_ERRORS.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
							p1.dispatch(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = p1.localized.unblockTargetNotBlockedToast
							}))
							
							return
						elseif fFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule and p2 ~= nil and tonumber(p2.Body) == USER_BLOCKING_ERRORS.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
							p1.dispatch(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = p1.localized.blockedOnPlatformToast
							}))
							
							return
						end
						p1.dispatch(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = p1.localized.somethingIsWrongToast
						}))
					end)
				end
			}
		}
	end
}