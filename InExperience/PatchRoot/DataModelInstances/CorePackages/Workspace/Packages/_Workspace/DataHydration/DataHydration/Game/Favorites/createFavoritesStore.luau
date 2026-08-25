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
	local var10 = createDataCacheModule()
	local var11 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var10,
		logError = function(p0)
			-- upvalues: logResponseError (copy), favoritesUrlBuilderModule (copy)
			logResponseError(favoritesUrlBuilderModule.FAVORITE_URL, p0)
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
		fetchFavorite = var11.fetchItem,
		fetchFavorites = var11.fetchItems,
		getFavorite = var11.getCachedItem,
		getFavorites = var11.getCachedItems,
		getAndFetchFavorite = var11.getAndFetchItem,
		getAndFetchFavorites = var11.getAndFetchItems,
		updateFavorite = function(p3, p4)
			-- upvalues: signalsModule (copy), var10 (ref), fFlagSduiFavoritesHydrationStructured (copy), requestFavoriteUpdateModule (copy), discoveryEventErrorLogger (copy), logResponseError (copy), favoritesUrlBuilderModule (copy)
			local var12, var13 = signalsModule.createSignal(nil)
			local var14 = var10.getItem(p3).data(false)
			
			if fFlagSduiFavoritesHydrationStructured then
				var10.updateItem(p3, { isFavorited = p4 })
			else
				var10.updateItem(p3, p4)
			end
			requestFavoriteUpdateModule(p3, p4):andThen(function(_)
				-- upvalues: var13 (ref), p4 (ref)
				var13({ type = "success", isFavorited = p4 })
			end):catch(function(p5)
				-- upvalues: var10 (copy), p3 (ref), var14 (ref), discoveryEventErrorLogger (copy), logResponseError (copy), favoritesUrlBuilderModule (copy), var13 (ref)
				var10.updateItem(p3, var14)
				local var15 = if type(p5) == "table" and p5.StatusCode then p5.StatusCode else nil
				discoveryEventErrorLogger.reportError("updateFavorite", "Error updating favorite", {
					universeId = p3,
					statusCode = var15,
					statusMessage = if type(p5) == "table" and p5.StatusMessage then p5.StatusMessage else nil
				})
				logResponseError(favoritesUrlBuilderModule.FAVORITE_UPDATE_URL, { StatusCode = var15 })
				var13({ type = "error", error = tostring(p5) })
			end)
			
			return var12
		end,
		updateItem = if fFlagLuaAppDataHydrationUpdateItem then var10.updateItem else nil,
		updateItems = if fFlagSduiFavoritesHydrationStructured then var10.updateItems else nil,
		clear = function()
			-- upvalues: var10 (ref), var11 (ref)
			var10.clear()
			var11.clear()
		end,
		dispose = function()
			-- upvalues: var11 (ref)
			var11.dispose()
		end
	}
end