local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local EnumerateFunction = require(PurchasePrompt.Parent.PurchasePromptDeps).enumerate
local AddRawValueMethodToEnumModule: (any, any) -> () = require(PurchasePrompt.Utils.addRawValueMethodToEnum)
local config = {
	None = "None",
	Product = "Product",
	RobuxUpsell = "RobuxUpsell",
	RobuxUpsellV2 = "RobuxUpsellV2",
	LargeRobuxUpsell = "LargeRobuxUpsell"
}
local EnumerateResult = EnumerateFunction(script.Name, config)
AddRawValueMethodToEnumModule(EnumerateResult, config)

return EnumerateResult