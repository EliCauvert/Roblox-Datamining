local TModule = require(script:FindFirstAncestor("DataHydration").Parent.t)
local _ = require(script.Parent.Types.store)
local InterfaceResult = TModule.interface({
	status = TModule.union(TModule.literal("none"), TModule.literal("processing"), TModule.literal("created"), TModule.literal("failed")),
	campaignId = TModule.optional(TModule.string)
})

return function(p1)
	-- upvalues: InterfaceResult (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
	
	if not InterfaceResultResult then
		return nil, "Invalid ad campaign tool-call status response: " .. tostring(InterfaceResultResult2)
	elseif p1.status == "" or p1.campaignId == "" then
		return nil, "Invalid ad campaign tool-call status response: status and campaignId must be non-empty"
	else
		return p1, nil
	end
end