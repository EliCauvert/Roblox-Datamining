local DataHydration = script:FindFirstAncestor("DataHydration")
local DiscoveryUtilsModule = require(DataHydration.Parent.DiscoveryUtils)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.GamePassStoreTypes)
local FetchGamePassesModule = require(script.Parent.fetchGamePasses)

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), LogResponseErrorFunction (copy), DiscoveryEventErrorLogger (copy), FetchGamePassesModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataCacheModule1 = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule1,
		logError = function(p1)
			-- upvalues: LogResponseErrorFunction (upval), DiscoveryEventErrorLogger (upval)
			LogResponseErrorFunction("game-passes/v1/universes/.../game-passes", {
				StatusCode = if type(p1) == "table" and p1.StatusCode then p1.StatusCode else nil
			})
			DiscoveryEventErrorLogger.reportError("GamePassStore", "Failed to fetch game passes", { err = tostring(p1) })
		end,
		fetchFn = function(p1, _)
			-- upvalues: FetchGamePassesModule (upval), DataCacheModule (copy)
			return FetchGamePassesModule(p1):andThen(function(Result)
				-- upvalues: DataCacheModule (upval)
				local List = {}
				
				for _, gamePass in Result.gamePasses do
					local Text = tostring(gamePass.id)
					table.insert(List, Text)
					DataCacheModule.updateItems({ [Text] = gamePass })
				end
				return List
			end)
		end
	})
	
	return {
		getPassesForUniverse = DataResolverModule.getCachedItem,
		getAndFetchPassesForUniverse = DataResolverModule.getAndFetchItem,
		fetchPassesForUniverse = DataResolverModule.fetchItem,
		getGamePassInfo = DataCacheModule.getItem,
		updateGamePassInfo = DataCacheModule.updateItem,
		updateGamePassInfos = DataCacheModule.updateItems,
		updateUniversePasses = DataCacheModule1.updateItems,
		clear = function()
			-- upvalues: DataCacheModule1 (copy), DataResolverModule (copy), DataCacheModule (copy)
			DataCacheModule1.clear()
			DataResolverModule.clear()
			DataCacheModule.clear()
		end,
		dispose = function()
			-- upvalues: DataResolverModule (copy), DataCacheModule (copy)
			DataResolverModule.dispose()
			DataCacheModule.dispose()
		end
	}
end