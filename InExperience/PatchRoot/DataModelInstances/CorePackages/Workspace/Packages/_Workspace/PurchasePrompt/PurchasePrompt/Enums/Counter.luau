local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local enumerate = require(purchasePrompt.Parent.PurchasePromptDeps).enumerate
local addRawValueMethodToEnumModule = require(purchasePrompt.Utils.addRawValueMethodToEnum)
local t = {
	UpsellModalShown = "UpsellModalShown",
	UpsellModalShownAgain = "UpsellModalShownAgain",
	UpsellGenericModalShown = "UpsellGenericModalShown",
	UpsellGenericModalShownAgain = "UpsellGenericModalShownAgain",
	Cancelled = "Cancelled",
	UpsellFailedNotEnoughRobux = "UpsellFailedNotEnoughRobux",
	UpsellFailedNativePurchase = "UpsellFailedNativePurchase",
	Failed = "Failed",
	Success = "Success"
}
local var1 = enumerate(script.Name, t)
addRawValueMethodToEnumModule(var1, t)

return var1