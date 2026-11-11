local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local UrlModule = require(Modules.LuaApp.Http.Url)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Toggle = FoundationModule.Toggle
local View = FoundationModule.View
local Text = FoundationModule.Text

return function()
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), UrlModule (copy), HttpService (copy), NewResult (copy), CloseCentralOverlayModule (copy), Dialog (copy), DialogSize (copy), View (copy), Text (copy), Toggle (copy), InputSize (copy), ButtonVariant (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		header = "Notifications.DesktopPushNotificationPrompts.Heading.EnablePrompt",
		description = "Notifications.DesktopPushNotificationPrompts.Description.EnablePrompt",
		switchLabel = "Notifications.DesktopPushNotificationPrompts.Label.GetNotifications",
		buttonText = "Notifications.DesktopPushNotificationPrompts.Action.OK"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UrlModule (upval), HttpService (upval), NewResult (upval)
		local config = {
			Method = "POST",
			Url = UrlModule.APIS_URL .. "user-settings-api/v2/user-settings",
			Body = HttpService:JSONEncode({
				aggregatedDesktopNotifications = if UseStateResult then "Enabled" else "Disabled"
			}),
			Headers = { ["Content-Type"] = "application/json" }
		}
		spawn(function()
			-- upvalues: HttpService (upval), config (copy), NewResult (upval)
			HttpService:RequestInternal(config):Start(function(p1, p2)
				-- upvalues: NewResult (upval)
				if not p1 then
					NewResult:error("Error updating user notification preferences. Status code: " .. tostring(p2.StatusCode))
					
					return
				end
				if p2.StatusCode < 200 or p2.StatusCode >= 300 then
					NewResult:error("Error updating user notification preferences. Status code: " .. tostring(p2.StatusCode))
					
					return
				else
					NewResult:info("Successfully updated user notification preferences.")
				end
			end)
		end)
	end, { UseStateResult })
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Medium }, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.header }),
		DialogText = ReactModule.createElement(Dialog.Text, {
			LayoutOrder = 2,
			Text = UseLocalizationResult.description
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 3 }, {
			ReactModule.createElement(View, {
				tag = "row size-full-0 auto-y padding-medium bg-shift-100 radius-medium"
			}, {
				Text = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "fill auto-y",
					Text = UseLocalizationResult.switchLabel,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				Toggle = ReactModule.createElement(Toggle, {
					label = "",
					LayoutOrder = 2,
					isChecked = UseStateResult,
					size = InputSize.Medium,
					onActivated = ReactModule.useCallback(function(p1)
						-- upvalues: UseStateResult2 (copy)
						UseStateResult2(p1)
					end, {})
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					variant = ButtonVariant.Emphasis,
					text = UseLocalizationResult.buttonText,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseResult (copy), UseDispatchResult (copy), CloseCentralOverlayModule (upval)
						UseResult()
						
						return UseDispatchResult(CloseCentralOverlayModule())
					end, { UseDispatchResult, UseResult })
				}
			}
		})
	})
end