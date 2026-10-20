local TModule = require(script:FindFirstAncestor("DataHydration").Parent.t)
local _ = require(script.Parent.Types.store)
local InterfaceResult = TModule.interface({
	canFund = TModule.boolean,
	fundingSource = TModule.union(TModule.literal("ad_credit"), TModule.literal("robux"), TModule.literal("none"))
})

return function(p1)
	-- upvalues: InterfaceResult (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
	
	if InterfaceResultResult then
		return p1, nil
	else
		return nil, "Invalid ad campaign check funds response: " .. tostring(InterfaceResultResult2)
	end
end