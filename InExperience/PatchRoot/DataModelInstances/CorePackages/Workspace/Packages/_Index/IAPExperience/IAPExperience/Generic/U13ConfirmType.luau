local parent = script.Parent.Parent
local parent_1 = parent.Parent
local addRawValueMethodToEnumModule = require(parent.Utility.addRawValueMethodToEnum)
local t = {
	None = "None",
	U13PaymentModal = "U13PaymentModal",
	U13MonthlyThreshold1Modal = "U13MonthlyThreshold1Modal",
	U13MonthlyThreshold2Modal = "U13MonthlyThreshold2Modal",
	ParentalConsentWarningPaymentModal13To17 = "ParentalConsentWarningPaymentModal13To17"
}
local var1 = require(parent_1.enumerate)(script.Name, t)
addRawValueMethodToEnumModule(var1, t)

return var1