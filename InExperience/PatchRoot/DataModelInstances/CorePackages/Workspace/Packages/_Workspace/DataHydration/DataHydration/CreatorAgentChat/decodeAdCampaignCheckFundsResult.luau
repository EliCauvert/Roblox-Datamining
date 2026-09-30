local tModule = require(script:FindFirstAncestor("DataHydration").Parent.t)
local _ = require(script.Parent.Types.store)
local var1 = tModule.interface({
	canFund = tModule.boolean,
	fundingSource = tModule.union(tModule.literal("ad_credit"), tModule.literal("robux"), tModule.literal("none"))
})

return function(p1)
	-- upvalues: var1 (ref)
	local var2, var3 = var1(p1)
	
	if var2 then
		return p1, nil
	end
	return nil, "Invalid ad campaign check funds response: " .. tostring(var3)
end