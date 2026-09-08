local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchExperienceMetricModule = require(script.Parent.fetchExperienceMetric)
local fetchMetricMetadataModule = require(script.Parent.fetchMetricMetadata)
local _ = require(script.Parent.ExperienceAnalyticsStoreTypes)

local function paramsKey(p1)
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({
		p1.universeId,
		p1.metric,
		p1.granularity,
		p1.lookbackSeconds,
		p1.endTime
	})
end

local function _(p1)
	-- upvalues: httpService (ref)
	local var1 = httpService:JSONDecode(p1)
	
	return {
		universeId = var1[1],
		metric = var1[2],
		granularity = var1[3],
		lookbackSeconds = var1[4],
		endTime = var1[5]
	}
end

local function metricsKey(p1)
	-- upvalues: httpService (ref)
	local cloned = table.clone(p1)
	table.sort(cloned)
	
	return httpService:JSONEncode(cloned)
end

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), httpService (ref), fetchExperienceMetricModule (ref), paramsKey (ref), fetchMetricMetadataModule (ref), metricsKey (ref)
	p1 = p1 or {}
	local t = {}
	
	local function _(p2)
		-- upvalues: t (write)
		t[p2] = true
		p2:finally(function()
			-- upvalues: t (copy), p2 (ref)
			t[p2] = nil
		end)
		
		return p2
	end
	
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		cache = createDataCacheModule(p1.seriesTtlSeconds or 86400, p1.failedTtlSeconds),
		fetchFn = function(p2, _)
			-- upvalues: httpService (copy), fetchExperienceMetricModule (copy), p1 (ref), t (write)
			local var2 = httpService:JSONDecode(p2)
			local var3 = fetchExperienceMetricModule({
				universeId = var2[1],
				metric = var2[2],
				granularity = var2[3],
				lookbackSeconds = var2[4],
				endTime = var2[5]
			}, {
				network = p1.network,
				baseUrl = p1.baseUrl,
				delay = p1.delay
			})
			t[var3] = true
			var3:finally(function()
				-- upvalues: t (copy), var3 (ref)
				t[var3] = nil
			end)
			
			return var3
		end
	})
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		cache = createDataCacheModule(p1.metadataTtlSeconds or 600, p1.failedTtlSeconds),
		fetchFn = function(p2, _)
			-- upvalues: fetchMetricMetadataModule (copy), httpService (copy), p1 (ref), t (write)
			local var3 = fetchMetricMetadataModule(httpService:JSONDecode(p2), {
				network = p1.network,
				baseUrl = p1.baseUrl,
				delay = p1.delay
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
		getAndFetchMetric = function(p2)
			-- upvalues: var1 (ref), paramsKey (copy)
			return var1.getAndFetchItem(paramsKey(p2))
		end,
		getAndFetchMetricMetadata = function(p2)
			-- upvalues: var2 (ref), metricsKey (copy)
			return var2.getAndFetchItem(metricsKey(p2))
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