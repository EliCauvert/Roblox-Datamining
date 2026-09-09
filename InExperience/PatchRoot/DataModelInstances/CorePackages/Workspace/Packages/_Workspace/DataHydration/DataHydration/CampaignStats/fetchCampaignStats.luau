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
			resourceType = "RESOURCE_TYPE_UNIVERSE",
			resourceId = tostring(p3),
			query = {
				granularity = "METRIC_GRANULARITY_NONE",
				metric = p2,
				startTime = p4.startIso,
				endTime = p4.queryEndIso,
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

local function captureMetricOutcome(p2)
	return p2:andThen(function(p3)
		return { succeeded = true, value = p3 }
	end, function(_)
		return { succeeded = false, value = {} }
	end)
end

function t.fetchCampaignStats(p2, p3)
	-- upvalues: WINDOW_DAYS (ref), promiseModule (ref), queryMetricByCampaign (ref), captureMetricOutcome (ref)
	p3 = p3 or {}
	local var2 = if p3.nowMs ~= nil then DateTime.now().UnixTimestampMillis else p3.nowMs
	local var3 = var2 - var2 % 3600000
	local var4 = var3 - WINDOW_DAYS * 86400000
	local t = {
		startMs = var4,
		endMs = var3,
		startIso = DateTime.fromUnixTimestampMillis(var4):ToIsoDate(),
		queryEndIso = DateTime.fromUnixTimestampMillis(var3 + 2592000000):ToIsoDate()
	}
	
	return promiseModule.all({
		queryMetricByCampaign("AdsUANumPlaysDefaultViewByUniverse", p2, t, p3):andThen(function(p4)
			return { succeeded = true, value = p4 }
		end, function(_)
			return { succeeded = false, value = {} }
		end),
		queryMetricByCampaign("AdsUANumClicksDefaultViewByUniverse", p2, t, p3):andThen(function(p4)
			return { succeeded = true, value = p4 }
		end, function(_)
			return { succeeded = false, value = {} }
		end),
		queryMetricByCampaign("AdsUANumImpressionsDefaultViewByUniverse", p2, t, p3):andThen(function(p4)
			return { succeeded = true, value = p4 }
		end, function(_)
			return { succeeded = false, value = {} }
		end),
		captureMetricOutcome(queryMetricByCampaign("AdsUAPlaytimeDefaultViewByUniverse", p2, t, p3))
	}):andThen(function(p4)
		local var5 = p4[1]
		local var6 = p4[2]
		local var7 = p4[3]
		local var8 = p4[4]
		local t = {}
		
		local function _(p5)
			-- upvalues: t (ref)
			local var9 = t[p5]
			
			if var9 == nil then
				var9 = {
					plays = 0,
					adClicks = 0,
					adViews = 0,
					playtimeSeconds = 0
				}
				t[p5] = var9
			end
			return var9
		end
		
		for i, v in var5.value do
			local var9 = t[i]
			
			if var9 == nil then
				var9 = {
					plays = 0,
					adClicks = 0,
					adViews = 0,
					playtimeSeconds = 0
				}
				t[i] = var9
			end
			var9.plays = v
		end
		for i_1, v_1 in var6.value do
			local var10 = t[i_1]
			
			if var10 == nil then
				var10 = {
					plays = 0,
					adClicks = 0,
					adViews = 0,
					playtimeSeconds = 0
				}
				t[i_1] = var10
			end
			var10.adClicks = v_1
		end
		for i_2, v_2 in var7.value do
			local var11 = t[i_2]
			
			if var11 == nil then
				var11 = {
					plays = 0,
					adClicks = 0,
					adViews = 0,
					playtimeSeconds = 0
				}
				t[i_2] = var11
			end
			var11.adViews = v_2
		end
		for i_3, v_3 in var8.value do
			local var12 = t[i_3]
			
			if var12 == nil then
				var12 = {
					plays = 0,
					adClicks = 0,
					adViews = 0,
					playtimeSeconds = 0
				}
				t[i_3] = var12
			end
			var12.playtimeSeconds = v_3
		end
		return {
			byCampaign = t,
			failedMetrics = {
				plays = not var5.succeeded,
				adClicks = not var6.succeeded,
				adViews = not var7.succeeded,
				playtimeSeconds = not var8.succeeded
			}
		}
	end)
end

return t