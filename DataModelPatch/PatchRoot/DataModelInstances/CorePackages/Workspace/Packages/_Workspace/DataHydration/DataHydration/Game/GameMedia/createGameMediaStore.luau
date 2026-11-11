local DataHydration = script:FindFirstAncestor("DataHydration")
local DiscoveryEventErrorLogger = require(DataHydration.Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchGameMediaModule = require(script.Parent.fetchGameMedia)
local GameMediaStoreTypesModule = require(script.Parent.GameMediaStoreTypes)

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), DiscoveryEventErrorLogger (copy), FetchGameMediaModule (copy), GameMediaStoreTypesModule (copy)
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = CreateDataCacheModule(),
		logError = function(p1)
			-- upvalues: DiscoveryEventErrorLogger (upval)
			if type(p1) == "table" and p1.errorType then
				DiscoveryEventErrorLogger.reportError(p1.errorType, p1.errorMessage)
				
				return
			else
				DiscoveryEventErrorLogger.reportError("FetchGameMediaError", (tostring(p1)))
			end
		end,
		fetchFn = function(p1, _)
			-- upvalues: FetchGameMediaModule (upval), GameMediaStoreTypesModule (upval)
			return FetchGameMediaModule(p1):andThen(function(Result)
				-- upvalues: GameMediaStoreTypesModule (upval)
				if not Result or not Result.responseBody then
					error({
						errorType = "FetchGameMediaResponseError",
						errorMessage = if Result then "Missing response body" else "No response"
					})
				end
				local GameMediaResponseValidatorResult, GameMediaResponseValidatorResult2 = GameMediaStoreTypesModule.gameMediaResponseValidator(Result.responseBody)
				
				if not GameMediaResponseValidatorResult then
					error({
						errorType = "FetchGameMediaResponseInvalidInterface",
						errorMessage = GameMediaResponseValidatorResult2
					})
				end
				local List = {}
				local Data = Result.responseBody.data
				
				if Data then
					for _, entry in Data do
						if entry.imageId then
							table.insert(List, {
								imageId = entry.imageId,
								assetTypeId = entry.assetTypeId,
								videoId = entry.videoId,
								videoHash = entry.videoHash,
								videoTitle = entry.videoTitle
							})
						end
					end
				end
				return List
			end)
		end
	})
	
	return {
		getAndFetchGameMedia = DataResolverModule.getAndFetchItem,
		getGameMedia = DataResolverModule.getCachedItem,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end