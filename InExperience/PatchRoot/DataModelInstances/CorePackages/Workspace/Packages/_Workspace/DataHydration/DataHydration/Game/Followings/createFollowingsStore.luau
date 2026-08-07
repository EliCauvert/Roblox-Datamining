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

return function() --[[ line: 22 | named "createFollowingsStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), logResponseError (ref), followingsUrlBuilderModule (ref), fetchFollowingModule (ref), followingsStoreTypesModule (ref), discoveryEventErrorLogger (ref), signalsModule (ref), requestUpdateFollowingModule (ref), fFlagLuaAppDataHydrationUpdateItem (ref)
	local var9 = createDataCacheModule()
	local var10 = nil
	local var11 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var9,
		logError = function(p0) --[[ line: 30 ]]
			-- upvalues: logResponseError (copy), followingsUrlBuilderModule (copy)
			logResponseError(followingsUrlBuilderModule.FOLLOWING_STATUS_URL, p0)
		end,
		onClear = function() --[[ line: 34 ]]
			-- upvalues: var10 (write)
			var10 = nil
		end,
		fetchFn = function(p1, _) --[[ line: 38 ]]
			-- upvalues: fetchFollowingModule (copy), followingsStoreTypesModule (copy), discoveryEventErrorLogger (copy), var10 (write)
			return fetchFollowingModule(p1):andThen(function(p3) --[[ line: 43 ]]
				-- upvalues: followingsStoreTypesModule (copy), discoveryEventErrorLogger (copy), var10 (copy)
				local responseBody = p3.responseBody
				
				if not followingsStoreTypesModule.followingResponseValidator(responseBody) then
					discoveryEventErrorLogger.reportError("createFollowingsStore", "Invalid following response", {
						universeId = responseBody.UniverseId,
						isFollowing = responseBody.IsFollowing,
						userId = responseBody.UserId,
						canFollow = responseBody.CanFollow
					})
					error({ StatusCode = p3.responseCode })
				end
				if responseBody.FollowingCountByType and responseBody.FollowingLimitByType then
					var10 = {
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
			end):catch(function(p2) --[[ line: 74 ]]
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
		fetchFollowing = var11.fetchItem,
		fetchFollowings = var11.fetchItems,
		getFollowing = var11.getCachedItem,
		getFollowings = var11.getCachedItems,
		getAndFetchFollowing = var11.getAndFetchItem,
		getAndFetchFollowings = var11.getAndFetchItems,
		updateFollowing = function(p4, p5) --[[ line: 95 ]]
			-- upvalues: signalsModule (copy), var9 (ref), var10 (write), requestUpdateFollowingModule (copy), discoveryEventErrorLogger (copy), logResponseError (copy), followingsUrlBuilderModule (copy)
			local var12, var13 = signalsModule.createSignal(nil)
			local item = var9.getItem(p4)
			local var15 = item and item.data(false)
			local var16 = if var15 then var15.isFollowing else nil
			
			if p5 and var10 and var10.followingLimitByType <= var10.followingCountByType then
				var13({
					type = "error",
					errorType = "LimitReached",
					statusCode = nil,
					statusMessage = nil
				})
				
				return var12
			end
			var9.updateItem(p4, { isFollowing = p5 })
			
			if var10 then
				var10 = {
					followingCountByType = (if var10 then var10.followingCountByType else 0) + (if p5 then 1 else -1),
					followingLimitByType = var10.followingLimitByType
				}
			end
			requestUpdateFollowingModule(p4, p5):andThen(function() --[[ line: 143 ]]
				-- upvalues: var13 (ref), p5 (ref)
				var13({ type = "success", isFollowing = p5 })
			end):catch(function(p6) --[[ line: 149 ]]
				-- upvalues: var9 (copy), p4 (ref), var16 (ref), var10 (ref), var10 (copy), var13 (ref), discoveryEventErrorLogger (copy), p5 (ref), logResponseError (copy), followingsUrlBuilderModule (copy)
				var9.updateItem(p4, { isFollowing = var16 })
				
				if var10 then
					var10 = var10
				end
				local var17 = type(p6) == "table" and p6.ClientError ~= nil
				local var18 = if var17 then p6.message or p6.ClientError else nil
				local var19 = if type(p6) == "table" and p6.StatusCode then p6.StatusCode else nil
				local var20 = if type(p6) == "table" and p6.StatusMessage then p6.StatusMessage else nil
				var13({
					type = "error",
					errorType = if var17 then "ClientError" elseif var19 == 400 then "LimitReached" else "NetworkError",
					statusCode = var19,
					statusMessage = var18 or var20
				})
				
				if var17 then
					discoveryEventErrorLogger.reportError("updateFollowing", "Client validation error updating following", {
						universeId = p4,
						method = if p5 then "POST" else "DELETE",
						clientError = var18
					})
					
					return
				end
				logResponseError(followingsUrlBuilderModule.FOLLOWING_UPDATE_URL, { StatusCode = var19 })
				discoveryEventErrorLogger.reportError("updateFollowing", "Error updating following", {
					universeId = p4,
					statusCode = var19,
					method = if p5 then "POST" else "DELETE",
					statusMessage = var20
				})
			end)
			
			return var12
		end,
		updateItem = if fFlagLuaAppDataHydrationUpdateItem then var9.updateItem else nil,
		updateUserFollowingLimits = if fFlagLuaAppDataHydrationUpdateItem then function(p7) --[[ line: 234 ]]
			-- upvalues: var10 (write)
			var10 = p7
		end else nil,
		clear = function() --[[ line: 212 ]]
			-- upvalues: var10 (write), var11 (ref)
			var10 = nil
			var11.clear()
		end,
		dispose = function() --[[ line: 217 ]]
			-- upvalues: var11 (ref)
			var11.dispose()
		end
	}
end