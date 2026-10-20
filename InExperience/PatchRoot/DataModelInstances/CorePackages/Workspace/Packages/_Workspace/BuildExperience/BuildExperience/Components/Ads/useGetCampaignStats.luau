local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local CampaignStatsModule = require(Parent.DataHydration.CampaignStats)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CreateComputedFunction = require(Parent.Signals).createComputed
local config = {
	plays = false,
	adClicks = false,
	adViews = false,
	playtimeSeconds = false
}
local Computed = CreateComputedFunction(function()
	return nil
end)
local Computed1 = CreateComputedFunction(function(): string
	return "NotReady"
end)

local function hasFailedMetric(p1)
	if p1 == nil then
		return false
	else
		local FailedMetrics = p1.failedMetrics
		
		return FailedMetrics.plays or (FailedMetrics.adClicks or (FailedMetrics.adViews or FailedMetrics.playtimeSeconds))
	end
end

return function(UniverseId, p1)
	-- upvalues: CampaignStatsModule (copy), ReactModule (copy), hasFailedMetric (copy), UseSignalStateFunction (copy), Computed (copy), Computed1 (copy), config (copy)
	local P2 = p1 or CampaignStatsModule.getCampaignStatsStore(false)
	local IsNotUniverseIdMatch: boolean = UniverseId ~= nil and UniverseId ~= 0
	local UseRefResult = ReactModule.useRef(nil)
	local v1 = nil
	
	if IsNotUniverseIdMatch then
		local Current = UseRefResult.current
		
		if Current == nil or Current.store ~= P2 or Current.universeId ~= UniverseId then
			v1 = hasFailedMetric
			UseRefResult.current = { store = P2, universeId = UniverseId }
		end
	else
		UseRefResult.current = nil
	end
	local AndFetchCampaignStats = if IsNotUniverseIdMatch then P2.getAndFetchCampaignStats(UniverseId, v1) else nil
	local UseSignalStateResult = UseSignalStateFunction(if AndFetchCampaignStats == nil then Computed else AndFetchCampaignStats.data)
	local UseSignalStateResult1 = UseSignalStateFunction(if AndFetchCampaignStats == nil then Computed1 else AndFetchCampaignStats.status)
	local ByCampaign = if UseSignalStateResult == nil then nil else UseSignalStateResult.byCampaign
	
	if UseSignalStateResult == nil then
		return ByCampaign, UseSignalStateResult1, config
	else
		return ByCampaign, UseSignalStateResult1, UseSignalStateResult.failedMetrics
	end
end