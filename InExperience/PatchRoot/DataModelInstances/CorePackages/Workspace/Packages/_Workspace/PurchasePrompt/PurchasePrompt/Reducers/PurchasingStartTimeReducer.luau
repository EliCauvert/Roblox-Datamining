local startPurchaseModule = require(script.Parent.Parent.Actions.StartPurchase)

return function(p0, p1)
	-- upvalues: startPurchaseModule (ref)
	p0 = p0 or -1
	
	return if p1.type == startPurchaseModule.name then p1.purchasingStartTime else p0
end