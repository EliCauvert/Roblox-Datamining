local dataHydration = script:FindFirstAncestor("DataHydration")
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchAdCampaignToolCallStatusModule = require(script.Parent.fetchAdCampaignToolCallStatus)
local _ = require(script.Parent.AdCampaignToolCallStatusStoreTypes)

local function _(p1, p2)
	return tostring(p1) .. ":" .. p1
end

local _ = function(p1)
	local matchIndex = string.find(p1, ":", 1, true)
	assert(matchIndex ~= nil, "Invalid ad campaign tool-call status cache key")
	local var1 = tonumber(string.sub(p1, 1, matchIndex - 1))
	local substring = string.sub(p1, matchIndex + 1)
	assert(var1 ~= nil and (var1 > 0 and substring ~= ""), "Invalid ad campaign tool-call status cache key")
	
	return var1, substring
end

return function(p1)
	-- upvalues: fetchAdCampaignToolCallStatusModule (ref), createDataCacheModule (ref), createDataResolverModule (ref)
	p1 = p1 or {}
	local fetchToolCallStatus = p1.fetchToolCallStatus or fetchAdCampaignToolCallStatusModule
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(p1.ttlSeconds or 300),
		fetchFn = function(p2, _)
			-- upvalues: fetchToolCallStatus (ref)
			local matchIndex = string.find(p2, ":", 1, true)
			assert(matchIndex ~= nil, "Invalid ad campaign tool-call status cache key")
			local var2 = tonumber(string.sub(p2, 1, matchIndex - 1))
			local substring = string.sub(p2, matchIndex + 1)
			assert(var2 ~= nil and (var2 > 0 and substring ~= ""), "Invalid ad campaign tool-call status cache key")
			
			return fetchToolCallStatus(substring, var2)
		end
	})
	
	return {
		getToolCallStatus = function(p2, p3)
			-- upvalues: var1 (ref)
			return var1.getCachedItem(tostring(p2) .. ":" .. p6)
		end,
		fetchToolCallStatus = function(p2, p3)
			-- upvalues: var1 (ref)
			return var1.fetchItem(tostring(p2) .. ":" .. p8)
		end,
		getAndFetchToolCallStatus = function(p2, p3)
			-- upvalues: var1 (ref)
			return var1.getAndFetchItem(tostring(p2) .. ":" .. p10)
		end,
		clear = var1.clear,
		dispose = var1.dispose
	}
end