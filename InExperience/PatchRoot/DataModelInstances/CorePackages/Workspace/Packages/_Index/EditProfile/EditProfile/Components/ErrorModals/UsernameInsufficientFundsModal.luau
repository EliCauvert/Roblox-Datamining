local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local TextKeysModule = require(EditProfile.Common.TextKeys)
local FFlagEditProfileFixFocusNavigationModule = require(EditProfile.Flags.FFlagEditProfileFixFocusNavigation)
local FocusNavigatorWrapperModule = require(EditProfile.Utils.FocusNavigatorWrapper)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Character = utf8.char(57346)

return function(p1) --[[ Line: 23 | Named "EditDisplayNameErrorModal" ]]
	-- upvalues: UseScreenSizeFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), Character (copy), AppPage (copy), FFlagEditProfileFixFocusNavigationModule (copy), FocusNavigatorWrapperModule (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		cancelButtonText = TextKeysModule.CancelButtonText,
		buy = TextKeysModule.Buy,
		insufficientFunds = TextKeysModule.InsufficientFunds,
		message = {
			TextKeysModule.InsufficientFundsMessage,
			icon = Character,
			rbx = p1.navigation.getParam("robux")
		}
	})
	
	local function onClose() --[[ Line: 33 ]]
		-- upvalues: p1 (copy)
		p1.navigation.goBack()
	end
	
	local function OnActivated() --[[ Line: 37 ]]
		-- upvalues: p1 (copy), AppPage (upval)
		p1.navigation.navigate(AppPage.PurchaseRobux)
	end
	
	return if FFlagEditProfileFixFocusNavigationModule then FocusNavigatorWrapperModule({ onClose = onClose }, {
		ReactModule.createElement(InteractiveAlert, {
			screenSize = UseScreenSizeResult,
			title = UseLocalizationResult.insufficientFunds,
			bodyText = UseLocalizationResult.message,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = {
							onActivated = onClose,
							text = UseLocalizationResult.cancelButtonText
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = OnActivated,
							text = UseLocalizationResult.buy
						}
					}
				}
			}
		})
	}) else ReactModule.createElement(InteractiveAlert, {
		screenSize = UseScreenSizeResult,
		title = UseLocalizationResult.insufficientFunds,
		bodyText = UseLocalizationResult.message,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = onClose,
						text = UseLocalizationResult.cancelButtonText
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = OnActivated,
						text = UseLocalizationResult.buy
					}
				}
			}
		}
	})
end