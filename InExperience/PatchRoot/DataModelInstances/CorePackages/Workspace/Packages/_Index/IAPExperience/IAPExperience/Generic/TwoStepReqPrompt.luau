local parent = script.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local UIBloxModule = require(parent_1.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
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
			title = {
				key = "Authentication.TwoStepVerification.Title.VerificationRequired"
			},
			message = {
				key = "Authentication.TwoStepVerification.Label.TwoStepRequired"
			},
			cancel = { key = "Authentication.TwoStepVerification.Action.Cancel" },
			backToGame = { key = "IAPExperience.PurchaseSuccess.Action.BackToGame" },
			gotoSecurity = {
				key = "Authentication.TwoStepVerification.Action.GoToSecurity"
			}
		},
		render = function(p2)
			-- upvalues: p1 (ref)
			return p1:renderAlert(p2)
		end
	})
end

function name.renderAlert(p1, p2)
	-- upvalues: buttonType (ref), roactModule (ref), interactiveAlert (ref), images (ref)
	local props = p1.props
	
	return roactModule.createElement(interactiveAlert, {
		anchorPoint = props.anchorPoint,
		position = props.position,
		screenSize = props.screenSize,
		title = p2.title,
		titleIcon = images["icons/status/error_large"],
		bodyText = p2.message,
		buttonStackInfo = if props.openSecuritySettings then {
			buttons = {
				{
					props = {
						onActivated = props.closePrompt,
						text = p2.cancel,
						inputIcon = props.cancelControllerIcon
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = props.openSecuritySettings,
						text = p2.gotoSecurity,
						inputIcon = props.doneControllerIcon
					}
				}
			}
		} else {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = props.closePrompt,
						text = p2.backToGame,
						inputIcon = props.doneControllerIcon
					}
				}
			}
		}
	})
end

return name