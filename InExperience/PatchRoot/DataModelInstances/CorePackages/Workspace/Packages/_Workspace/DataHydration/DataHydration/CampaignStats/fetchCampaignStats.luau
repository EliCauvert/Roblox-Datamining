local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local urlBase = require(parent.UrlBuilder).UrlBase
local pollAnalyticsOperationModule = require(dataHydration.pollAnalyticsOperation)
local _ = require(script.Parent.CampaignStatsTypes)
local WINDOW_DAYS = require(script.Parent.CampaignStatsConstants).WINDOW_DAYS
local t = {}

local function sumByCampaign(p1)
	local t = {}
	
	if p1 == nil or p1.values == nil then
		return t
	end
	local value
	for i, v in p1.values do
		value = nil
		
		if v.breakdownValue ~= nil then
			for i_1, v_1 in v.breakdownValue do
				if v_1.dimension == "CampaignId" then
					value = v_1.value
					break
				end
			end
		end
		if value ~= nil and value ~= "RAQI_RESERVED_DIMENSION_VALUES_NO_VALUE" then
			local var1 = 0
			
			if v.dataPoints ~= nil then
				for v_1, v_1 in v.dataPoints do
					var1 += v_1.value or 0
				end
			end
			t[value] = (t[value] or 0) + var1
		end
	end
	return t
end

local function queryMetricByCampaign(p2, p3, p4, p5)
	-- upvalues: urlBase (ref), pollAnalyticsOperationModule (ref), sumByCampaign (ref)
	return pollAnalyticsOperationModule({
		analyticsKey = "ads-campaign-stats.query",
		timeoutMessage = "analytics-query-gateway: campaign stats query did not complete",
		network = p5.network,
		url = ("%s/analytics-query-gateway/v1/metrics/resource/%s/id/%d"):format(p5.baseUrl or urlBase.APIS, "RESOURCE_TYPE_UNIVERSE", p3),
		body = {
			query = {
				granularity = "METRIC_GRANULARITY_NONE",
				metric = p2,
				startTime = p4.startIso,
				endTime = p4.endIso,
				breakdown = { { dimensions = { "CampaignId" } } },
				filter = {
					{
						dimension = "AttributionDateHour",
						operation = "FILTER_OPERATION_GTE",
						values = { tostring(p4.startMs) }
					},
					{
						dimension = "AttributionDateHour",
						operation = "FILTER_OPERATION_LT",
						values = { tostring(p4.endMs) }
					}
				}
			}
		},
		mapResult = function(p6)
			-- upvalues: sumByCampaign (copy)
			return sumByCampaign(p6.queryResult)
		end
	})
end

function t.fetchCampaignStats(p2, p3)
	-- upvalues: WINDOW_DAYS (ref), promiseModule (ref), queryMetricByCampaign (ref)
	p3 = p3 or {}
	local var2 = if p3.nowMs ~= nil then DateTime.now().UnixTimestampMillis else p3.nowMs
	local var3 = var2 - WINDOW_DAYS * 86400000
	local t = {
		startMs = var3,
		endMs = var2,
		startIso = DateTime.fromUnixTimestampMillis(var3):ToIsoDate(),
		endIso = DateTime.fromUnixTimestampMillis(var2):ToIsoDate()
	}
	
	return promiseModule.all({
		queryMetricByCampaign("AdsUANumPlaysDefaultViewByUniverse", p2, t, p3),
		queryMetricByCampaign("AdsUANumClicksDefaultViewByUniverse", p2, t, p3),
		queryMetricByCampaign("AdsUANumImpressionsDefaultViewByUniverse", p2, t, p3),
		queryMetricByCampaign("AdsUAPlaytimeDefaultViewByUniverse", p2, t, p3)
	}):andThen(function(p4)
		local t = {}
		
		local function _(p5)
			-- upvalues: t (ref)
			local var4 = t[p5]
			
			if var4 == nil then
				var4 = {
					plays = 0,
					adClicks = 0,
					adViews = 0,
					playtimeSeconds = 0
				}
				t[p5] = var4
			end
			return var4
		end
		
		for i, v in p4[1] do
			local var4 = t[i]
			
			if var4 == nil then
				var4 = {
					plays = 0,
					adClicks = 0,
					adViews = 0,
					playtimeSeconds = 0
				}
				t[i] = var4
			end
			var4.plays = v
		end
		for i_1, v_1 in p4[2] do
			local var5 = t[i_1]
			
			if var5 == nil then
				var5 = {
					plays = 0,
					adClicks = 0,
					adViews = 0,
					playtimeSeconds = 0
				}
				t[i_1] = var5
			end
			var5.adClicks = v_1
		end
		for i_2, v_2 in p4[3] do
			local var6 = t[i_2]
			
			if var6 == nil then
				var6 = {
					plays = 0,
					adClicks = 0,
					adViews = 0,
					playtimeSeconds = 0
				}
				t[i_2] = var6
			end
			var6.adViews = v_2
		end
		for i_3, v_3 in p4[4] do
			local var7 = t[i_3]
			
			if var7 == nil then
				var7 = {
					plays = 0,
					adClicks = 0,
					adViews = 0,
					playtimeSeconds = 0
				}
				t[i_3] = var7
			end
			var7.playtimeSeconds = v_3
		end
		return t
	end)
end

return t