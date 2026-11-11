local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FavoritesStoreTypesModule = require(script.Parent.FavoritesStoreTypes)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local FetchFavoriteModule = require(script.Parent.fetchFavorite)
local RequestFavoriteUpdateModule = require(script.Parent.requestFavoriteUpdate)
local SignalsModule = require(Parent.Signals)
local FavoritesUrlBuilderModule = require(script.Parent.FavoritesUrlBuilder)
local _ = require(Parent.LuauPolyfill)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppDataHydrationUpdateItem = SharedFlagsModule.FFlagLuaAppDataHydrationUpdateItem
local FFlagSduiFavoritesHydrationStructured = SharedFlagsModule.FFlagSduiFavoritesHydrationStructured

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), LogResponseErrorFunction (copy), FavoritesUrlBuilderModule (copy), FetchFavoriteModule (copy), FavoritesStoreTypesModule (copy), DiscoveryEventErrorLogger (copy), FFlagSduiFavoritesHydrationStructured (copy), SignalsModule (copy), RequestFavoriteUpdateModule (copy), FFlagLuaAppDataHydrationUpdateItem (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		logError = function(p1)
			-- upvalues: LogResponseErrorFunction (upval), FavoritesUrlBuilderModule (upval)
			LogResponseErrorFunction(FavoritesUrlBuilderModule.FAVORITE_URL, p1)
		end,
		fetchFn = function(UniverseId, _)
			-- upvalues: FetchFavoriteModule (upval), FavoritesStoreTypesModule (upval), DiscoveryEventErrorLogger (upval), FFlagSduiFavoritesHydrationStructured (upval)
			return FetchFavoriteModule(UniverseId):andThen(function(Result)
				-- upvalues: FavoritesStoreTypesModule (upval), DiscoveryEventErrorLogger (upval), UniverseId (copy), FFlagSduiFavoritesHydrationStructured (upval)
				local ResponseBody = Result.responseBody
				
				if not FavoritesStoreTypesModule.favoriteResponseValidator(ResponseBody) then
					DiscoveryEventErrorLogger.reportError("createFavoritesStore", "Invalid favorite response", { universeId = UniverseId, responseBody = ResponseBody })
					error({ StatusCode = Result.responseCode })
				end
				return if FFlagSduiFavoritesHydrationStructured then { isFavorited = ResponseBody.isFavorited } else ResponseBody.isFavorited
			end)
		end
	})
	
	return {
		fetchFavorite = DataResolverModule.fetchItem,
		fetchFavorites = DataResolverModule.fetchItems,
		getFavorite = DataResolverModule.getCachedItem,
		getFavorites = DataResolverModule.getCachedItems,
		getAndFetchFavorite = DataResolverModule.getAndFetchItem,
		getAndFetchFavorites = DataResolverModule.getAndFetchItems,
		updateFavorite = function(UniverseId, IsFavorited)
			-- upvalues: SignalsModule (upval), DataCacheModule (copy), FFlagSduiFavoritesHydrationStructured (upval), RequestFavoriteUpdateModule (upval), DiscoveryEventErrorLogger (upval), LogResponseErrorFunction (upval), FavoritesUrlBuilderModule (upval)
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			local DataResult = DataCacheModule.getItem(UniverseId).data(false)
			
			if FFlagSduiFavoritesHydrationStructured then
				DataCacheModule.updateItem(UniverseId, { isFavorited = IsFavorited })
			else
				DataCacheModule.updateItem(UniverseId, IsFavorited)
			end
			RequestFavoriteUpdateModule(UniverseId, IsFavorited):andThen(function(_)
				-- upvalues: Signal2 (copy), IsFavorited (copy)
				Signal2({ type = "success", isFavorited = IsFavorited })
			end):catch(function(Err)
				-- upvalues: DataCacheModule (upval), UniverseId (copy), DataResult (copy), DiscoveryEventErrorLogger (upval), LogResponseErrorFunction (upval), FavoritesUrlBuilderModule (upval), Signal2 (copy)
				DataCacheModule.updateItem(UniverseId, DataResult)
				local StatusCode = if type(Err) == "table" and Err.StatusCode then Err.StatusCode else nil
				DiscoveryEventErrorLogger.reportError("updateFavorite", "Error updating favorite", {
					universeId = UniverseId,
					statusCode = StatusCode,
					statusMessage = if type(Err) == "table" and Err.StatusMessage then Err.StatusMessage else nil
				})
				LogResponseErrorFunction(FavoritesUrlBuilderModule.FAVORITE_UPDATE_URL, { StatusCode = StatusCode })
				Signal2({ type = "error", error = tostring(Err) })
			end)
			
			return Signal
		end,
		updateItem = if FFlagLuaAppDataHydrationUpdateItem then DataCacheModule.updateItem else nil,
		updateItems = if FFlagSduiFavoritesHydrationStructured then DataCacheModule.updateItems else nil,
		clear = function()
			-- upvalues: DataCacheModule (copy), DataResolverModule (copy)
			DataCacheModule.clear()
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: DataResolverModule (copy)
			DataResolverModule.dispose()
		end
	}
end