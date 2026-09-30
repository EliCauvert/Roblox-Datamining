local tModule = require(script:FindFirstAncestor("DataHydration").Parent.t)
local _ = require(script.Parent.Types.store)
local fFlagBuildAgentAdCampaignCardModule = require(script.Parent.FFlagBuildAgentAdCampaignCard)
local var1 = tModule.interface({
	campaignId = tModule.string,
	status = tModule.string,
	toolCallId = tModule.optional(tModule.string)
})

return function(p1)
	-- upvalues: var1 (ref), fFlagBuildAgentAdCampaignCardModule (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		return nil, "Invalid ad campaign create response: " .. tostring(var3)
	elseif p1.campaignId == "" then
		return nil, "Invalid ad campaign create response: campaignId must be non-empty"
	elseif fFlagBuildAgentAdCampaignCardModule and (p1.status == "" or p1.toolCallId == "") then
		return nil, "Invalid ad campaign create response: status and toolCallId must be non-empty"
	end
	return p1, nil
end