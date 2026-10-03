local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.HttpClient)
local fFlagBuildExperienceAnalyticsBreakdownsModule = require(dataHydration.ExperienceAnalytics.FFlagBuildExperienceAnalyticsBreakdowns)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchExperienceMetricModule = require(script.Parent.fetchExperienceMetric)
local fetchMetricMetadataModule = require(script.Parent.fetchMetricMetadata)
local _ = require(script.Parent.ExperienceAnalyticsStoreTypes)

local function encodeFilters(p1)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in cryoModule.List.sort(p1, function(p2, p3)
		return if p2.dimension == p3.dimension then p2.operation < p3.operation else p2.dimension < p3.dimension
	end) do
		table.insert(t, { v.dimension, cryoModule.List.sort(v.values), v.operation })
	end
	return t
end

local function decodeFilters(p2)
	local t = {}
	
	for i, v in p2 do
		table.insert(t, { dimension = v[1], values = v[2], operation = v[3] })
	end
	return t
end

local function encodeBreakdowns(p3)
	local t = {}
	
	for i, v in p3 do
		table.insert(t, { v.dimensions })
	end
	return t
end

local function decodeBreakdowns(p4)
	local t = {}
	
	for i, v in p4 do
		table.insert(t, { dimensions = v[1] })
	end
	return t
end

local function paramsKey(p5)
	-- upvalues: fFlagBuildExperienceAnalyticsBreakdownsModule (ref), encodeFilters (ref), encodeBreakdowns (ref), httpService (ref)
	local list = {
		p5.universeId,
		p5.metric,
		p5.granularity,
		p5.lookbackSeconds,
		p5.endTime
	}
	
	if fFlagBuildExperienceAnalyticsBreakdownsModule then
		table.insert(list, encodeFilters(p5.filters or {}))
		table.insert(list, encodeBreakdowns(p5.breakdowns or {}))
	end
	return httpService:JSONEncode(list)
end

local function paramsFromKey(p5)
	-- upvalues: httpService (ref), fFlagBuildExperienceAnalyticsBreakdownsModule (ref), decodeFilters (ref), decodeBreakdowns (ref)
	local var1 = httpService:JSONDecode(p5)
	
	return {
		universeId = var1[1],
		metric = var1[2],
		granularity = var1[3],
		lookbackSeconds = var1[4],
		endTime = var1[5],
		filters = if fFlagBuildExperienceAnalyticsBreakdownsModule and var1[6] then decodeFilters(var1[6]) else nil,
		breakdowns = if fFlagBuildExperienceAnalyticsBreakdownsModule and var1[7] then decodeBreakdowns(var1[7]) else nil
	}
end

local function metricsKey(p5)
	-- upvalues: httpService (ref)
	local cloned = table.clone(p5)
	table.sort(cloned)
	
	return httpService:JSONEncode(cloned)
end

return function(p5)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), paramsFromKey (ref), fetchExperienceMetricModule (ref), paramsKey (ref), fetchMetricMetadataModule (ref), httpService (ref), metricsKey (ref)
	p5 = p5 or {}
	local t = {}
	
	local function _(p6)
		-- upvalues: t (write)
		t[p6] = true
		p6:finally(function()
			-- upvalues: t (copy), p6 (ref)
			t[p6] = nil
		end)
		
		return p6
	end
	
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		cache = createDataCacheModule(p5.seriesTtlSeconds or 86400, p5.failedTtlSeconds),
		fetchFn = function(p6, _)
			-- upvalues: paramsFromKey (copy), fetchExperienceMetricModule (copy), p5 (ref), t (write)
			local var2 = fetchExperienceMetricModule(paramsFromKey(p6), {
				network = p5.network,
				baseUrl = p5.baseUrl,
				delay = p5.delay
			})
			t[var2] = true
			var2:finally(function()
				-- upvalues: t (copy), var2 (ref)
				t[var2] = nil
			end)
			
			return var2
		end
	})
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		cache = createDataCacheModule(p5.metadataTtlSeconds or 600, p5.failedTtlSeconds),
		fetchFn = function(p6, _)
			-- upvalues: fetchMetricMetadataModule (copy), httpService (copy), p5 (ref), t (write)
			local var3 = fetchMetricMetadataModule(httpService:JSONDecode(p6), {
				network = p5.network,
				baseUrl = p5.baseUrl,
				delay = p5.delay
			})
			t[var3] = true
			var3:finally(function()
				-- upvalues: t (copy), var3 (ref)
				t[var3] = nil
			end)
			
			return var3
		end
	})
	
	return {
		getAndFetchMetric = function(p6)
			-- upvalues: var1 (ref), paramsKey (copy)
			return var1.getAndFetchItem(paramsKey(p6))
		end,
		refetchMetric = function(p6)
			-- upvalues: var1 (ref), paramsKey (copy)
			var1.fetchItem(paramsKey(p6))
		end,
		getAndFetchMetricMetadata = function(p6)
			-- upvalues: var2 (ref), metricsKey (copy)
			return var2.getAndFetchItem(metricsKey(p6))
		end,
		dispose = function()
			-- upvalues: t (write), var1 (ref), var2 (ref)
			local t_1 = {}
			
			for i in t do
				table.insert(t_1, i)
			end
			t = {}
			
			for i_1, v in t_1 do
				v:cancel()
			end
			var1.dispose()
			var2.dispose()
		end
	}
end