local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchAdCampaignToolCallStatusModule = require(script.Parent.fetchAdCampaignToolCallStatus)
local _ = require(script.Parent.AdCampaignToolCallStatusStoreTypes)

local function _(p1, Text): string
	return tostring(p1) .. ":" .. Text
end

local _ = function(Text: string)
	local FoundAt: number? = string.find(Text, ":", 1, true)
	assert(FoundAt ~= nil, "Invalid ad campaign tool-call status cache key")
	local Number: number? = tonumber((string.sub(Text, 1, FoundAt - 1)))
	local Segment = string.sub(Text, FoundAt + 1)
	assert(Number ~= nil and (Number > 0 and Segment ~= ""), "Invalid ad campaign tool-call status cache key")
	
	return Number, Segment
end

return function(p1)
	-- upvalues: FetchAdCampaignToolCallStatusModule (copy), CreateDataCacheModule (copy), CreateDataResolverModule (copy)
	local P2 = p1 or {}
	local FetchToolCallStatus = P2.fetchToolCallStatus or FetchAdCampaignToolCallStatusModule
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(P2.ttlSeconds or 300),
		fetchFn = function(Text: string, _)
			-- upvalues: FetchToolCallStatus (copy)
			local FoundAt: number? = string.find(Text, ":", 1, true)
			assert(FoundAt ~= nil, "Invalid ad campaign tool-call status cache key")
			local Number: number? = tonumber((string.sub(Text, 1, FoundAt - 1)))
			local Segment = string.sub(Text, FoundAt + 1)
			assert(Number ~= nil and (Number > 0 and Segment ~= ""), "Invalid ad campaign tool-call status cache key")
			
			return FetchToolCallStatus(Segment, Number)
		end
	})
	
	return {
		getToolCallStatus = function(p2, Text)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem(tostring(p2) .. ":" .. Text)
		end,
		fetchToolCallStatus = function(p2, Text)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.fetchItem(tostring(p2) .. ":" .. Text)
		end,
		getAndFetchToolCallStatus = function(p2, Text)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getAndFetchItem(tostring(p2) .. ":" .. Text)
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end