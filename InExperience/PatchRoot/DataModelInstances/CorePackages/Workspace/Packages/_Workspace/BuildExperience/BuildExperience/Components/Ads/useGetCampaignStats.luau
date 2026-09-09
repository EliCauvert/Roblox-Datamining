local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local campaignStatsModule = require(parent.DataHydration.CampaignStats)
local useSignalState = require(parent.SignalsReact).useSignalState
local createComputed = signalsModule.createComputed
local t = {
	plays = false,
	adClicks = false,
	adViews = false,
	playtimeSeconds = false
}
local var1 = createComputed(function()
	return nil
end)
local var2 = createComputed(function()
	return "NotReady"
end)

local function hasFailedMetric(p1)
	if p1 == nil then
		return false
	end
	local failedMetrics = p1.failedMetrics
	
	return failedMetrics.plays or (failedMetrics.adClicks or (failedMetrics.adViews or failedMetrics.playtimeSeconds))
end

return function(p1, p2)
	-- upvalues: campaignStatsModule (ref), reactModule (ref), hasFailedMetric (ref), useSignalState (ref), var1 (ref), var2 (ref), t (ref)
	local current
	p2 = p2 or campaignStatsModule.getCampaignStatsStore(false)
	local var3 = p1 ~= nil and p1 ~= 0
	local var4 = reactModule.useRef(nil)
	local var5 = nil
	
	if var3 then
		current = var4.current
		
		if current == nil or current.store ~= p2 or current.universeId ~= p1 then
			var5 = hasFailedMetric
			var4.current = { store = p2, universeId = p1 }
		end
	else
		var4.current = nil
	end
	current = if var3 then p2.getAndFetchCampaignStats(p1, var5) else nil
	local var6 = useSignalState(if current ~= nil then var1 else current.data)
	local var7 = useSignalState(if current ~= nil then var2 else current.status)
	local var8 = if var6 ~= nil then nil else var6.byCampaign
	
	if var6 == nil then
		return var8, var7, t
	end
	return var8, var7, var6.failedMetrics
end