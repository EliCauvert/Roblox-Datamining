local TModule = require(script:FindFirstAncestor("DataHydration").Parent.t)
local _ = require(script.Parent.Types.store)
local FFlagBuildAgentAdCampaignCardModule = require(script.Parent.FFlagBuildAgentAdCampaignCard)
local InterfaceResult = TModule.interface({
	campaignId = TModule.string,
	status = TModule.string,
	toolCallId = TModule.optional(TModule.string)
})

return function(p1) --[[ Line: 15 | Named "decodeAdCampaignCreateResult" ]]
	-- upvalues: InterfaceResult (copy), FFlagBuildAgentAdCampaignCardModule (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
	
	if not InterfaceResultResult then
		return nil, "Invalid ad campaign create response: " .. tostring(InterfaceResultResult2)
	elseif p1.campaignId == "" then
		return nil, "Invalid ad campaign create response: campaignId must be non-empty"
	elseif FFlagBuildAgentAdCampaignCardModule and (p1.status == "" or p1.toolCallId == "") then
		return nil, "Invalid ad campaign create response: status and toolCallId must be non-empty"
	else
		return p1, nil
	end
end