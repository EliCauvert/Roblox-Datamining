local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)

return function(p1)
	-- upvalues: UseLocalizationModule (copy), ReactModule (copy), GuiService (copy), NotificationTypeModule (copy), Button (copy), ButtonType (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, p1.buttonHeight)
	}, {
		UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(p1.buttonMaxWidth, p1.buttonHeight)
		}),
		ExitAppButton = ReactModule.createElement(Button, {
			isDisabled = false,
			isLoading = false,
			buttonType = ButtonType.Secondary,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: GuiService (upval), NotificationTypeModule (upval)
				GuiService:BroadcastNotification("", NotificationTypeModule.NATIVE_EXIT)
			end, {}),
			maxWidth = p1.buttonMaxWidth,
			size = UDim2.new(1, 0, 0, p1.buttonHeight),
			text = UseLocalizationModule({
				closeRoblox = "CoreScripts.Feedback.FeedbackBar.ExitFeedbackButton"
			}).closeRoblox
		})
	})
end