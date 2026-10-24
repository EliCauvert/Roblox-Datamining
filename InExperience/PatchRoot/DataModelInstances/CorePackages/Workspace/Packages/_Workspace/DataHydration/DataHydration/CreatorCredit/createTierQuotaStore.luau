local DataHydration = script:FindFirstAncestor("DataHydration")
local HttpClientModule = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local ResponseDecodersModule = require(script.Parent.responseDecoders)
local _ = require(script.Parent.types)
local config = {
	default = "MODEL_TIER_DEFAULT",
	advanced = "MODEL_TIER_ADVANCED"
}

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), HttpClientModule (copy), config (copy), ResponseDecodersModule (copy)
	local DataCacheModule = CreateDataCacheModule(p1.ttlSeconds, p1.ttlSeconds)
	local t = {}
	local Flag = false
	local v1: string = if string.find(p1.quotaSummaryUrl, "?", 1, true) then "&" else "?"
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		ignoreResponsesAfterTimeout = true,
		cache = DataCacheModule,
		onBeforeClear = function()
			-- upvalues: t (ref)
			t = {}
		end,
		fetchFn = function(Text: string)
			-- upvalues: HttpClientModule (upval), p1 (copy), v1 (copy), config (upval), ResponseDecodersModule (upval)
			local Match, Match2 = string.match(Text, "^([^:]+):([^:]+)$")
			
			return HttpClientModule.asPromise(HttpClientModule.fetch({
				method = "GET",
				analyticsKey = "creator-credit.get-quota-summary",
				url = `{p1.quotaSummaryUrl}{v1}product={Match}&modelTier={config[Match2]}`,
				network = p1.network,
				decode = ResponseDecodersModule.decodeTierQuotaSummary
			}))
		end
	})
	
	local function _(p2, p3): string
		-- upvalues: Flag (ref), config (upval)
		assert(not Flag, "Creator Credit tier store is disposed")
		assert(p2 == "PRODUCT_BUILD" or p2 == "PRODUCT_BUILD_IN_STUDIO", "Invalid quota product")
		assert(config[p3] ~= nil, "Invalid model tier")
		
		return `{p2}:{p3}`
	end
	
	return {
		getTierQuotaSummary = function(p2, p3)
			-- upvalues: Flag (ref), config (upval), p1 (copy), DataResolverModule (copy), t (ref)
			assert(not Flag, "Creator Credit tier store is disposed")
			assert(p2 == "PRODUCT_BUILD" or p2 == "PRODUCT_BUILD_IN_STUDIO", "Invalid quota product")
			assert(config[p3] ~= nil, "Invalid model tier")
			local Text: string = `{p2}:{p3}`
			
			if p1.getLocalPlayerUserId() == nil then
				return DataResolverModule.getCachedItem(Text)
			else
				t[Text] = true
				
				return DataResolverModule.getAndFetchItem(Text)
			end
		end,
		getTierQuotaSummarySignals = function(p2, p3)
			-- upvalues: DataResolverModule (copy), Flag (ref), config (upval)
			local GetCachedItemFunction = DataResolverModule.getCachedItem
			assert(not Flag, "Creator Credit tier store is disposed")
			assert(p2 == "PRODUCT_BUILD" or p2 == "PRODUCT_BUILD_IN_STUDIO", "Invalid quota product")
			assert(config[p3] ~= nil, "Invalid model tier")
			
			return GetCachedItemFunction(`{p2}:{p3}`)
		end,
		refreshTierQuotaSummary = function(p2, p3)
			-- upvalues: Flag (ref), config (upval), p1 (copy), DataResolverModule (copy), t (ref)
			assert(not Flag, "Creator Credit tier store is disposed")
			assert(p2 == "PRODUCT_BUILD" or p2 == "PRODUCT_BUILD_IN_STUDIO", "Invalid quota product")
			assert(config[p3] ~= nil, "Invalid model tier")
			local Text: string = `{p2}:{p3}`
			
			if p1.getLocalPlayerUserId() == nil then
				return DataResolverModule.getCachedItem(Text)
			else
				t[Text] = true
				
				return DataResolverModule.fetchItem(Text)
			end
		end,
		invalidate = function()
			-- upvalues: t (ref), DataResolverModule (copy), p1 (copy)
			local t1 = t
			DataResolverModule.clear()
			
			if p1.getLocalPlayerUserId() ~= nil then
				t = t1
				
				for i in t1 do
					DataResolverModule.fetchItem(i)
				end
			end
		end,
		clear = DataResolverModule.clear,
		dispose = function()
			-- upvalues: Flag (ref), DataResolverModule (copy)
			if not Flag then
				Flag = true
				DataResolverModule.dispose()
				
				return
			end
		end
	}
end