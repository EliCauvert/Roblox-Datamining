local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchGameMediaModule = require(script.Parent.fetchGameMedia)
local gameMediaStoreTypesModule = require(script.Parent.GameMediaStoreTypes)
local fFlagMyStatsMediaSelector = require(parent.SharedFlags).FFlagMyStatsMediaSelector

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fFlagMyStatsMediaSelector (ref), discoveryEventErrorLogger (ref), fetchGameMediaModule (ref), gameMediaStoreTypesModule (ref)
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		cache = createDataCacheModule(),
		replaceItems = fFlagMyStatsMediaSelector,
		logError = function(p1)
			-- upvalues: discoveryEventErrorLogger (copy)
			if type(p1) == "table" and p1.errorType then
				discoveryEventErrorLogger.reportError(p1.errorType, p1.errorMessage)
				
				return
			end
			discoveryEventErrorLogger.reportError("FetchGameMediaError", tostring(p1))
		end,
		fetchFn = function(p1, _)
			-- upvalues: fetchGameMediaModule (copy), gameMediaStoreTypesModule (copy)
			return fetchGameMediaModule(p1):andThen(function(p2)
				-- upvalues: gameMediaStoreTypesModule (copy)
				if not p2 or not p2.responseBody then
					error({
						errorType = "FetchGameMediaResponseError",
						errorMessage = if p2 then "Missing response body" else "No response"
					})
				end
				local var2, var3 = gameMediaStoreTypesModule.gameMediaResponseValidator(p2.responseBody)
				
				if not var2 then
					error({
						errorType = "FetchGameMediaResponseInvalidInterface",
						errorMessage = var3
					})
				end
				local t = {}
				local data = p2.responseBody.data
				
				if data then
					for i, v in data do
						if v.imageId then
							table.insert(t, {
								imageId = v.imageId,
								assetTypeId = v.assetTypeId,
								videoId = v.videoId,
								videoHash = v.videoHash,
								videoTitle = v.videoTitle
							})
						end
					end
				end
				return t
			end)
		end
	})
	
	return {
		getAndFetchGameMedia = var1.getAndFetchItem,
		getGameMedia = var1.getCachedItem,
		fetchGameMedia = var1.fetchItem,
		clear = var1.clear,
		dispose = var1.dispose
	}
end