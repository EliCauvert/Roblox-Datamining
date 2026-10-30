local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local DashModule = require(Parent.Dash)
local _ = require(Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchPlaceDetailsModule = require(script.Parent.fetchPlaceDetails)
local _ = require(script.Parent.PlaceDetailsStoreTypes)

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchPlaceDetailsModule (copy), DashModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		replaceItems = true,
		requestBatchSize = 50,
		cache = DataCacheModule,
		queueProcessDelaySec = P0.queueProcessDelaySec or 0.05,
		fetchFn = function(p2)
			-- upvalues: FetchPlaceDetailsModule (upval), DashModule (upval), config (copy)
			return FetchPlaceDetailsModule(DashModule.keys(p2), config):andThen(function(Result)
				local t = {}
				
				for _, value in Result or {} do
					if value and value.placeId then
						t[tostring(value.placeId)] = {
							universeId = if value.universeId then tostring(value.universeId) else nil,
							name = value.name
						}
					end
				end
				return t
			end)
		end
	})
	
	return {
		getPlaceDetails = DataResolverModule.getCachedItem,
		getAndFetchPlaceDetails = function(p3)
			-- upvalues: DataResolverModule (copy)
			return (DataResolverModule.getAndFetchItem(p3))
		end,
		updatePlaceDetails = function(p3, p4)
			-- upvalues: DataCacheModule (copy)
			DataCacheModule.replaceItems({ [p3] = p4 })
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end