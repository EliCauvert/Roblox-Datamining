local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local FFlagSduiDevStoreSeeAllSupport = require(Parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.GameDeveloperProductStoreTypes)
local FetchGameDeveloperProductStatusesModule = require(script.Parent.fetchGameDeveloperProductStatuses)

local function _(Text, Text1): string
	return Text .. "|" .. Text1
end

return function()
	-- upvalues: CreateDataCacheModule (copy), FFlagSduiDevStoreSeeAllSupport (copy), CreateDataResolverModule (copy), LogResponseErrorFunction (copy), DiscoveryEventErrorLogger (copy), PromiseModule (copy), FetchGameDeveloperProductStatusesModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local Cache = nil
	local v1 = nil
	
	if FFlagSduiDevStoreSeeAllSupport then
		Cache = CreateDataCacheModule()
		v1 = CreateDataResolverModule({
			supportsMultiGet = false,
			cache = Cache,
			logError = function(p1)
				-- upvalues: LogResponseErrorFunction (upval), DiscoveryEventErrorLogger (upval)
				LogResponseErrorFunction("developer-products/v1/game-transactions", {
					StatusCode = if type(p1) == "table" and p1.StatusCode then p1.StatusCode else nil
				})
				DiscoveryEventErrorLogger.reportError("GameDeveloperProductStore", "Failed to fetch developer product statuses", { err = tostring(p1) })
			end,
			fetchFn = function(Text: string, p1)
				-- upvalues: PromiseModule (upval), FetchGameDeveloperProductStatusesModule (upval), DataCacheModule (copy)
				local Match, Match2 = string.match(Text, "^(.-)|(.+)$")
				
				return if Match == nil or Match2 == nil then PromiseModule.reject("Invalid developer product statuses key: " .. tostring(Text)) else FetchGameDeveloperProductStatusesModule.fetch(Match, Match2):andThen(function(Result)
					-- upvalues: p1 (copy), DataCacheModule (upval)
					local t = {}
					
					for i, count in Result.counts do
						t[i] = { pendingReceiptCount = count }
					end
					local DataResult = p1 and p1.data(false)
					
					if DataResult and DataResult.counts then
						for count1 in DataResult.counts do
							if Result.counts[count1] == nil then
								t[count1] = { pendingReceiptCount = 0 }
							end
						end
					end
					if next(t) ~= nil then
						DataCacheModule.updateItems(t)
					end
					return Result
				end)
			end
		})
	end
	return {
		getGameDeveloperProductInfo = DataCacheModule.getItem,
		updateGameDeveloperProductInfos = DataCacheModule.updateItems,
		fetchStatuses = function(Text, Text1)
			-- upvalues: v1 (ref)
			if v1 then
				v1.fetchItem(Text .. "|" .. Text1)
			end
		end,
		clear = function()
			-- upvalues: Cache (ref), v1 (ref), DataCacheModule (copy)
			if Cache then
				Cache.clear()
			end
			if v1 then
				v1.clear()
			end
			DataCacheModule.clear()
		end,
		dispose = function()
			-- upvalues: v1 (ref), DataCacheModule (copy)
			if v1 then
				v1.dispose()
			end
			DataCacheModule.dispose()
		end
	}
end