local parent = script:FindFirstAncestor("PurchasePrompt").Parent
local _ = require(parent.IAPExperience)
local _ = require(parent.LuauPolyfill)

return {
	ProductTypeEnum = require(parent.PurchasePromptLite).Enums.ProductKind
}