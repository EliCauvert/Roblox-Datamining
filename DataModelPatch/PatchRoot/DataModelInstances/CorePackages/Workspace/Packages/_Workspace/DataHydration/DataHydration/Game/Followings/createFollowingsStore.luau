local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local SignalsModule = require(Parent.Signals)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local _ = require(Parent.LuauPolyfill)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local FetchFollowingModule = require(script.Parent.fetchFollowing)
local RequestUpdateFollowingModule = require(script.Parent.requestUpdateFollowing)
local FollowingsStoreTypesModule = require(script.Parent.FollowingsStoreTypes)
local FollowingsUrlBuilderModule = require(script.Parent.FollowingsUrlBuilder)
local FFlagLuaAppDataHydrationUpdateItem = require(Parent.SharedFlags).FFlagLuaAppDataHydrationUpdateItem

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), LogResponseErrorFunction (copy), FollowingsUrlBuilderModule (copy), FetchFollowingModule (copy), FollowingsStoreTypesModule (copy), DiscoveryEventErrorLogger (copy), SignalsModule (copy), RequestUpdateFollowingModule (copy), FFlagLuaAppDataHydrationUpdateItem (copy)
	local DataCacheModule = CreateDataCacheModule()
	local Config = nil
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		logError = function(p1)
			-- upvalues: LogResponseErrorFunction (upval), FollowingsUrlBuilderModule (upval)
			LogResponseErrorFunction(FollowingsUrlBuilderModule.FOLLOWING_STATUS_URL, p1)
		end,
		onClear = function()
			-- upvalues: Config (ref)
			Config = nil
		end,
		fetchFn = function(UniverseId, _)
			-- upvalues: FetchFollowingModule (upval), FollowingsStoreTypesModule (upval), DiscoveryEventErrorLogger (upval), Config (ref)
			return FetchFollowingModule(UniverseId):andThen(function(Result)
				-- upvalues: FollowingsStoreTypesModule (upval), DiscoveryEventErrorLogger (upval), Config (upval)
				local ResponseBody = Result.responseBody
				
				if not FollowingsStoreTypesModule.followingResponseValidator(ResponseBody) then
					DiscoveryEventErrorLogger.reportError("createFollowingsStore", "Invalid following response", {
						universeId = ResponseBody.UniverseId,
						isFollowing = ResponseBody.IsFollowing,
						userId = ResponseBody.UserId,
						canFollow = ResponseBody.CanFollow
					})
					error({ StatusCode = Result.responseCode })
				end
				if ResponseBody.FollowingCountByType and ResponseBody.FollowingLimitByType then
					Config = {
						followingCountByType = ResponseBody.FollowingCountByType,
						followingLimitByType = ResponseBody.FollowingLimitByType
					}
				end
				return {
					universeId = tostring(ResponseBody.UniverseId),
					userId = tostring(ResponseBody.UserId),
					canFollow = ResponseBody.CanFollow,
					isFollowing = ResponseBody.IsFollowing
				}
			end):catch(function(Err)
				-- upvalues: DiscoveryEventErrorLogger (upval), UniverseId (copy)
				if type(Err) == "table" and Err.ClientError ~= nil then
					DiscoveryEventErrorLogger.reportError("createFollowingsStore", "Client validation error fetching following", {
						universeId = UniverseId,
						clientError = Err.message or Err.ClientError
					})
					
					return
				else
					error(Err)
				end
			end)
		end
	})
	
	return {
		fetchFollowing = DataResolverModule.fetchItem,
		fetchFollowings = DataResolverModule.fetchItems,
		getFollowing = DataResolverModule.getCachedItem,
		getFollowings = DataResolverModule.getCachedItems,
		getAndFetchFollowing = DataResolverModule.getAndFetchItem,
		getAndFetchFollowings = DataResolverModule.getAndFetchItems,
		updateFollowing = function(UniverseId, IsFollowing)
			-- upvalues: SignalsModule (upval), DataCacheModule (copy), Config (ref), RequestUpdateFollowingModule (upval), DiscoveryEventErrorLogger (upval), LogResponseErrorFunction (upval), FollowingsUrlBuilderModule (upval)
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			local Item = DataCacheModule.getItem(UniverseId)
			local DataResult = Item and Item.data(false)
			local IsFollowing1 = if DataResult then DataResult.isFollowing else nil
			local Config1 = Config
			
			if IsFollowing and Config1 and Config1.followingLimitByType <= Config1.followingCountByType then
				Signal2({
					type = "error",
					errorType = "LimitReached",
					statusCode = nil,
					statusMessage = nil
				})
				
				return Signal
			end
			DataCacheModule.updateItem(UniverseId, { isFollowing = IsFollowing })
			
			if Config1 then
				Config = {
					followingCountByType = (Config1 and Config1.followingCountByType or 0) + (if IsFollowing then 1 else -1),
					followingLimitByType = Config1.followingLimitByType
				}
			end
			RequestUpdateFollowingModule(UniverseId, IsFollowing):andThen(function()
				-- upvalues: Signal2 (copy), IsFollowing (copy)
				Signal2({ type = "success", isFollowing = IsFollowing })
			end):catch(function(Err)
				-- upvalues: DataCacheModule (upval), UniverseId (copy), IsFollowing1 (copy), Config1 (copy), Config (upval), Signal2 (copy), DiscoveryEventErrorLogger (upval), IsFollowing (copy), LogResponseErrorFunction (upval), FollowingsUrlBuilderModule (upval)
				DataCacheModule.updateItem(UniverseId, { isFollowing = IsFollowing1 })
				
				if Config1 then
					Config = Config1
				end
				local HasClientError: boolean = type(Err) == "table" and Err.ClientError ~= nil
				local Message = if HasClientError then Err.message or Err.ClientError else nil
				local StatusCode = if type(Err) == "table" and Err.StatusCode then Err.StatusCode else nil
				local StatusMessage = if type(Err) == "table" and Err.StatusMessage then Err.StatusMessage else nil
				Signal2({
					type = "error",
					errorType = if HasClientError then "ClientError" elseif StatusCode == 400 then "LimitReached" else "NetworkError",
					statusCode = StatusCode,
					statusMessage = Message or StatusMessage
				})
				
				if HasClientError then
					DiscoveryEventErrorLogger.reportError("updateFollowing", "Client validation error updating following", {
						universeId = UniverseId,
						method = if IsFollowing then "POST" else "DELETE",
						clientError = Message
					})
					
					return
				else
					LogResponseErrorFunction(FollowingsUrlBuilderModule.FOLLOWING_UPDATE_URL, { StatusCode = StatusCode })
					DiscoveryEventErrorLogger.reportError("updateFollowing", "Error updating following", {
						universeId = UniverseId,
						statusCode = StatusCode,
						method = if IsFollowing then "POST" else "DELETE",
						statusMessage = StatusMessage
					})
				end
			end)
			
			return Signal
		end,
		updateItem = if FFlagLuaAppDataHydrationUpdateItem then DataCacheModule.updateItem else nil,
		updateUserFollowingLimits = if FFlagLuaAppDataHydrationUpdateItem then function(p1)
			-- upvalues: Config (ref)
			Config = p1
		end else nil,
		clear = function()
			-- upvalues: Config (ref), DataResolverModule (copy)
			Config = nil
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: DataResolverModule (copy)
			DataResolverModule.dispose()
		end
	}
end