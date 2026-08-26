local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local signalsModule = require(parent.Signals)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local _ = require(parent.LuauPolyfill)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local fetchFollowingModule = require(script.Parent.fetchFollowing)
local requestUpdateFollowingModule = require(script.Parent.requestUpdateFollowing)
local followingsStoreTypesModule = require(script.Parent.FollowingsStoreTypes)
local followingsUrlBuilderModule = require(script.Parent.FollowingsUrlBuilder)
local fFlagLuaAppDataHydrationUpdateItem = require(parent.SharedFlags).FFlagLuaAppDataHydrationUpdateItem

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), logResponseError (ref), followingsUrlBuilderModule (ref), fetchFollowingModule (ref), followingsStoreTypesModule (ref), discoveryEventErrorLogger (ref), signalsModule (ref), requestUpdateFollowingModule (ref), fFlagLuaAppDataHydrationUpdateItem (ref)
	local var1 = createDataCacheModule()
	local var2 = nil
	local var3 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var1,
		logError = function(p1)
			-- upvalues: logResponseError (copy), followingsUrlBuilderModule (copy)
			logResponseError(followingsUrlBuilderModule.FOLLOWING_STATUS_URL, p1)
		end,
		onClear = function()
			-- upvalues: var2 (write)
			var2 = nil
		end,
		fetchFn = function(p1, _)
			-- upvalues: fetchFollowingModule (copy), followingsStoreTypesModule (copy), discoveryEventErrorLogger (copy), var2 (write)
			return fetchFollowingModule(p1):andThen(function(p2)
				-- upvalues: followingsStoreTypesModule (copy), discoveryEventErrorLogger (copy), var2 (copy)
				local responseBody = p2.responseBody
				
				if not followingsStoreTypesModule.followingResponseValidator(responseBody) then
					discoveryEventErrorLogger.reportError("createFollowingsStore", "Invalid following response", {
						universeId = responseBody.UniverseId,
						isFollowing = responseBody.IsFollowing,
						userId = responseBody.UserId,
						canFollow = responseBody.CanFollow
					})
					error({ StatusCode = p2.responseCode })
				end
				if responseBody.FollowingCountByType and responseBody.FollowingLimitByType then
					var2 = {
						followingCountByType = responseBody.FollowingCountByType,
						followingLimitByType = responseBody.FollowingLimitByType
					}
				end
				return {
					universeId = tostring(responseBody.UniverseId),
					userId = tostring(responseBody.UserId),
					canFollow = responseBody.CanFollow,
					isFollowing = responseBody.IsFollowing
				}
			end):catch(function(p2)
				-- upvalues: discoveryEventErrorLogger (copy), p1 (ref)
				if type(p2) == "table" and p2.ClientError ~= nil then
					discoveryEventErrorLogger.reportError("createFollowingsStore", "Client validation error fetching following", {
						universeId = p1,
						clientError = p2.message or p2.ClientError
					})
					
					return
				end
				error(p2)
			end)
		end
	})
	
	return {
		fetchFollowing = var3.fetchItem,
		fetchFollowings = var3.fetchItems,
		getFollowing = var3.getCachedItem,
		getFollowings = var3.getCachedItems,
		getAndFetchFollowing = var3.getAndFetchItem,
		getAndFetchFollowings = var3.getAndFetchItems,
		updateFollowing = function(p1, p2)
			-- upvalues: signalsModule (copy), var1 (ref), var2 (write), requestUpdateFollowingModule (copy), discoveryEventErrorLogger (copy), logResponseError (copy), followingsUrlBuilderModule (copy)
			local var4, var5 = signalsModule.createSignal(nil)
			local item = var1.getItem(p1)
			local var6 = item and item.data(false)
			local var7 = if var6 then var6.isFollowing else nil
			
			if p2 and var2 and var2.followingLimitByType <= var2.followingCountByType then
				var5({
					type = "error",
					errorType = "LimitReached",
					statusCode = nil,
					statusMessage = nil
				})
				
				return var4
			end
			var1.updateItem(p1, { isFollowing = p2 })
			
			if var2 then
				var2 = {
					followingCountByType = (if var2 then var2.followingCountByType else 0) + (if p2 then 1 else -1),
					followingLimitByType = var2.followingLimitByType
				}
			end
			requestUpdateFollowingModule(p1, p2):andThen(function()
				-- upvalues: var5 (ref), p2 (ref)
				var5({ type = "success", isFollowing = p2 })
			end):catch(function(p3)
				-- upvalues: var1 (copy), p1 (ref), var7 (ref), var2 (ref), var2 (copy), var5 (ref), discoveryEventErrorLogger (copy), p2 (ref), logResponseError (copy), followingsUrlBuilderModule (copy)
				var1.updateItem(p1, { isFollowing = var7 })
				
				if var2 then
					var2 = var2
				end
				local var8 = type(p3) == "table" and p3.ClientError ~= nil
				local var9 = if var8 then p3.message or p3.ClientError else nil
				local var10 = if type(p3) == "table" and p3.StatusCode then p3.StatusCode else nil
				local var11 = if type(p3) == "table" and p3.StatusMessage then p3.StatusMessage else nil
				var5({
					type = "error",
					errorType = if var8 then "ClientError" elseif var10 == 400 then "LimitReached" else "NetworkError",
					statusCode = var10,
					statusMessage = var9 or var11
				})
				
				if var8 then
					discoveryEventErrorLogger.reportError("updateFollowing", "Client validation error updating following", {
						universeId = p1,
						method = if p2 then "POST" else "DELETE",
						clientError = var9
					})
					
					return
				end
				logResponseError(followingsUrlBuilderModule.FOLLOWING_UPDATE_URL, { StatusCode = var10 })
				discoveryEventErrorLogger.reportError("updateFollowing", "Error updating following", {
					universeId = p1,
					statusCode = var10,
					method = if p2 then "POST" else "DELETE",
					statusMessage = var11
				})
			end)
			
			return var4
		end,
		updateItem = if fFlagLuaAppDataHydrationUpdateItem then var1.updateItem else nil,
		updateUserFollowingLimits = if fFlagLuaAppDataHydrationUpdateItem then function(p1)
			-- upvalues: var2 (write)
			var2 = p1
		end else nil,
		clear = function()
			-- upvalues: var2 (write), var3 (ref)
			var2 = nil
			var3.clear()
		end,
		dispose = function()
			-- upvalues: var3 (ref)
			var3.dispose()
		end
	}
end