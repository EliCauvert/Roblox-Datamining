local Parent = script:FindFirstAncestor("PurchasePrompt").Parent
local _ = require(Parent.IAPExperience)
local _ = require(Parent.LuauPolyfill)

return {
	ProductTypeEnum = require(Parent.PurchasePromptLite).Enums.ProductKind
}