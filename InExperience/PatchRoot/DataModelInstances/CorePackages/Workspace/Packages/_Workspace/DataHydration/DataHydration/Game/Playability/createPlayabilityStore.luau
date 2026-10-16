local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local DashModule = require(Parent.Dash)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchPlayabilityModule = require(script.Parent.fetchPlayability)
local PlayabilityStoreTypesModule = require(script.Parent.PlayabilityStoreTypes)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local FIntLuaAppThrottleRefreshPlayabilityIntervalSeconds = require(Parent.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds()

return function() --[[ Line: 23 | Named "createPlayabilityStore" ]]
	-- upvalues: CreateDataCacheModule (copy), FIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (copy), CreateDataResolverModule (copy), LogResponseErrorFunction (copy), DiscoveryEventErrorLogger (copy), DashModule (copy), FetchPlayabilityModule (copy), PlayabilityStoreTypesModule (copy)
	local DataCacheModule = CreateDataCacheModule(FIntLuaAppThrottleRefreshPlayabilityIntervalSeconds)
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		logError = function(p1) --[[ Line: 28 ]]
			-- upvalues: LogResponseErrorFunction (upval), DiscoveryEventErrorLogger (upval)
			if type(p1) == "table" then
				if p1.responseCode then
					LogResponseErrorFunction("v1/games/multiget-playability-status", { StatusCode = tonumber(p1.responseCode) })
				end
				if p1.errorType and p1.errorMessage then
					DiscoveryEventErrorLogger.reportError(p1.errorType, p1.errorMessage, p1.customFields)
					
					return
				end
			else
				DiscoveryEventErrorLogger.reportError("FetchPlayabilityError", (tostring(p1)))
			end
		end,
		fetchFn = function(p1) --[[ Line: 48 ]]
			-- upvalues: DashModule (upval), FetchPlayabilityModule (upval), PlayabilityStoreTypesModule (upval)
			local KeysResult = DashModule.keys(p1)
			
			return FetchPlayabilityModule(KeysResult):andThen(function(Result) --[[ Line: 53 ]]
				-- upvalues: KeysResult (copy), PlayabilityStoreTypesModule (upval)
				if not Result or not Result.responseBody then
					error({
						errorType = "FetchPlayabilityResponseError",
						responseCode = Result and Result.responseCode,
						errorMessage = if Result then "Missing response body" else "No response",
						customFields = { universeIds = KeysResult }
					})
				end
				local PlayabilityResponseValidatorResult, PlayabilityResponseValidatorResult2 = PlayabilityStoreTypesModule.playabilityResponseValidator(Result.responseBody)
				
				if not PlayabilityResponseValidatorResult then
					error({
						errorType = "FetchPlayabilityResponseInvalidInterface",
						responseCode = Result.responseCode,
						errorMessage = PlayabilityResponseValidatorResult2,
						customFields = { universeIds = KeysResult }
					})
				end
				local t = {}
				
				for _, value in Result.responseBody do
					t[tostring(value.universeId)] = {
						isPlayable = value.isPlayable,
						playabilityStatus = value.playabilityStatus
					}
				end
				return t
			end):catch(function(Err) --[[ Line: 85 ]]
				error(Err)
			end)
		end
	})
	
	return {
		fetchPlayability = DataResolverModule.fetchItem,
		getPlayability = DataResolverModule.getCachedItem,
		getAndFetchPlayability = DataResolverModule.getAndFetchItem,
		updatePlayability = DataCacheModule.updateItem,
		updatePlayabilities = DataCacheModule.updateItems,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end