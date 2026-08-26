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

function name.render(p1)
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
		render = function(p2)
			-- upvalues: p1 (ref)
			return p1:renderAlert(p2)
		end
	})
end

function name.renderAlert(p1, p2)
	-- upvalues: roactModule (ref), interactiveAlert (ref), buttonType (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Active = true,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	}, {
		AlertWindow = roactModule.createElement(interactiveAlert, {
			title = p2.TitleText,
			bodyText = p2.BodyText,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = {
							onActivated = p1.props.cancelActivated,
							text = p2.ButtonCancel
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = p1.props.continueActivated,
							text = p2.ButtonContinue
						}
					}
				}
			},
			screenSize = p1.props.screenSize
		})
	})
end

return name