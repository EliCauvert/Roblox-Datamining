local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local PollAnalyticsOperationModule = require(DataHydration.pollAnalyticsOperation)
local _ = require(script.Parent.CampaignStatsTypes)
local WINDOWDAYS = require(script.Parent.CampaignStatsConstants).WINDOW_DAYS

local function sumByCampaign(QueryResult) --[[ Line: 59 ]]
	local t = {}
	
	if QueryResult == nil or QueryResult.values == nil then
		return t
	end
	local v1 = nil
	for _, value in QueryResult.values do
		v1 = nil
		
		if value.breakdownValue ~= nil then
			for _, value1 in value.breakdownValue do
				if value1.dimension == "CampaignId" then
					v1 = value1.value
					break
				end
			end
		end
		if v1 ~= nil and v1 ~= "RAQI_RESERVED_DIMENSION_VALUES_NO_VALUE" then
			local Total = 0
			
			if value.dataPoints ~= nil then
				for _, dataPoint in value.dataPoints do
					Total += dataPoint.value or 0
				end
			end
			t[v1] = (t[v1] or 0) + Total
		end
	end
	return t
end

local function queryMetricByCampaign(Metric, p1, p2, p3) --[[ Line: 88 ]]
	-- upvalues: UrlBase (copy), PollAnalyticsOperationModule (copy), sumByCampaign (copy)
	return PollAnalyticsOperationModule({
		analyticsKey = "ads-campaign-stats.query",
		timeoutMessage = "analytics-query-gateway: campaign stats query did not complete",
		network = p3.network,
		url = ("%s/analytics-query-gateway/v1/metrics/resource/%s/id/%d"):format(p3.baseUrl or UrlBase.APIS, "RESOURCE_TYPE_UNIVERSE", p1),
		body = {
			resourceType = "RESOURCE_TYPE_UNIVERSE",
			resourceId = tostring(p1),
			query = {
				granularity = "METRIC_GRANULARITY_NONE",
				metric = Metric,
				startTime = p2.startIso,
				endTime = p2.queryEndIso,
				breakdown = { { dimensions = { "CampaignId" } } },
				filter = {
					{
						dimension = "AttributionDateHour",
						operation = "FILTER_OPERATION_GTE",
						values = { (tostring(p2.startMs)) }
					},
					{
						dimension = "AttributionDateHour",
						operation = "FILTER_OPERATION_LT",
						values = { (tostring(p2.endMs)) }
					}
				}
			}
		},
		mapResult = function(p4) --[[ Line: 132 ]]
			-- upvalues: sumByCampaign (upval)
			return (sumByCampaign(p4.queryResult))
		end
	})
end

local function captureMetricOutcome(Promise) --[[ Line: 139 ]]
	return Promise:andThen(function(Result) --[[ Line: 140 ]]
		return { succeeded = true, value = Result }
	end, function(_) --[[ Line: 145 ]]
		return { succeeded = false, value = {} }
	end)
end

return {
	fetchCampaignStats = function(p1, p2) --[[ Line: 156 ]]
		-- upvalues: WINDOWDAYS (copy), PromiseModule (copy), queryMetricByCampaign (copy), captureMetricOutcome (copy)
		local P10 = p2 or {}
		local UnixTimestampMillis = if P10.nowMs == nil then DateTime.now().UnixTimestampMillis else P10.nowMs
		local UnixTimestampMillisDelta = UnixTimestampMillis - UnixTimestampMillis % 3600000
		local UnixTimestampMillisDeltaDelta = UnixTimestampMillisDelta - WINDOWDAYS * 86400000
		local config = {
			startMs = UnixTimestampMillisDeltaDelta,
			endMs = UnixTimestampMillisDelta,
			startIso = DateTime.fromUnixTimestampMillis(UnixTimestampMillisDeltaDelta):ToIsoDate(),
			queryEndIso = DateTime.fromUnixTimestampMillis(UnixTimestampMillisDelta + 2592000000):ToIsoDate()
		}
		
		return PromiseModule.all({
			queryMetricByCampaign("AdsUANumPlaysDefaultViewByUniverse", p1, config, P10):andThen(function(Result) --[[ Line: 140 ]]
				return { succeeded = true, value = Result }
			end, function(_) --[[ Line: 145 ]]
				return { succeeded = false, value = {} }
			end),
			queryMetricByCampaign("AdsUANumClicksDefaultViewByUniverse", p1, config, P10):andThen(function(Result) --[[ Line: 140 ]]
				return { succeeded = true, value = Result }
			end, function(_) --[[ Line: 145 ]]
				return { succeeded = false, value = {} }
			end),
			queryMetricByCampaign("AdsUANumImpressionsDefaultViewByUniverse", p1, config, P10):andThen(function(Result) --[[ Line: 140 ]]
				return { succeeded = true, value = Result }
			end, function(_) --[[ Line: 145 ]]
				return { succeeded = false, value = {} }
			end),
			captureMetricOutcome(queryMetricByCampaign("AdsUAPlaytimeDefaultViewByUniverse", p1, config, P10))
		}):andThen(function(Entry) --[[ Line: 179 ]]
			local Entry1 = Entry[1]
			local Entry2 = Entry[2]
			local Entry3 = Entry[3]
			local Entry4 = Entry[4]
			local ByCampaign = {}
			
			local function _(Key) --[[ Line: 186 | Named "entryFor" ]]
				-- upvalues: ByCampaign (copy)
				local ByCampaignEntry = ByCampaign[Key]
				
				if ByCampaignEntry == nil then
					ByCampaignEntry = {
						plays = 0,
						adClicks = 0,
						adViews = 0,
						playtimeSeconds = 0
					}
					ByCampaign[Key] = ByCampaignEntry
				end
				return ByCampaignEntry
			end
			
			for i, Plays in Entry1.value do
				local ByCampaignEntry = ByCampaign[i]
				
				if ByCampaignEntry == nil then
					ByCampaignEntry = {
						plays = 0,
						adClicks = 0,
						adViews = 0,
						playtimeSeconds = 0
					}
					ByCampaign[i] = ByCampaignEntry
				end
				ByCampaignEntry.plays = Plays
			end
			for i1, AdClicks in Entry2.value do
				local ByCampaignEntry = ByCampaign[i1]
				
				if ByCampaignEntry == nil then
					ByCampaignEntry = {
						plays = 0,
						adClicks = 0,
						adViews = 0,
						playtimeSeconds = 0
					}
					ByCampaign[i1] = ByCampaignEntry
				end
				ByCampaignEntry.adClicks = AdClicks
			end
			for i2, AdViews in Entry3.value do
				local ByCampaignEntry = ByCampaign[i2]
				
				if ByCampaignEntry == nil then
					ByCampaignEntry = {
						plays = 0,
						adClicks = 0,
						adViews = 0,
						playtimeSeconds = 0
					}
					ByCampaign[i2] = ByCampaignEntry
				end
				ByCampaignEntry.adViews = AdViews
			end
			for i3, PlaytimeSeconds in Entry4.value do
				local ByCampaignEntry = ByCampaign[i3]
				
				if ByCampaignEntry == nil then
					ByCampaignEntry = {
						plays = 0,
						adClicks = 0,
						adViews = 0,
						playtimeSeconds = 0
					}
					ByCampaign[i3] = ByCampaignEntry
				end
				ByCampaignEntry.playtimeSeconds = PlaytimeSeconds
			end
			return {
				byCampaign = ByCampaign,
				failedMetrics = {
					plays = not Entry1.succeeded,
					adClicks = not Entry2.succeeded,
					adViews = not Entry3.succeeded,
					playtimeSeconds = not Entry4.succeeded
				}
			}
		end)
	end
}