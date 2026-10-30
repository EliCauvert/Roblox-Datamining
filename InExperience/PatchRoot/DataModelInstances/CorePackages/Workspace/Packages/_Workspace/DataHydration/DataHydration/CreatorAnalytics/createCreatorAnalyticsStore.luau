local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.HttpClient)
local FFlagBuildExperienceAnalyticsBreakdownsModule = require(DataHydration.CreatorAnalytics.FFlagBuildExperienceAnalyticsBreakdowns)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchResourceMetricModule = require(script.Parent.fetchResourceMetric)
local FetchMetricMetadataModule = require(script.Parent.fetchMetricMetadata)
local CreatorAnalyticsStoreTypesModule = require(script.Parent.CreatorAnalyticsStoreTypes)

local function encodeFilters(Filters)
	-- upvalues: CryoModule (copy)
	local List = {}
	
	for _, value in CryoModule.List.sort(Filters, function(p1, p2): boolean
		return if p1.dimension == p2.dimension then p1.operation < p2.operation else p1.dimension < p2.dimension
	end) do
		table.insert(List, {
			value.dimension,
			CryoModule.List.sort(value.values),
			value.operation
		})
	end
	return List
end

local function decodeFilters(List)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, {
			dimension = value[1],
			values = value[2],
			operation = value[3]
		})
	end
	return List1
end

local function encodeBreakdowns(Breakdowns)
	local List = {}
	
	for _, breakdown in Breakdowns do
		table.insert(List, { breakdown.dimensions })
	end
	return List
end

local function decodeBreakdowns(List)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, { dimensions = value[1] })
	end
	return List1
end

local function paramsKey(CachedUniverseMetricParams)
	-- upvalues: encodeFilters (copy), encodeBreakdowns (copy), HttpService (copy)
	return HttpService:JSONEncode({
		CachedUniverseMetricParams.resourceType, CachedUniverseMetricParams.resourceId,
		CachedUniverseMetricParams.metric, CachedUniverseMetricParams.granularity,
		CachedUniverseMetricParams.lookbackSeconds, CachedUniverseMetricParams.endTime,
		encodeFilters(CachedUniverseMetricParams.filters or {}),
		encodeBreakdowns(CachedUniverseMetricParams.breakdowns or {}),
		CachedUniverseMetricParams.includeAdvancedFields,
		CachedUniverseMetricParams.analyticsKey
	})
end

local function paramsFromKey(Input)
	-- upvalues: HttpService (copy), decodeFilters (copy), decodeBreakdowns (copy)
	local Data = HttpService:JSONDecode(Input)
	
	return {
		resourceType = Data[1],
		resourceId = Data[2],
		metric = Data[3],
		granularity = Data[4],
		lookbackSeconds = Data[5],
		endTime = Data[6],
		filters = if Data[7] then decodeFilters(Data[7]) else nil,
		breakdowns = if Data[8] then decodeBreakdowns(Data[8]) else nil,
		includeAdvancedFields = Data[9],
		analyticsKey = Data[10]
	}
end

local function toCachedUniverseMetricParams(CachedUniverseMetricParams)
	-- upvalues: CreatorAnalyticsStoreTypesModule (copy), FFlagBuildExperienceAnalyticsBreakdownsModule (copy)
	return {
		analyticsKey = "build-experience.experience-analytics-metric",
		resourceType = CreatorAnalyticsStoreTypesModule.ResourceType.Universe,
		resourceId = tostring(CachedUniverseMetricParams.universeId),
		metric = CachedUniverseMetricParams.metric,
		granularity = CachedUniverseMetricParams.granularity,
		lookbackSeconds = CachedUniverseMetricParams.lookbackSeconds,
		endTime = CachedUniverseMetricParams.endTime,
		filters = if FFlagBuildExperienceAnalyticsBreakdownsModule then CachedUniverseMetricParams.filters else nil,
		breakdowns = if FFlagBuildExperienceAnalyticsBreakdownsModule then CachedUniverseMetricParams.breakdowns else nil,
		includeAdvancedFields = FFlagBuildExperienceAnalyticsBreakdownsModule
	}
end

local function toCachedResourceMetricParams(CachedUniverseMetricParams)
	return {
		includeAdvancedFields = true,
		analyticsKey = "data-hydration.resource-analytics-metric",
		resourceType = CachedUniverseMetricParams.resourceType,
		resourceId = CachedUniverseMetricParams.resourceId,
		metric = CachedUniverseMetricParams.metric,
		granularity = CachedUniverseMetricParams.granularity,
		lookbackSeconds = CachedUniverseMetricParams.lookbackSeconds,
		endTime = CachedUniverseMetricParams.endTime,
		filters = CachedUniverseMetricParams.filters,
		breakdowns = CachedUniverseMetricParams.breakdowns
	}
end

local function metricsKey(Tbl)
	-- upvalues: HttpService (copy)
	local Copy = table.clone(Tbl)
	table.sort(Copy)
	
	return HttpService:JSONEncode(Copy)
end

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), paramsFromKey (copy), FetchResourceMetricModule (copy), paramsKey (copy), toCachedResourceMetricParams (copy), toCachedUniverseMetricParams (copy), FetchMetricMetadataModule (copy), HttpService (copy), metricsKey (copy)
	local P10 = p1 or {}
	local t = {}
	
	local function _(Promise)
		-- upvalues: t (ref)
		t[Promise] = true
		Promise:finally(function()
			-- upvalues: t (upval), Promise (copy)
			t[Promise] = nil
		end)
		
		return Promise
	end
	
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = CreateDataCacheModule(P10.seriesTtlSeconds or 86400, P10.failedTtlSeconds),
		fetchFn = function(p2, _)
			-- upvalues: paramsFromKey (upval), FetchResourceMetricModule (upval), P10 (copy), t (ref)
			local ParamsFromKeyResult = paramsFromKey(p2)
			local ResourceMetricModule = FetchResourceMetricModule(ParamsFromKeyResult, {
				network = P10.network,
				baseUrl = P10.baseUrl,
				delay = P10.delay,
				includeAdvancedFields = ParamsFromKeyResult.includeAdvancedFields,
				analyticsKey = ParamsFromKeyResult.analyticsKey
			})
			t[ResourceMetricModule] = true
			ResourceMetricModule:finally(function()
				-- upvalues: t (upval), ResourceMetricModule (copy)
				t[ResourceMetricModule] = nil
			end)
			
			return ResourceMetricModule
		end
	})
	
	local function getAndFetchResourceMetric(p2)
		-- upvalues: DataResolverModule (copy), paramsKey (upval), toCachedResourceMetricParams (upval)
		return (DataResolverModule.getAndFetchItem(paramsKey((toCachedResourceMetricParams(p2)))))
	end
	
	local function getAndFetchMetric(p2)
		-- upvalues: DataResolverModule (copy), paramsKey (upval), toCachedUniverseMetricParams (upval)
		return (DataResolverModule.getAndFetchItem(paramsKey((toCachedUniverseMetricParams(p2)))))
	end
	
	local function refetchResourceMetric(p2)
		-- upvalues: DataResolverModule (copy), paramsKey (upval), toCachedResourceMetricParams (upval)
		DataResolverModule.fetchItem(paramsKey((toCachedResourceMetricParams(p2))))
	end
	
	local function refetchMetric(p2)
		-- upvalues: DataResolverModule (copy), paramsKey (upval), toCachedUniverseMetricParams (upval)
		DataResolverModule.fetchItem(paramsKey((toCachedUniverseMetricParams(p2))))
	end
	
	local DataResolverModule1 = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = CreateDataCacheModule(P10.metadataTtlSeconds or 600, P10.failedTtlSeconds),
		fetchFn = function(Input, _)
			-- upvalues: FetchMetricMetadataModule (upval), HttpService (upval), P10 (copy), t (ref)
			local MetricMetadataModule = FetchMetricMetadataModule(HttpService:JSONDecode(Input), {
				network = P10.network,
				baseUrl = P10.baseUrl,
				delay = P10.delay
			})
			t[MetricMetadataModule] = true
			MetricMetadataModule:finally(function()
				-- upvalues: t (upval), MetricMetadataModule (copy)
				t[MetricMetadataModule] = nil
			end)
			
			return MetricMetadataModule
		end
	})
	
	return {
		getAndFetchResourceMetric = getAndFetchResourceMetric,
		refetchResourceMetric = refetchResourceMetric,
		getAndFetchMetric = getAndFetchMetric,
		refetchMetric = refetchMetric,
		getAndFetchMetricMetadata = function(p2)
			-- upvalues: DataResolverModule1 (copy), metricsKey (upval)
			return (DataResolverModule1.getAndFetchItem(metricsKey(p2)))
		end,
		dispose = function()
			-- upvalues: t (ref), DataResolverModule (copy), DataResolverModule1 (copy)
			local List = {}
			
			for i in t do
				table.insert(List, i)
			end
			t = {}
			
			for _, value in List do
				value:cancel()
			end
			DataResolverModule.dispose()
			DataResolverModule1.dispose()
		end
	}
end