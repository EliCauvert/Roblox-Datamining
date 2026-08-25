local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local appPage = require(parent.RobloxAppEnums).AppPage
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local localizationModule = require(parent.Localization)
local textKeysModule = require(editProfile.Common.TextKeys)
local fFlagEditProfileFixFocusNavigationModule = require(editProfile.Flags.FFlagEditProfileFixFocusNavigation)
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local useLocalization = localizationModule.Hooks.useLocalization
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local char = utf8.char(57346)

return function(p0)
	-- upvalues: useScreenSize (ref), useLocalization (ref), textKeysModule (ref), char (ref), appPage (ref), fFlagEditProfileFixFocusNavigationModule (ref), focusNavigatorWrapperModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var8 = useScreenSize()
	local var9 = useLocalization({
		cancelButtonText = textKeysModule.CancelButtonText,
		buy = textKeysModule.Buy,
		insufficientFunds = textKeysModule.InsufficientFunds,
		message = {
			textKeysModule.InsufficientFundsMessage,
			icon = char,
			rbx = p0.navigation.getParam("robux")
		}
	})
	
	local function onClose()
		-- upvalues: p0 (ref)
		p0.navigation.goBack()
	end
	
	local var11 = function()
		-- upvalues: p0 (ref), appPage (copy)
		p0.navigation.navigate(appPage.PurchaseRobux)
	end
	
	return if fFlagEditProfileFixFocusNavigationModule then focusNavigatorWrapperModule({ onClose = onClose }, {
		reactModule.createElement(interactiveAlert, {
			screenSize = var8,
			title = var9.insufficientFunds,
			bodyText = var9.message,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = { onActivated = onClose, text = var9.cancelButtonText }
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = var11, text = var9.buy }
					}
				}
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		screenSize = var8,
		title = var9.insufficientFunds,
		bodyText = var9.message,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = { onActivated = onClose, text = var9.cancelButtonText }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = var11, text = var9.buy }
				}
			}
		}
	})
end