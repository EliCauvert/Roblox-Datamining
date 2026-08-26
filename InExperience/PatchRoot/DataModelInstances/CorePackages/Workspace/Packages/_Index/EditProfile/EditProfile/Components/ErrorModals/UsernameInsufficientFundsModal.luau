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

return function(p1)
	-- upvalues: useScreenSize (ref), useLocalization (ref), textKeysModule (ref), char (ref), appPage (ref), fFlagEditProfileFixFocusNavigationModule (ref), focusNavigatorWrapperModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var1 = useScreenSize()
	local var2 = useLocalization({
		cancelButtonText = textKeysModule.CancelButtonText,
		buy = textKeysModule.Buy,
		insufficientFunds = textKeysModule.InsufficientFunds,
		message = {
			textKeysModule.InsufficientFundsMessage,
			icon = char,
			rbx = p1.navigation.getParam("robux")
		}
	})
	
	local function onClose()
		-- upvalues: p1 (ref)
		p1.navigation.goBack()
	end
	
	local var3 = function()
		-- upvalues: p1 (ref), appPage (copy)
		p1.navigation.navigate(appPage.PurchaseRobux)
	end
	
	return if fFlagEditProfileFixFocusNavigationModule then focusNavigatorWrapperModule({ onClose = onClose }, {
		reactModule.createElement(interactiveAlert, {
			screenSize = var1,
			title = var2.insufficientFunds,
			bodyText = var2.message,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = { onActivated = onClose, text = var2.cancelButtonText }
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = var3, text = var2.buy }
					}
				}
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		screenSize = var1,
		title = var2.insufficientFunds,
		bodyText = var2.message,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = { onActivated = onClose, text = var2.cancelButtonText }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = var3, text = var2.buy }
				}
			}
		}
	})
end