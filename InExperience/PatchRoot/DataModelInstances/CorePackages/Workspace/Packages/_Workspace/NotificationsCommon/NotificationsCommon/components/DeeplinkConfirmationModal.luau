local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local reactRobloxModule = require(parent.ReactRoblox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local enableToastNotificationsDeeplinkConfirmationModalHeightFix = game:DefineFastFlag("EnableToastNotificationsDeeplinkConfirmationModalHeightFix", false)
local robloxTranslatorModule = require(parent.RobloxTranslator)

return function(p1)
	-- upvalues: reactModule (ref), robloxTranslatorModule (ref), enableToastNotificationsDeeplinkConfirmationModalHeightFix (ref), guiService (ref), reactRobloxModule (ref), interactiveAlert (ref), buttonType (ref)
	local var1, var2 = reactModule.useState(Vector2.new(800, 600))
	
	return reactModule.createElement("Frame", {
		Active = true,
		BackgroundTransparency = if p1.backgroundTransparency then p1.backgroundTransparency else 0.5,
		BackgroundColor3 = Color3.new(0, 0, 0),
		Size = UDim2.new(1, 0, 1, if enableToastNotificationsDeeplinkConfirmationModalHeightFix then guiService.TopbarInset.Height else 0),
		[reactRobloxModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var2 (ref)
			var2(p2.AbsoluteSize)
		end,
		Position = if enableToastNotificationsDeeplinkConfirmationModalHeightFix then UDim2.fromOffset(0, -guiService.TopbarInset.Height) else nil
	}, {
		Alert = reactModule.createElement(interactiveAlert, {
			screenSize = var1,
			title = robloxTranslatorModule:FormatByKey("Notifications.ToastNotifications.Title.LeavingExperience"),
			bodyText = robloxTranslatorModule:FormatByKey("Notifications.ToastNotifications.Label.LeaveExperienceConfirmation"),
			buttonStackInfo = {
				buttons = {
					{
						props = {
							onActivated = function()
								-- upvalues: p1 (ref)
								p1.closeCallback(false)
							end,
							text = robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Cancel")
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = function()
								-- upvalues: p1 (ref)
								p1.closeCallback(true)
							end,
							text = robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Confirm")
						}
					}
				}
			}
		})
	})
end