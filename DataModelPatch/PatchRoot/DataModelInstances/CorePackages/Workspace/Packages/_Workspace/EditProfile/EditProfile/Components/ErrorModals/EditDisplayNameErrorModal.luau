local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local TextKeysModule = require(EditProfile.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local FFlagEditProfileFixFocusNavigationModule = require(EditProfile.Flags.FFlagEditProfileFixFocusNavigation)
local UseDisplayNameTextModule = require(EditProfile.Hooks.useDisplayNameText)
local FocusNavigatorWrapperModule = require(EditProfile.Utils.FocusNavigatorWrapper)

return function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseDisplayNameTextModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), FFlagEditProfileFixFocusNavigationModule (copy), FocusNavigatorWrapperModule (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDisplayNameTextModuleResult = UseDisplayNameTextModule()
	local UseLocalizationResult = UseLocalizationFunction({ OK = TextKeysModule.OK })
	
	local function onClose()
		-- upvalues: p1 (copy)
		p1.navigation.goBack()
	end
	
	return if FFlagEditProfileFixFocusNavigationModule then FocusNavigatorWrapperModule({ onClose = onClose }, {
		ReactModule.createElement(InteractiveAlert, {
			screenSize = UseScreenSizeResult,
			title = UseDisplayNameTextModuleResult.displayNameEditMessage,
			bodyText = UseDisplayNameTextModuleResult.displayNameCoolDownMessage,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = { onActivated = onClose, text = UseLocalizationResult.OK }
					}
				}
			}
		})
	}) else ReactModule.createElement(InteractiveAlert, {
		screenSize = UseScreenSizeResult,
		title = UseDisplayNameTextModuleResult.displayNameEditMessage,
		bodyText = UseDisplayNameTextModuleResult.displayNameCoolDownMessage,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = { onActivated = onClose, text = UseLocalizationResult.OK }
				}
			}
		}
	})
end