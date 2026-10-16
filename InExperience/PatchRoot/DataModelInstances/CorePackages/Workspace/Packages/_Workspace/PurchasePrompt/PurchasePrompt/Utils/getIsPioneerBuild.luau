local PioneerInfo = require(script:FindFirstAncestor("PurchasePrompt").Parent.PioneerUtils).PioneerInfo

return function() --[[ Line: 7 ]]
	-- upvalues: PioneerInfo (copy)
	return PioneerInfo.isDaveyBazooka()
end