local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local config = {
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
local EnumerateResult = require(PurchasePrompt.Parent.PurchasePromptDeps).enumerate(script.Name, config)
require(PurchasePrompt.Utils.addRawValueMethodToEnum)(EnumerateResult, config)

return EnumerateResult