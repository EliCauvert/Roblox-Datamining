local dataHydration = script:FindFirstAncestor("DataHydration")
local discoveryUtilsModule = require(dataHydration.Parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.GamePassStoreTypes)
local fetchGamePassesModule = require(script.Parent.fetchGamePasses)

return function() --[[ line: 23 | named "createGamePassStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), logResponseError (ref), discoveryEventErrorLogger (ref), fetchGamePassesModule (ref)
	local var5 = createDataCacheModule()
	local var6 = createDataCacheModule()
	local var7 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var6,
		logError = function(p0) --[[ line: 33 ]]
			-- upvalues: logResponseError (copy), discoveryEventErrorLogger (copy)
			logResponseError("game-passes/v1/universes/.../game-passes", {
				StatusCode = if type(p0) == "table" and p0.StatusCode then p0.StatusCode else nil
			})
			discoveryEventErrorLogger.reportError("GamePassStore", "Failed to fetch game passes", { err = tostring(p0) })
		end,
		fetchFn = function(p1, _) --[[ line: 40 ]]
			-- upvalues: fetchGamePassesModule (copy), var5 (ref)
			return fetchGamePassesModule(p1):andThen(function(p2) --[[ line: 41 ]]
				-- upvalues: var5 (copy)
				local t = {}
				
				for i, v in p2.gamePasses do
					local var9 = tostring(v.id)
					table.insert(t, var9)
					var5.updateItems({ [var9] = v })
				end
				return t
			end)
		end
	})
	
	return {
		getPassesForUniverse = var7.getCachedItem,
		getAndFetchPassesForUniverse = var7.getAndFetchItem,
		fetchPassesForUniverse = var7.fetchItem,
		getGamePassInfo = var5.getItem,
		updateGamePassInfo = var5.updateItem,
		updateGamePassInfos = var5.updateItems,
		updateUniversePasses = var6.updateItems,
		clear = function() --[[ line: 55 ]]
			-- upvalues: var6 (ref), var7 (ref), var5 (ref)
			var6.clear()
			var7.clear()
			var5.clear()
		end,
		dispose = function() --[[ line: 61 ]]
			-- upvalues: var7 (ref), var5 (ref)
			var7.dispose()
			var5.dispose()
		end
	}
end