local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local EnableToastNotificationsDeeplinkConfirmationModalHeightFix = game:DefineFastFlag("EnableToastNotificationsDeeplinkConfirmationModalHeightFix", false)
local RobloxTranslatorModule = require(Parent1.RobloxTranslator)
local FFlagGameInviteInExpJoinCta3 = require(Parent1.SharedFlags).FFlagGameInviteInExpJoinCta3
local IsGameInviteJoinForPioneerEnabledModule = require(Parent.utils.isGameInviteJoinForPioneerEnabled)

return function(p1)
	-- upvalues: ReactModule (copy), FFlagGameInviteInExpJoinCta3 (copy), IsGameInviteJoinForPioneerEnabledModule (copy), RobloxTranslatorModule (copy), EnableToastNotificationsDeeplinkConfirmationModalHeightFix (copy), GuiService (copy), ReactRobloxModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(800, 600))
	local FFlagGameInviteInExpJoinCta3_1 = FFlagGameInviteInExpJoinCta3 or IsGameInviteJoinForPioneerEnabledModule
	
	return ReactModule.createElement("Frame", {
		Active = true,
		BackgroundTransparency = if p1.backgroundTransparency then p1.backgroundTransparency else 0.5,
		BackgroundColor3 = Color3.new(0, 0, 0),
		Size = UDim2.new(1, 0, 1, if EnableToastNotificationsDeeplinkConfirmationModalHeightFix then GuiService.TopbarInset.Height else 0),
		[ReactRobloxModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end,
		Position = if EnableToastNotificationsDeeplinkConfirmationModalHeightFix then UDim2.fromOffset(0, -GuiService.TopbarInset.Height) else nil
	}, {
		Alert = ReactModule.createElement(InteractiveAlert, {
			screenSize = UseStateResult,
			title = RobloxTranslatorModule:FormatByKey(FFlagGameInviteInExpJoinCta3_1 and p1.titleKey or "Notifications.ToastNotifications.Title.LeavingExperience"),
			bodyText = RobloxTranslatorModule:FormatByKey(FFlagGameInviteInExpJoinCta3_1 and p1.bodyKey or "Notifications.ToastNotifications.Label.LeaveExperienceConfirmation"),
			buttonStackInfo = {
				buttons = {
					{
						props = {
							onActivated = function()
								-- upvalues: p1 (copy)
								p1.closeCallback(false)
							end,
							text = RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Cancel")
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = function()
								-- upvalues: p1 (copy)
								p1.closeCallback(true)
							end,
							text = RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Confirm")
						}
					}
				}
			}
		})
	})
end