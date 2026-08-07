local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local enumerate = require(purchasePrompt.Parent.PurchasePromptDeps).enumerate
local addRawValueMethodToEnumModule = require(purchasePrompt.Utils.addRawValueMethodToEnum)
local t = {
	None = "None",
	Product = "Product",
	RobuxUpsell = "RobuxUpsell",
	RobuxUpsellV2 = "RobuxUpsellV2",
	LargeRobuxUpsell = "LargeRobuxUpsell",
	PremiumUpsell = "PremiumUpsell"
}
local var3 = enumerate(script.Name, t)
addRawValueMethodToEnumModule(var3, t)

return var3