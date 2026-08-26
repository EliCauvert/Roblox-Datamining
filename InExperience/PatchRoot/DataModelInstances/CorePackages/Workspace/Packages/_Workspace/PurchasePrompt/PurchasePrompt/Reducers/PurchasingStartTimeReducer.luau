local startPurchaseModule = require(script.Parent.Parent.Actions.StartPurchase)

return function(p1, p2)
	-- upvalues: startPurchaseModule (ref)
	p1 = p1 or -1
	
	return if p2.type == startPurchaseModule.name then p2.purchasingStartTime else p1
end