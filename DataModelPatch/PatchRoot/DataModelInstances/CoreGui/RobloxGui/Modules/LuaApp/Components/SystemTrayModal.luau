local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local NotificationTypeList = GuiService:GetNotificationTypeList()
local FFlagMacMenuBarContentUpdates = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagMacMenuBarContentUpdates()
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: UseAppPolicyFunction (copy), FFlagMacMenuBarContentUpdates (copy), UseLocalizationFunction (copy), ReactModule (copy), GuiService (copy), NotificationTypeList (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1): boolean
		-- upvalues: FFlagMacMenuBarContentUpdates (upval)
		return if FFlagMacMenuBarContentUpdates then p1.getDevicePreferencesPersistentPresenceVariant() == "mac" else false
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		header = "Notifications.DesktopPushNotificationPrompts.Heading.SystemTrayPrompt",
		buttonText = "Notifications.DesktopPushNotificationPrompts.Action.OK",
		description = if FFlagMacMenuBarContentUpdates and UseAppPolicyResult then "Notifications.DesktopPushNotificationPrompts.Description.MenuBarPrompt" else "Notifications.DesktopPushNotificationPrompts.Description.SystemTrayPrompt"
	})
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Medium }, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.header }),
		DialogText = ReactModule.createElement(Dialog.Text, {
			LayoutOrder = 2,
			Text = UseLocalizationResult.description
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					variant = ButtonVariant.Emphasis,
					text = UseLocalizationResult.buttonText,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: GuiService (upval), NotificationTypeList (upval)
						GuiService:BroadcastNotification("", NotificationTypeList.NATIVE_EXIT)
					end, {})
				}
			}
		})
	})
end