local pioneerInfo = require(script:FindFirstAncestor("PurchasePrompt").Parent.PioneerUtils).PioneerInfo

return function()
	-- upvalues: pioneerInfo (ref)
	return pioneerInfo.isDaveyBazooka()
end