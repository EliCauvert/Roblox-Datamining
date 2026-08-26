local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(purchasePrompt.Models.RobuxUpsell)
local var1 = require(purchasePrompt.Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { products = p1, selection = p2, virtualItemBadgeType = p3 }
end)
local t = {
	name = var1.name,
	__call = function(_, p1, p2, p3)
		-- upvalues: var1 (ref)
		return var1(p1, p2, p3)
	end
}
setmetatable(t, t)

return t