local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local config = {
	None = "None",
	ConfirmedU13PaymentModal = "ConfirmedU13PaymentModal",
	ConfirmedU13MonthlyThreshold1Modal = "ConfirmedU13MonthlyThreshold1Modal",
	ConfirmedU13MonthlyThreshold2Modal = "ConfirmedU13MonthlyThreshold2Modal",
	ConfirmedParentalConsentWarningPaymentModal13To17 = "ConfirmedParentalConsentWarningPaymentModal13To17"
}
local PostPurchaseWarningAcknowledgeModule = {
	UserActionType = require(PurchasePrompt.Parent.PurchasePromptDeps).enumerate(script.Name, config)
}
require(PurchasePrompt.Utils.addRawValueMethodToEnum)(PostPurchaseWarningAcknowledgeModule.UserActionType, config)

function PostPurchaseWarningAcknowledgeModule.Post(p1, p2) --[[ Line: 21 ]]
	-- upvalues: PostPurchaseWarningAcknowledgeModule (copy)
	return p1.postPurchaseWarningAcknowledge((PostPurchaseWarningAcknowledgeModule.UserActionType.toRawValue(p2)))
end

return PostPurchaseWarningAcknowledgeModule