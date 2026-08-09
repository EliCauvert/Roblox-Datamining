local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.BadgesTypes)
local requestRemoveBadgeModule = require(script.Parent.requestRemoveBadge)
local badgesUrlBuilderModule = require(script.Parent.BadgesUrlBuilder)
local fFlagLuaAppSduiBadgeDetailsComponents = require(parent.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger

return function() --[[ line: 28 | named "createBadgeInfoStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), signalsModule (ref), requestRemoveBadgeModule (ref), logResponseError (ref), badgesUrlBuilderModule (ref), discoveryEventErrorLogger (ref), fFlagLuaAppSduiBadgeDetailsComponents (ref)
	local var8 = createDataCacheModule()
	local var9 = createDataResolverModule({
		cache = var8,
		fetchFn = function(_) --[[ line: 32 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getBadgeInfo = var9.getCachedItem,
		getBadgeInfos = var9.getCachedItems,
		updateBadges = var8.updateItems,
		removeBadge = if fFlagLuaAppSduiBadgeDetailsComponents then function(p0) --[[ line: 39 | named "removeBadge" ]]
			-- upvalues: signalsModule (copy), var8 (ref), requestRemoveBadgeModule (copy), logResponseError (copy), badgesUrlBuilderModule (copy), discoveryEventErrorLogger (copy)
			local var10, var11 = signalsModule.createSignal(nil)
			local var12 = var8.getItem(p0).data(false)
			local var13 = if var12 then var12.isEarnedByUser else nil
			
			if var13 == true then
				var8.updateItem(p0, { isEarnedByUser = false })
			end
			requestRemoveBadgeModule(p0):andThen(function() --[[ line: 58 ]]
				-- upvalues: var11 (ref)
				var11({ type = "success" })
			end):catch(function(p1) --[[ line: 63 ]]
				-- upvalues: var12 (ref), var8 (copy), p0 (ref), var13 (ref), var11 (ref), logResponseError (copy), badgesUrlBuilderModule (copy), discoveryEventErrorLogger (copy)
				if var12 then
					var8.updateItem(p0, { isEarnedByUser = var13 })
				end
				local var14 = if type(p1) == "table" and p1.StatusCode then p1.StatusCode else nil
				local var15 = if type(p1) == "table" and p1.StatusMessage then p1.StatusMessage elseif type(p1) == "string" then p1 else nil
				var11({
					type = "error",
					errorType = "NetworkError",
					statusCode = var14,
					statusMessage = var15
				})
				logResponseError(badgesUrlBuilderModule.BADGE_REMOVE_URL, { StatusCode = var14 })
				discoveryEventErrorLogger.reportError("removeBadge", "Error removing badge", {
					method = "DELETE",
					badgeId = p0,
					statusCode = var14,
					statusMessage = var15
				})
			end)
			
			return var10
		end else nil,
		clear = var9.clear,
		dispose = var9.dispose
	}
end