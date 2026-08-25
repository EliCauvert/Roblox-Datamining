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

function name.getMessage(_, p0, p1)
	-- upvalues: u13ConfirmTypeModule (ref)
	if p1 == u13ConfirmTypeModule.U13PaymentModal then
		return p0.u13PaymentModal
	elseif p1 == u13ConfirmTypeModule.U13MonthlyThreshold1Modal then
		return p0.u13MonthlyThreshold1Modal
	elseif p1 == u13ConfirmTypeModule.U13MonthlyThreshold2Modal then
		return p0.u13MonthlyThreshold2Modal
	elseif p1 == u13ConfirmTypeModule.ParentalConsentWarningPaymentModal13To17 then
		return p0.parentalConsentWarningPaymentModal13To17
	end
end

function name.render(p2)
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
		render = function(p3)
			-- upvalues: p2 (ref)
			return p2:renderAlert(p3)
		end
	})
end

function name.renderAlert(p4, p5)
	-- upvalues: roactModule (ref), interactiveAlert (ref), buttonType (ref)
	local props = p4.props
	
	return roactModule.createElement(interactiveAlert, {
		anchorPoint = props.anchorPoint,
		position = props.position,
		screenSize = props.screenSize,
		title = p5.title,
		bodyText = p4:getMessage(p5, props.modalType),
		buttonStackInfo = {
			buttons = {
				{
					props = {
						onActivated = props.cancelActivated,
						text = p5.cancel,
						inputIcon = props.cancelControllerIcon
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = props.doneActivated,
						text = p5.confirm,
						inputIcon = props.doneControllerIcon
					}
				}
			}
		}
	})
end

return name