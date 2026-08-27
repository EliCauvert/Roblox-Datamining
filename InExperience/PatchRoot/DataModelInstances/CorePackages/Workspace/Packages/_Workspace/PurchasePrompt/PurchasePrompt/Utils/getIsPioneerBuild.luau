local pioneerInfo = require(script:FindFirstAncestor("PurchasePrompt").Parent.PioneerUtils).PioneerInfo

return function()
	-- upvalues: pioneerInfo (ref)
	local ok, status = pcall(function()
		-- upvalues: pioneerInfo (copy)
		return pioneerInfo.getPioneerSource() == Enum.PioneerSource.DaveyBazooka
	end)
	
	return ok and status
end