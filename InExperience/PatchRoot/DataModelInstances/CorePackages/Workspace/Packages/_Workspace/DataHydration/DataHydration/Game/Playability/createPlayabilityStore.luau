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
	local var1 = createDataCacheModule(fIntLuaAppThrottleRefreshPlayabilityIntervalSeconds)
	local var2 = createDataResolverModule({
		cache = var1,
		logError = function(p1)
			-- upvalues: logResponseError (copy), discoveryEventErrorLogger (copy)
			if type(p1) == "table" then
				if p1.responseCode then
					logResponseError("v1/games/multiget-playability-status", { StatusCode = tonumber(p1.responseCode) })
				end
				if p1.errorType and p1.errorMessage then
					discoveryEventErrorLogger.reportError(p1.errorType, p1.errorMessage, p1.customFields)
					
					return
				end
			else
				discoveryEventErrorLogger.reportError("FetchPlayabilityError", tostring(p1))
			end
		end,
		fetchFn = function(p1)
			-- upvalues: dashModule (copy), fetchPlayabilityModule (copy), playabilityStoreTypesModule (copy)
			local var3 = dashModule.keys(p1)
			
			return fetchPlayabilityModule(var3):andThen(function(p2)
				-- upvalues: var3 (ref), playabilityStoreTypesModule (copy)
				if not p2 or not p2.responseBody then
					error({
						errorType = "FetchPlayabilityResponseError",
						responseCode = p2 and p2.responseCode,
						errorMessage = if p2 then "Missing response body" else "No response",
						customFields = { universeIds = var3 }
					})
				end
				local var4, var5 = playabilityStoreTypesModule.playabilityResponseValidator(p2.responseBody)
				
				if not var4 then
					error({
						errorType = "FetchPlayabilityResponseInvalidInterface",
						responseCode = p2.responseCode,
						errorMessage = var5,
						customFields = { universeIds = var3 }
					})
				end
				local t = {}
				
				for i, v in p2.responseBody do
					t[tostring(v.universeId)] = {
						isPlayable = v.isPlayable,
						playabilityStatus = v.playabilityStatus
					}
				end
				return t
			end):catch(function(p3)
				error(p3)
			end)
		end
	})
	
	return {
		fetchPlayability = var2.fetchItem,
		getPlayability = var2.getCachedItem,
		getAndFetchPlayability = var2.getAndFetchItem,
		updatePlayability = var1.updateItem,
		updatePlayabilities = var1.updateItems,
		clear = var2.clear,
		dispose = var2.dispose
	}
end