local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.withLocalization)

return function(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), ReactModule (upval), p1 (copy), InteractiveAlert (upval), ButtonType (upval)
		return WithLocalizationModule({
			cannotSignUpText = "Authentication.SignUp.Heading.CannotSignUp",
			underAgeText = "Authentication.SignUp.Description.UnderAgeAlert",
			understandText = "Authentication.SignUp.Action.IUnderstand"
		})(function(p3)
			-- upvalues: ReactModule (upval), p2 (copy), p1 (upval), InteractiveAlert (upval), ButtonType (upval)
			return ReactModule.createElement("TextButton", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundColor3 = p2.Theme.Overlay.Color,
				AutoButtonColor = false,
				BackgroundTransparency = p2.Theme.Overlay.Transparency,
				ZIndex = p1.ZIndex,
				Text = "",
				Visible = true,
				[ReactModule.Event.Activated] = function()
					-- upvalues: p1 (upval)
					p1.onDismiss()
				end
			}, {
				Alert = ReactModule.createElement(InteractiveAlert, {
					title = p3.cannotSignUpText,
					bodyText = p3.underAgeText,
					buttonStackInfo = {
						buttons = {
							{
								buttonType = ButtonType.PrimarySystem,
								props = {
									text = p3.understandText,
									onActivated = function()
										-- upvalues: p1 (upval)
										p1.onDismiss()
									end
								}
							}
						}
					},
					position = UDim2.fromScale(0.5, 0.5),
					screenSize = Vector2.new(100, 100),
					ZIndex = p1.ZIndex + 1
				})
			})
		end)
	end)
end