local dataHydration = script:FindFirstAncestor("DataHydration")
local discoveryUtilsModule = require(dataHydration.Parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.GamePassStoreTypes)
local fetchGamePassesModule = require(script.Parent.fetchGamePasses)

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), logResponseError (ref), discoveryEventErrorLogger (ref), fetchGamePassesModule (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataCacheModule()
	local var3 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var2,
		logError = function(p1)
			-- upvalues: logResponseError (copy), discoveryEventErrorLogger (copy)
			logResponseError("game-passes/v1/universes/.../game-passes", {
				StatusCode = if type(p1) == "table" and p1.StatusCode then p1.StatusCode else nil
			})
			discoveryEventErrorLogger.reportError("GamePassStore", "Failed to fetch game passes", { err = tostring(p1) })
		end,
		fetchFn = function(p1, _)
			-- upvalues: fetchGamePassesModule (copy), var1 (ref)
			return fetchGamePassesModule(p1):andThen(function(p2)
				-- upvalues: var1 (copy)
				local t = {}
				
				for i, v in p2.gamePasses do
					local var4 = tostring(v.id)
					table.insert(t, var4)
					var1.updateItems({ [var4] = v })
				end
				return t
			end)
		end
	})
	
	return {
		getPassesForUniverse = var3.getCachedItem,
		getAndFetchPassesForUniverse = var3.getAndFetchItem,
		fetchPassesForUniverse = var3.fetchItem,
		getGamePassInfo = var1.getItem,
		updateGamePassInfo = var1.updateItem,
		updateGamePassInfos = var1.updateItems,
		updateUniversePasses = var2.updateItems,
		clear = function()
			-- upvalues: var2 (ref), var3 (ref), var1 (ref)
			var2.clear()
			var3.clear()
			var1.clear()
		end,
		dispose = function()
			-- upvalues: var3 (ref), var1 (ref)
			var3.dispose()
			var1.dispose()
		end
	}
end