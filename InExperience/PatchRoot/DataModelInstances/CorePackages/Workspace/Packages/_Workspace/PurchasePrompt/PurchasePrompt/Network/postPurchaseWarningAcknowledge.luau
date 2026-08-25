local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local enumerate = require(purchasePrompt.Parent.PurchasePromptDeps).enumerate
local addRawValueMethodToEnumModule = require(purchasePrompt.Utils.addRawValueMethodToEnum)
local t = {}
local t_1 = {
	None = "None",
	ConfirmedU13PaymentModal = "ConfirmedU13PaymentModal",
	ConfirmedU13MonthlyThreshold1Modal = "ConfirmedU13MonthlyThreshold1Modal",
	ConfirmedU13MonthlyThreshold2Modal = "ConfirmedU13MonthlyThreshold2Modal",
	ConfirmedParentalConsentWarningPaymentModal13To17 = "ConfirmedParentalConsentWarningPaymentModal13To17"
}
t.UserActionType = enumerate(script.Name, t_1)
addRawValueMethodToEnumModule(t.UserActionType, t_1)

function t.Post(p0, p1)
	-- upvalues: t (ref)
	return p0.postPurchaseWarningAcknowledge(t.UserActionType.toRawValue(p1))
end

return t