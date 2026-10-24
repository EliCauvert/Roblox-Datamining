local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local config = {
	None = "None",
	Product = "Product",
	RobuxUpsell = "RobuxUpsell",
	RobuxUpsellV2 = "RobuxUpsellV2",
	LargeRobuxUpsell = "LargeRobuxUpsell"
}
local EnumerateResult = require(PurchasePrompt.Parent.PurchasePromptDeps).enumerate(script.Name, config)
require(PurchasePrompt.Utils.addRawValueMethodToEnum)(EnumerateResult, config)

return EnumerateResult