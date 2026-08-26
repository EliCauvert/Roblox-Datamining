local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local UIBloxModule = require(parent_2.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local multiTextLocalizerModule = require(parent_1.Locale.MultiTextLocalizer)
local u13ConfirmTypeModule = require(parent.U13ConfirmType)
local name = roactModule.Component:extend(script.Name)
name.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function name.getMessage(_, p1, p2)
	-- upvalues: u13ConfirmTypeModule (ref)
	if p2 == u13ConfirmTypeModule.U13PaymentModal then
		return p1.u13PaymentModal
	elseif p2 == u13ConfirmTypeModule.U13MonthlyThreshold1Modal then
		return p1.u13MonthlyThreshold1Modal
	elseif p2 == u13ConfirmTypeModule.U13MonthlyThreshold2Modal then
		return p1.u13MonthlyThreshold2Modal
	elseif p2 == u13ConfirmTypeModule.ParentalConsentWarningPaymentModal13To17 then
		return p1.parentalConsentWarningPaymentModal13To17
	end
end

function name.render(p1)
	-- upvalues: roactModule (ref), multiTextLocalizerModule (ref)
	return roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			title = { key = "IAPExperience.U13Confirm.Title.Warning" },
			u13PaymentModal = { key = "IAPExperience.U13Confirm.Text.U13PaymentModal" },
			u13MonthlyThreshold1Modal = {
				key = "IAPExperience.U13Confirm.Text.U13MonthlyThreshold1Modal"
			},
			u13MonthlyThreshold2Modal = {
				key = "IAPExperience.U13Confirm.Text.U13MonthlyThreshold2Modal"
			},
			parentalConsentWarningPaymentModal13To17 = {
				key = "IAPExperience.U13Confirm.Text.ParentalConsentWarningPaymentModal13To17"
			},
			confirm = { key = "IAPExperience.U13Confirm.Action.Confirm" },
			cancel = { key = "IAPExperience.U13Confirm.Action.Cancel" }
		},
		render = function(p2)
			-- upvalues: p1 (ref)
			return p1:renderAlert(p2)
		end
	})
end

function name.renderAlert(p1, p2)
	-- upvalues: roactModule (ref), interactiveAlert (ref), buttonType (ref)
	local props = p1.props
	
	return roactModule.createElement(interactiveAlert, {
		anchorPoint = props.anchorPoint,
		position = props.position,
		screenSize = props.screenSize,
		title = p2.title,
		bodyText = p1:getMessage(p2, props.modalType),
		buttonStackInfo = {
			buttons = {
				{
					props = {
						onActivated = props.cancelActivated,
						text = p2.cancel,
						inputIcon = props.cancelControllerIcon
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = props.doneActivated,
						text = p2.confirm,
						inputIcon = props.doneControllerIcon
					}
				}
			}
		}
	})
end

return name