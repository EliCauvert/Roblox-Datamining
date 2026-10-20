local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local AdCampaignsModule = require(Parent.DataHydration.AdCampaigns)
local CampaignStatsModule = require(Parent.DataHydration.CampaignStats)
local AdCampaignEligibilityModule = require(Parent.DataHydration.AdCampaignEligibility)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local Computed = SignalsModule.createComputed(function(): string
	return "NotReady"
end)
local Computed1 = SignalsModule.createComputed(function()
	return nil
end)

return function(Current, p1)
	-- upvalues: AdCampaignsModule (copy), CampaignStatsModule (copy), ReactModule (copy), AdCampaignEligibilityModule (copy), UseSignalStateFunction (copy), Computed (copy), Computed1 (copy)
	local P1 = p1 or {}
	local IsIncludeEligibility = P1.includeEligibility == true
	local IsNotCurrentMatch: boolean = Current ~= nil and Current ~= 0
	local AdCampaignsStore = P1.adCampaignsStore or AdCampaignsModule.getAdCampaignsStore(false)
	local CampaignStatsStore = P1.campaignStatsStore or CampaignStatsModule.getCampaignStatsStore(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local AdCampaignEligibilityStore = if IsIncludeEligibility then P1.adCampaignEligibilityStore or AdCampaignEligibilityModule.getAdCampaignEligibilityStore(false) else nil
	local AdCampaigns = AdCampaignsStore.getAdCampaigns()
	local CampaignStats = if IsNotCurrentMatch then CampaignStatsStore.getCampaignStats(Current) else nil
	local UseSignalStateResult = UseSignalStateFunction(AdCampaigns.status)
	local UseSignalStateResult1 = UseSignalStateFunction(AdCampaigns.data)
	local UseSignalStateResult2 = UseSignalStateFunction(if CampaignStats == nil then Computed else CampaignStats.status)
	local UseSignalStateResult3 = UseSignalStateFunction(if CampaignStats == nil then Computed1 else CampaignStats.data)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), AdCampaignsStore (copy), IsNotCurrentMatch (copy), CampaignStats (copy), UseRefResult1 (copy), CampaignStatsStore (copy), Current (copy), AdCampaignEligibilityStore (copy)
		UseRefResult.current = AdCampaignsStore.isAdCampaignsRequestInQueueOrInFlight()
		AdCampaignsStore.fetchAdCampaigns()
		
		if IsNotCurrentMatch and CampaignStats ~= nil then
			UseRefResult1.current = if CampaignStatsStore.isCampaignStatsRequestInQueueOrInFlight(Current) then Current else nil
			CampaignStatsStore.fetchCampaignStats(Current)
		else
			UseRefResult1.current = nil
		end
		if AdCampaignEligibilityStore ~= nil and IsNotCurrentMatch then
			AdCampaignEligibilityStore.fetchEligibility(Current)
		end
	end, {
		Current, IsNotCurrentMatch, AdCampaignsStore, CampaignStatsStore,
		AdCampaignEligibilityStore, AdCampaigns, CampaignStats
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), AdCampaignsStore (copy)
		if UseRefResult.current and not AdCampaignsStore.isAdCampaignsRequestInQueueOrInFlight() then
			UseRefResult.current = false
			AdCampaignsStore.fetchAdCampaigns()
		end
	end, {
		UseSignalStateResult1,
		UseSignalStateResult,
		AdCampaignsStore
	})
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), UseRefResult1 (copy), CampaignStatsStore (copy)
		if Current ~= nil and UseRefResult1.current == Current and not CampaignStatsStore.isCampaignStatsRequestInQueueOrInFlight(Current) then
			UseRefResult1.current = nil
			CampaignStatsStore.fetchCampaignStats(Current)
		end
	end, {
		Current,
		UseSignalStateResult3,
		UseSignalStateResult2,
		CampaignStatsStore
	})
	
	return UseResult
end