local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local UIBloxModule = require(Parent2.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local MultiTextLocalizerModule = require(Parent1.Locale.MultiTextLocalizer)
local U13ConfirmTypeModule = require(Parent.U13ConfirmType)
local ExtendResult = RoactModule.Component:extend(script.Name)
ExtendResult.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function ExtendResult:getMessage(p1, ModalType)
	-- upvalues: U13ConfirmTypeModule (copy)
	if ModalType == U13ConfirmTypeModule.U13PaymentModal then
		return p1.u13PaymentModal
	elseif ModalType == U13ConfirmTypeModule.U13MonthlyThreshold1Modal then
		return p1.u13MonthlyThreshold1Modal
	elseif ModalType == U13ConfirmTypeModule.U13MonthlyThreshold2Modal then
		return p1.u13MonthlyThreshold2Modal
	elseif ModalType ~= U13ConfirmTypeModule.ParentalConsentWarningPaymentModal13To17 then return end
	return p1.parentalConsentWarningPaymentModal13To17
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), MultiTextLocalizerModule (copy)
	return RoactModule.createElement(MultiTextLocalizerModule, {
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
			-- upvalues: p1 (copy)
			return p1:renderAlert(p2)
		end
	})
end

function ExtendResult.renderAlert(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local Props = p1.props
	
	return RoactModule.createElement(InteractiveAlert, {
		anchorPoint = Props.anchorPoint,
		position = Props.position,
		screenSize = Props.screenSize,
		title = p2.title,
		bodyText = p1:getMessage(p2, Props.modalType),
		buttonStackInfo = {
			buttons = {
				{
					props = {
						onActivated = Props.cancelActivated,
						text = p2.cancel,
						inputIcon = Props.cancelControllerIcon
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = Props.doneActivated,
						text = p2.confirm,
						inputIcon = Props.doneControllerIcon
					}
				}
			}
		}
	})
end

return ExtendResult