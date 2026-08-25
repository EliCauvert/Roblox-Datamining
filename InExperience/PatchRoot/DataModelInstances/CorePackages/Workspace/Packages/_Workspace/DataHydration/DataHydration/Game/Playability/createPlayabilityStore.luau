local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local dashModule = require(parent.Dash)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchPlayabilityModule = require(script.Parent.fetchPlayability)
local playabilityStoreTypesModule = require(script.Parent.PlayabilityStoreTypes)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local fIntLuaAppThrottleRefreshPlayabilityIntervalSeconds = require(parent.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds()

return function()
	-- upvalues: createDataCacheModule (ref), fIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (ref), createDataResolverModule (ref), logResponseError (ref), discoveryEventErrorLogger (ref), dashModule (ref), fetchPlayabilityModule (ref), playabilityStoreTypesModule (ref)
	local var8 = createDataCacheModule(fIntLuaAppThrottleRefreshPlayabilityIntervalSeconds)
	local var9 = createDataResolverModule({
		cache = var8,
		logError = function(p0)
			-- upvalues: logResponseError (copy), discoveryEventErrorLogger (copy)
			if type(p0) == "table" then
				if p0.responseCode then
					logResponseError("v1/games/multiget-playability-status", { StatusCode = tonumber(p0.responseCode) })
				end
				if p0.errorType and p0.errorMessage then
					discoveryEventErrorLogger.reportError(p0.errorType, p0.errorMessage, p0.customFields)
					
					return
				end
			else
				discoveryEventErrorLogger.reportError("FetchPlayabilityError", tostring(p0))
			end
		end,
		fetchFn = function(p1)
			-- upvalues: dashModule (copy), fetchPlayabilityModule (copy), playabilityStoreTypesModule (copy)
			local var10 = dashModule.keys(p1)
			
			return fetchPlayabilityModule(var10):andThen(function(p3)
				-- upvalues: var10 (ref), playabilityStoreTypesModule (copy)
				if not p3 or not p3.responseBody then
					error({
						errorType = "FetchPlayabilityResponseError",
						responseCode = p3 and p3.responseCode,
						errorMessage = if p3 then "Missing response body" else "No response",
						customFields = { universeIds = var10 }
					})
				end
				local var11, var12 = playabilityStoreTypesModule.playabilityResponseValidator(p3.responseBody)
				
				if not var11 then
					error({
						errorType = "FetchPlayabilityResponseInvalidInterface",
						responseCode = p3.responseCode,
						errorMessage = var12,
						customFields = { universeIds = var10 }
					})
				end
				local t = {}
				
				for i, v in p3.responseBody do
					t[tostring(v.universeId)] = {
						isPlayable = v.isPlayable,
						playabilityStatus = v.playabilityStatus
					}
				end
				return t
			end):catch(function(p2)
				error(p2)
			end)
		end
	})
	
	return {
		fetchPlayability = var9.fetchItem,
		getPlayability = var9.getCachedItem,
		getAndFetchPlayability = var9.getAndFetchItem,
		updatePlayability = var8.updateItem,
		updatePlayabilities = var8.updateItems,
		clear = var9.clear,
		dispose = var9.dispose
	}
end