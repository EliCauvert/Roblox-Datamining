local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local adCampaignEligibilityModule = require(parent.DataHydration.AdCampaignEligibility)
local useSignalState = require(parent.SignalsReact).useSignalState
local createComputed = signalsModule.createComputed
local var1 = createComputed(function()
	return nil
end)
local var2 = createComputed(function()
	return "NotReady"
end)

return function(p1, p2)
	-- upvalues: adCampaignEligibilityModule (ref), useSignalState (ref), var1 (ref), var2 (ref)
	local var3 = if p1 ~= nil and p1 ~= 0 then p2 or adCampaignEligibilityModule.getAdCampaignEligibilityStore(false) else nil
	local var4 = if var3 ~= nil then nil else var3.getAndFetchEligibility(p1)
	local var5 = useSignalState(if var4 ~= nil then var2 else var4.status)
	
	return if var5 == "Ready" then useSignalState(if var4 ~= nil then var1 else var4.data) else nil, var5
end