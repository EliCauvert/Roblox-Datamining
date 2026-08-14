local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchGameMediaModule = require(script.Parent.fetchGameMedia)
local gameMediaStoreTypesModule = require(script.Parent.GameMediaStoreTypes)
local fFlagMyStatsMediaSelector = require(parent.SharedFlags).FFlagMyStatsMediaSelector

return function() --[[ line: 17 | named "createGameMediaStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fFlagMyStatsMediaSelector (ref), discoveryEventErrorLogger (ref), fetchGameMediaModule (ref), gameMediaStoreTypesModule (ref)
	local var5 = createDataResolverModule({
		supportsMultiGet = false,
		cache = createDataCacheModule(),
		replaceItems = fFlagMyStatsMediaSelector,
		logError = function(p0) --[[ line: 23 ]]
			-- upvalues: discoveryEventErrorLogger (copy)
			if type(p0) == "table" and p0.errorType then
				discoveryEventErrorLogger.reportError(p0.errorType, p0.errorMessage)
				
				return
			end
			discoveryEventErrorLogger.reportError("FetchGameMediaError", tostring(p0))
		end,
		fetchFn = function(p1, _) --[[ line: 30 ]]
			-- upvalues: fetchGameMediaModule (copy), gameMediaStoreTypesModule (copy)
			return fetchGameMediaModule(p1):andThen(function(p2) --[[ line: 31 ]]
				-- upvalues: gameMediaStoreTypesModule (copy)
				if not p2 or not p2.responseBody then
					error({
						errorType = "FetchGameMediaResponseError",
						errorMessage = if p2 then "Missing response body" else "No response"
					})
				end
				local var6, var7 = gameMediaStoreTypesModule.gameMediaResponseValidator(p2.responseBody)
				
				if not var6 then
					error({
						errorType = "FetchGameMediaResponseInvalidInterface",
						errorMessage = var7
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
		getAndFetchGameMedia = var5.getAndFetchItem,
		getGameMedia = var5.getCachedItem,
		fetchGameMedia = var5.fetchItem,
		clear = var5.clear,
		dispose = var5.dispose
	}
end