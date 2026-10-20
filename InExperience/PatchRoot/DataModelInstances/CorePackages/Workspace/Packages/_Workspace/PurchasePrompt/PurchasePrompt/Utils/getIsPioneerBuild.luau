local PioneerInfo = require(script:FindFirstAncestor("PurchasePrompt").Parent.PioneerUtils).PioneerInfo

return function()
	-- upvalues: PioneerInfo (copy)
	return PioneerInfo.isDaveyBazooka()
end