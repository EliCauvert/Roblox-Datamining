local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local EnumerateFunction = require(PurchasePrompt.Parent.PurchasePromptDeps).enumerate
local AddRawValueMethodToEnumModule: (any, any) -> () = require(PurchasePrompt.Utils.addRawValueMethodToEnum)
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
local EnumerateResult = EnumerateFunction(script.Name, config)
AddRawValueMethodToEnumModule(EnumerateResult, config)

return EnumerateResult