local StartPurchaseModule = require(script.Parent.Parent.Actions.StartPurchase)

return function(p1, p2) --[[ Line: 5 | Named "PurchasingStartTimeReducer" ]]
	-- upvalues: StartPurchaseModule (copy)
	local P0 = p1 or -1
	
	return if p2.type == StartPurchaseModule.name then p2.purchasingStartTime else P0
end