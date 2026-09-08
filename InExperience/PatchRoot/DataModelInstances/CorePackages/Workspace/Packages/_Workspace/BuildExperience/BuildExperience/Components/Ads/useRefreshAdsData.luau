local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local adCampaignsModule = require(parent.DataHydration.AdCampaigns)
local campaignStatsModule = require(parent.DataHydration.CampaignStats)
local adCampaignEligibilityModule = require(parent.DataHydration.AdCampaignEligibility)
local useSignalState = signalsReactModule.useSignalState
local var1 = signalsModule.createComputed(function()
	return "NotReady"
end)
local var2 = signalsModule.createComputed(function()
	return nil
end)

return function(p1, p2)
	-- upvalues: adCampaignsModule (ref), campaignStatsModule (ref), reactModule (ref), adCampaignEligibilityModule (ref), useSignalState (ref), var1 (ref), var2 (ref)
	p2 = p2 or {}
	local var3 = p2.includeEligibility == true
	local var4 = p1 ~= nil and p1 ~= 0
	local adCampaignsStore = p2.adCampaignsStore or adCampaignsModule.getAdCampaignsStore(false)
	local campaignStatsStore = p2.campaignStatsStore or campaignStatsModule.getCampaignStatsStore(false)
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useRef(nil)
	local var7 = if var3 then p2.adCampaignEligibilityStore or adCampaignEligibilityModule.getAdCampaignEligibilityStore(false) else nil
	local adCampaigns = adCampaignsStore.getAdCampaigns()
	local var8 = if var4 then campaignStatsStore.getCampaignStats(p1) else nil
	local var9 = useSignalState(adCampaigns.status)
	local var10 = useSignalState(adCampaigns.data)
	local var11 = useSignalState(if var8 ~= nil then var1 else var8.status)
	local var12 = useSignalState(if var8 ~= nil then var2 else var8.data)
	local var13 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), adCampaignsStore (ref), var4 (ref), var8 (ref), var6 (ref), campaignStatsStore (ref), p1 (ref), var7 (ref)
		var5.current = adCampaignsStore.isAdCampaignsRequestInQueueOrInFlight()
		adCampaignsStore.fetchAdCampaigns()
		
		if var4 and var8 ~= nil then
			var6.current = if campaignStatsStore.isCampaignStatsRequestInQueueOrInFlight(p1) then p1 else nil
			campaignStatsStore.fetchCampaignStats(p1)
		else
			var6.current = nil
		end
		if var7 ~= nil and var4 then
			var7.fetchEligibility(p1)
		end
	end, {
		p1, var4, adCampaignsStore, campaignStatsStore, var7, adCampaigns, var8
	})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), adCampaignsStore (ref)
		if var5.current and not adCampaignsStore.isAdCampaignsRequestInQueueOrInFlight() then
			var5.current = false
			adCampaignsStore.fetchAdCampaigns()
		end
	end, { var10, var9, adCampaignsStore })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref), campaignStatsStore (ref)
		if p1 ~= nil and var6.current == p1 and not campaignStatsStore.isCampaignStatsRequestInQueueOrInFlight(p1) then
			var6.current = nil
			campaignStatsStore.fetchCampaignStats(p1)
		end
	end, { p1, var12, var11, campaignStatsStore })
	
	return var13
end