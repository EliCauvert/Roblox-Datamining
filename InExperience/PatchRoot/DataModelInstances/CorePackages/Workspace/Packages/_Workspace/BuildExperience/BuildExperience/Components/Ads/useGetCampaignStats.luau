local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local campaignStatsModule = require(parent.DataHydration.CampaignStats)
local useSignalState = require(parent.SignalsReact).useSignalState
local createComputed = signalsModule.createComputed
local var1 = createComputed(function()
	return nil
end)
local var2 = createComputed(function()
	return "NotReady"
end)

return function(p1, p2)
	-- upvalues: campaignStatsModule (ref), useSignalState (ref), var1 (ref), var2 (ref)
	local var3 = if p1 ~= nil and p1 ~= 0 then (p2 or campaignStatsModule.getCampaignStatsStore(false)).getAndFetchCampaignStats(p1) else nil
	
	return useSignalState(if var3 ~= nil then var1 else var3.data), useSignalState(if var3 ~= nil then var2 else var3.status)
end