local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local UIBloxModule = require(Parent1.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local MultiTextLocalizerModule = require(Parent.Locale.MultiTextLocalizer)
local ExtendResult = RoactModule.Component:extend(script.Name)
ExtendResult.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), MultiTextLocalizerModule (copy)
	return RoactModule.createElement(MultiTextLocalizerModule, {
		keys = {
			TitleText = { key = "IAPExperience.LeaveRoblox.Title.LeavingRoblox" },
			BodyText = {
				key = "IAPExperience.LeaveRoblox.Text.ExternalWebsiteWarning"
			},
			ButtonCancel = { key = "IAPExperience.LeaveRoblox.Action.Cancel" },
			ButtonContinue = { key = "IAPExperience.LeaveRoblox.Action.Continue" }
		},
		render = function(p2)
			-- upvalues: p1 (copy)
			return p1:renderAlert(p2)
		end
	})
end

function ExtendResult.renderAlert(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return (RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Active = true,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	}, {
		AlertWindow = RoactModule.createElement(InteractiveAlert, {
			title = p2.TitleText,
			bodyText = p2.BodyText,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = {
							onActivated = p1.props.cancelActivated,
							text = p2.ButtonCancel
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = p1.props.continueActivated,
							text = p2.ButtonContinue
						}
					}
				}
			},
			screenSize = p1.props.screenSize
		})
	}))
end

return ExtendResult