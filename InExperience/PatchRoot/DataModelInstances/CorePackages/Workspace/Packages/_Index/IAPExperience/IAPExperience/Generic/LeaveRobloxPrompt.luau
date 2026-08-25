local parent = script.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local UIBloxModule = require(parent_1.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local multiTextLocalizerModule = require(parent.Locale.MultiTextLocalizer)
local name = roactModule.Component:extend(script.Name)
name.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function name.render(p0)
	-- upvalues: roactModule (ref), multiTextLocalizerModule (ref)
	return roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			TitleText = { key = "IAPExperience.LeaveRoblox.Title.LeavingRoblox" },
			BodyText = {
				key = "IAPExperience.LeaveRoblox.Text.ExternalWebsiteWarning"
			},
			ButtonCancel = { key = "IAPExperience.LeaveRoblox.Action.Cancel" },
			ButtonContinue = { key = "IAPExperience.LeaveRoblox.Action.Continue" }
		},
		render = function(p1)
			-- upvalues: p0 (ref)
			return p0:renderAlert(p1)
		end
	})
end

function name.renderAlert(p2, p3)
	-- upvalues: roactModule (ref), interactiveAlert (ref), buttonType (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Active = true,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	}, {
		AlertWindow = roactModule.createElement(interactiveAlert, {
			title = p3.TitleText,
			bodyText = p3.BodyText,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = {
							onActivated = p2.props.cancelActivated,
							text = p3.ButtonCancel
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = p2.props.continueActivated,
							text = p3.ButtonContinue
						}
					}
				}
			},
			screenSize = p2.props.screenSize
		})
	})
end

return name