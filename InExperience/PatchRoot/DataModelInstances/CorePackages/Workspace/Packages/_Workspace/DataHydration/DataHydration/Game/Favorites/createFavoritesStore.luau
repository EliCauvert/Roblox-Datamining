local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local favoritesStoreTypesModule = require(script.Parent.FavoritesStoreTypes)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local fetchFavoriteModule = require(script.Parent.fetchFavorite)
local requestFavoriteUpdateModule = require(script.Parent.requestFavoriteUpdate)
local signalsModule = require(parent.Signals)
local favoritesUrlBuilderModule = require(script.Parent.FavoritesUrlBuilder)
local _ = require(parent.LuauPolyfill)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppDataHydrationUpdateItem = sharedFlagsModule.FFlagLuaAppDataHydrationUpdateItem
local fFlagSduiFavoritesHydrationStructured = sharedFlagsModule.FFlagSduiFavoritesHydrationStructured

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), logResponseError (ref), favoritesUrlBuilderModule (ref), fetchFavoriteModule (ref), favoritesStoreTypesModule (ref), discoveryEventErrorLogger (ref), fFlagSduiFavoritesHydrationStructured (ref), signalsModule (ref), requestFavoriteUpdateModule (ref), fFlagLuaAppDataHydrationUpdateItem (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var1,
		logError = function(p1)
			-- upvalues: logResponseError (copy), favoritesUrlBuilderModule (copy)
			logResponseError(favoritesUrlBuilderModule.FAVORITE_URL, p1)
		end,
		fetchFn = function(p1, _)
			-- upvalues: fetchFavoriteModule (copy), favoritesStoreTypesModule (copy), discoveryEventErrorLogger (copy), fFlagSduiFavoritesHydrationStructured (copy)
			return fetchFavoriteModule(p1):andThen(function(p2)
				-- upvalues: favoritesStoreTypesModule (copy), discoveryEventErrorLogger (copy), p1 (ref), fFlagSduiFavoritesHydrationStructured (copy)
				local responseBody = p2.responseBody
				
				if not favoritesStoreTypesModule.favoriteResponseValidator(responseBody) then
					discoveryEventErrorLogger.reportError("createFavoritesStore", "Invalid favorite response", { universeId = p1, responseBody = responseBody })
					error({ StatusCode = p2.responseCode })
				end
				return if fFlagSduiFavoritesHydrationStructured then { isFavorited = responseBody.isFavorited } else responseBody.isFavorited
			end)
		end
	})
	
	return {
		fetchFavorite = var2.fetchItem,
		fetchFavorites = var2.fetchItems,
		getFavorite = var2.getCachedItem,
		getFavorites = var2.getCachedItems,
		getAndFetchFavorite = var2.getAndFetchItem,
		getAndFetchFavorites = var2.getAndFetchItems,
		updateFavorite = function(p1, p2)
			-- upvalues: signalsModule (copy), var1 (ref), fFlagSduiFavoritesHydrationStructured (copy), requestFavoriteUpdateModule (copy), discoveryEventErrorLogger (copy), logResponseError (copy), favoritesUrlBuilderModule (copy)
			local var3, var4 = signalsModule.createSignal(nil)
			local var5 = var1.getItem(p1).data(false)
			
			if fFlagSduiFavoritesHydrationStructured then
				var1.updateItem(p1, { isFavorited = p2 })
			else
				var1.updateItem(p1, p2)
			end
			requestFavoriteUpdateModule(p1, p2):andThen(function(_)
				-- upvalues: var4 (ref), p2 (ref)
				var4({ type = "success", isFavorited = p2 })
			end):catch(function(p3)
				-- upvalues: var1 (copy), p1 (ref), var5 (ref), discoveryEventErrorLogger (copy), logResponseError (copy), favoritesUrlBuilderModule (copy), var4 (ref)
				var1.updateItem(p1, var5)
				local var6 = if type(p3) == "table" and p3.StatusCode then p3.StatusCode else nil
				discoveryEventErrorLogger.reportError("updateFavorite", "Error updating favorite", {
					universeId = p1,
					statusCode = var6,
					statusMessage = if type(p3) == "table" and p3.StatusMessage then p3.StatusMessage else nil
				})
				logResponseError(favoritesUrlBuilderModule.FAVORITE_UPDATE_URL, { StatusCode = var6 })
				var4({ type = "error", error = tostring(p3) })
			end)
			
			return var3
		end,
		updateItem = if fFlagLuaAppDataHydrationUpdateItem then var1.updateItem else nil,
		updateItems = if fFlagSduiFavoritesHydrationStructured then var1.updateItems else nil,
		clear = function()
			-- upvalues: var1 (ref), var2 (ref)
			var1.clear()
			var2.clear()
		end,
		dispose = function()
			-- upvalues: var2 (ref)
			var2.dispose()
		end
	}
end