local tModule = require(script:FindFirstAncestor("DataHydration").Parent.t)
local _ = require(script.Parent.Types.store)
local var1 = tModule.interface({
	status = tModule.union(tModule.literal("none"), tModule.literal("processing"), tModule.literal("created"), tModule.literal("failed")),
	campaignId = tModule.optional(tModule.string)
})

return function(p1)
	-- upvalues: var1 (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		return nil, "Invalid ad campaign tool-call status response: " .. tostring(var3)
	elseif p1.status == "" or p1.campaignId == "" then
		return nil, "Invalid ad campaign tool-call status response: status and campaignId must be non-empty"
	end
	return p1, nil
end