local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local textKeysModule = require(editProfile.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local fFlagEditProfileFixFocusNavigationModule = require(editProfile.Flags.FFlagEditProfileFixFocusNavigation)
local useDisplayNameTextModule = require(editProfile.Hooks.useDisplayNameText)
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)

return function(p1)
	-- upvalues: useScreenSize (ref), useDisplayNameTextModule (ref), useLocalization (ref), textKeysModule (ref), fFlagEditProfileFixFocusNavigationModule (ref), focusNavigatorWrapperModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var1 = useScreenSize()
	local var2 = useDisplayNameTextModule()
	local var3 = useLocalization({ OK = textKeysModule.OK })
	
	local function onClose()
		-- upvalues: p1 (ref)
		p1.navigation.goBack()
	end
	
	return if fFlagEditProfileFixFocusNavigationModule then focusNavigatorWrapperModule({ onClose = onClose }, {
		reactModule.createElement(interactiveAlert, {
			screenSize = var1,
			title = var2.displayNameEditMessage,
			bodyText = var2.displayNameCoolDownMessage,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = onClose, text = var3.OK }
					}
				}
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		screenSize = var1,
		title = var2.displayNameEditMessage,
		bodyText = var2.displayNameCoolDownMessage,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = onClose, text = var3.OK }
				}
			}
		}
	})
end