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
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), signalsModule (ref), requestRemoveBadgeModule (ref), logResponseError (ref), badgesUrlBuilderModule (ref), discoveryEventErrorLogger (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		cache = var1,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	return {
		getBadgeInfo = var2.getCachedItem,
		getBadgeInfos = var2.getCachedItems,
		updateBadges = var1.updateItems,
		removeBadge = function(p1)
			-- upvalues: signalsModule (copy), var1 (ref), requestRemoveBadgeModule (copy), logResponseError (copy), badgesUrlBuilderModule (copy), discoveryEventErrorLogger (copy)
			local var3, var4 = signalsModule.createSignal(nil)
			local var5 = var1.getItem(p1).data(false)
			local var6 = if var5 then var5.isEarnedByUser else nil
			
			if var6 == true then
				var1.updateItem(p1, { isEarnedByUser = false })
			end
			requestRemoveBadgeModule(p1):andThen(function()
				-- upvalues: var4 (ref)
				var4({ type = "success" })
			end):catch(function(p2)
				-- upvalues: var5 (ref), var1 (copy), p1 (ref), var6 (ref), var4 (ref), logResponseError (copy), badgesUrlBuilderModule (copy), discoveryEventErrorLogger (copy)
				if var5 then
					var1.updateItem(p1, { isEarnedByUser = var6 })
				end
				local var7 = if type(p2) == "table" and p2.StatusCode then p2.StatusCode else nil
				local var8 = if type(p2) == "table" and p2.StatusMessage then p2.StatusMessage elseif type(p2) == "string" then p2 else nil
				var4({
					type = "error",
					errorType = "NetworkError",
					statusCode = var7,
					statusMessage = var8
				})
				logResponseError(badgesUrlBuilderModule.BADGE_REMOVE_URL, { StatusCode = var7 })
				discoveryEventErrorLogger.reportError("removeBadge", "Error removing badge", {
					method = "DELETE",
					badgeId = p1,
					statusCode = var7,
					statusMessage = var8
				})
			end)
			
			return var3
		end,
		clear = var2.clear,
		dispose = var2.dispose
	}
end