local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local SignalsModule = require(Parent.Signals)
local PromiseModule = require(Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.BadgesTypes)
local RequestRemoveBadgeModule = require(script.Parent.requestRemoveBadge)
local BadgesUrlBuilderModule = require(script.Parent.BadgesUrlBuilder)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), SignalsModule (copy), RequestRemoveBadgeModule (copy), LogResponseErrorFunction (copy), BadgesUrlBuilderModule (copy), DiscoveryEventErrorLogger (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	
	return {
		getBadgeInfo = DataResolverModule.getCachedItem,
		getBadgeInfos = DataResolverModule.getCachedItems,
		updateBadges = DataCacheModule.updateItems,
		removeBadge = function(BadgeId)
			-- upvalues: SignalsModule (upval), DataCacheModule (copy), RequestRemoveBadgeModule (upval), LogResponseErrorFunction (upval), BadgesUrlBuilderModule (upval), DiscoveryEventErrorLogger (upval)
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			local DataResult = DataCacheModule.getItem(BadgeId).data(false)
			local IsEarnedByUser = if DataResult then DataResult.isEarnedByUser else nil
			
			if IsEarnedByUser == true then
				DataCacheModule.updateItem(BadgeId, { isEarnedByUser = false })
			end
			RequestRemoveBadgeModule(BadgeId):andThen(function()
				-- upvalues: Signal2 (copy)
				Signal2({ type = "success" })
			end):catch(function(Err)
				-- upvalues: DataResult (copy), DataCacheModule (upval), BadgeId (copy), IsEarnedByUser (copy), Signal2 (copy), LogResponseErrorFunction (upval), BadgesUrlBuilderModule (upval), DiscoveryEventErrorLogger (upval)
				if DataResult then
					DataCacheModule.updateItem(BadgeId, { isEarnedByUser = IsEarnedByUser })
				end
				local StatusCode = if type(Err) == "table" and Err.StatusCode then Err.StatusCode else nil
				local StatusMessage = if type(Err) == "table" and Err.StatusMessage then Err.StatusMessage elseif type(Err) == "string" then Err else nil
				Signal2({
					type = "error",
					errorType = "NetworkError",
					statusCode = StatusCode,
					statusMessage = StatusMessage
				})
				LogResponseErrorFunction(BadgesUrlBuilderModule.BADGE_REMOVE_URL, { StatusCode = StatusCode })
				DiscoveryEventErrorLogger.reportError("removeBadge", "Error removing badge", {
					method = "DELETE",
					badgeId = BadgeId,
					statusCode = StatusCode,
					statusMessage = StatusMessage
				})
			end)
			
			return Signal
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end