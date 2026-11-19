local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local SignalsModule = require(Parent.Signals)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.GamePassStoreTypes)
local GamePassUrlBuilderModule = require(script.Parent.GamePassUrlBuilder)
local FetchGamePassesModule = require(script.Parent.fetchGamePasses)
local RequestRevokeGamePassOwnershipModule = require(script.Parent.requestRevokeGamePassOwnership)

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), LogResponseErrorFunction (copy), DiscoveryEventErrorLogger (copy), FetchGamePassesModule (copy), SignalsModule (copy), RequestRevokeGamePassOwnershipModule (copy), GamePassUrlBuilderModule (copy)
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
		revokeOwnership = function(PassId)
			-- upvalues: SignalsModule (upval), DataCacheModule (copy), RequestRevokeGamePassOwnershipModule (upval), LogResponseErrorFunction (upval), GamePassUrlBuilderModule (upval), DiscoveryEventErrorLogger (upval)
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			
			local function _()
				-- upvalues: DataCacheModule (upval), PassId (copy)
				return DataCacheModule.getItem(PassId).data(false)
			end
			
			local DataResult = nil
			local DataResult1 = DataCacheModule.getItem(PassId).data(false)
			
			if DataResult1 and DataResult1.isOwned == true then
				DataCacheModule.updateItem(PassId, { isOwned = false, id = DataResult1.id })
				DataResult = DataCacheModule.getItem(PassId).data(false)
			end
			local function markRevoked()
				-- upvalues: DataCacheModule (upval), PassId (copy), Signal2 (copy)
				local DataResult = DataCacheModule.getItem(PassId).data(false)
				
				if DataResult and DataResult.isOwned == true then
					DataCacheModule.updateItem(PassId, { isOwned = false, id = DataResult.id })
				end
				Signal2({ type = "success" })
			end
			
			RequestRevokeGamePassOwnershipModule(PassId):andThen(function()
				-- upvalues: markRevoked (copy)
				markRevoked()
			end, function(p2)
				-- upvalues: markRevoked (copy), DataResult (ref), DataCacheModule (upval), PassId (copy), LogResponseErrorFunction (upval), GamePassUrlBuilderModule (upval), DiscoveryEventErrorLogger (upval), Signal2 (copy)
				local StatusCode = if type(p2) == "table" and p2.StatusCode then p2.StatusCode else nil
				
				if StatusCode == 409 then
					markRevoked()
					
					return
				end
				if DataResult ~= nil and DataCacheModule.getItem(PassId).data(false) == DataResult then
					DataCacheModule.updateItem(PassId, { isOwned = true, id = DataResult.id })
				end
				local StatusMessage = if type(p2) == "table" and p2.StatusMessage then p2.StatusMessage elseif type(p2) == "string" then p2 else nil
				LogResponseErrorFunction(GamePassUrlBuilderModule.REVOKE_OWNERSHIP_ENDPOINT, { StatusCode = StatusCode })
				DiscoveryEventErrorLogger.reportError("GamePassStore", "Failed to revoke game pass ownership", {
					passId = PassId,
					statusCode = StatusCode,
					statusMessage = StatusMessage,
					httpError = if type(p2) == "table" and p2.HttpError then tostring(p2.HttpError) else nil
				})
				Signal2({
					type = "error",
					errorType = "NetworkError",
					statusCode = StatusCode,
					statusMessage = StatusMessage
				})
			end)
			
			return Signal
		end,
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