local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local UIBloxModule = require(Parent1.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
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
			-- upvalues: p1 (copy)
			return p1:renderAlert(p2)
		end
	})
end

function ExtendResult.renderAlert(p1, p2)
	-- upvalues: ButtonType (copy), RoactModule (copy), InteractiveAlert (copy), Images (copy)
	local Props = p1.props
	
	return RoactModule.createElement(InteractiveAlert, {
		anchorPoint = Props.anchorPoint,
		position = Props.position,
		screenSize = Props.screenSize,
		title = p2.title,
		titleIcon = Images["icons/status/error_large"],
		bodyText = p2.message,
		buttonStackInfo = if Props.openSecuritySettings then {
			buttons = {
				{
					props = {
						onActivated = Props.closePrompt,
						text = p2.cancel,
						inputIcon = Props.cancelControllerIcon
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = Props.openSecuritySettings,
						text = p2.gotoSecurity,
						inputIcon = Props.doneControllerIcon
					}
				}
			}
		} else {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = Props.closePrompt,
						text = p2.backToGame,
						inputIcon = Props.doneControllerIcon
					}
				}
			}
		}
	})
end

return ExtendResult