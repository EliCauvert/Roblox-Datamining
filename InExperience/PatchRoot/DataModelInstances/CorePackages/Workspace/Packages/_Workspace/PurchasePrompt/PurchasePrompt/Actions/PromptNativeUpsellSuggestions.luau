local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(purchasePrompt.Models.RobuxUpsell)
local var1 = require(purchasePrompt.Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2) --[[ line: 10 ]]
	return { products = p0, selection = p1, virtualItemBadgeType = p2 }
end)
local t = {
	name = var1.name,
	__call = function(_, p3, p4, p5) --[[ line: 23 ]]
		-- upvalues: var1 (ref)
		return var1(p3, p4, p5)
	end
}
setmetatable(t, t)

return t