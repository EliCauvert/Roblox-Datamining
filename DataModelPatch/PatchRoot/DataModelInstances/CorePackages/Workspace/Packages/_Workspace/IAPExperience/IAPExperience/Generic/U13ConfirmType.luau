local Parent = script.Parent.Parent
local config = {
	None = "None",
	U13PaymentModal = "U13PaymentModal",
	U13MonthlyThreshold1Modal = "U13MonthlyThreshold1Modal",
	U13MonthlyThreshold2Modal = "U13MonthlyThreshold2Modal",
	ParentalConsentWarningPaymentModal13To17 = "ParentalConsentWarningPaymentModal13To17"
}
local v1 = require(Parent.Parent.enumerate)(script.Name, config)
require(Parent.Utility.addRawValueMethodToEnum)(v1, config)

return v1