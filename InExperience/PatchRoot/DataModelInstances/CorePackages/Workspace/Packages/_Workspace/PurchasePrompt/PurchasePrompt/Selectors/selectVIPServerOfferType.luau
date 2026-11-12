local SelectProductPriceModule = require(script.Parent.selectProductPrice)
local _ = require(script:FindFirstAncestor("PurchasePrompt").types)

return function(p1): string
	-- upvalues: SelectProductPriceModule (copy)
	return if p1.productInfo.isFreeWithRobloxPlus then "plus_included" elseif SelectProductPriceModule(p1) == 0 then "free" else "paid"
end