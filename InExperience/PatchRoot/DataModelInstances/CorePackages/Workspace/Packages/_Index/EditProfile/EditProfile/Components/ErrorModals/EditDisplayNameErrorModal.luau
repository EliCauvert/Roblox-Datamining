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

return function(p0)
	-- upvalues: useScreenSize (ref), useDisplayNameTextModule (ref), useLocalization (ref), textKeysModule (ref), fFlagEditProfileFixFocusNavigationModule (ref), focusNavigatorWrapperModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var7 = useScreenSize()
	local var8 = useDisplayNameTextModule()
	local var9 = useLocalization({ OK = textKeysModule.OK })
	
	local function onClose()
		-- upvalues: p0 (ref)
		p0.navigation.goBack()
	end
	
	return if fFlagEditProfileFixFocusNavigationModule then focusNavigatorWrapperModule({ onClose = onClose }, {
		reactModule.createElement(interactiveAlert, {
			screenSize = var7,
			title = var8.displayNameEditMessage,
			bodyText = var8.displayNameCoolDownMessage,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = onClose, text = var9.OK }
					}
				}
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		screenSize = var7,
		title = var8.displayNameEditMessage,
		bodyText = var8.displayNameCoolDownMessage,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = onClose, text = var9.OK }
				}
			}
		}
	})
end