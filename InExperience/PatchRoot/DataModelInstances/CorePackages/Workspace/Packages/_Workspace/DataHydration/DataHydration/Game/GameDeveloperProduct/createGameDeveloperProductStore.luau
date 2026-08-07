local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local fFlagSduiDevStoreSeeAllSupport = require(parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.GameDeveloperProductStoreTypes)
local fetchGameDeveloperProductStatusesModule = require(script.Parent.fetchGameDeveloperProductStatuses)

local function _(p0, p1) --[[ line: 27 | named "buildStatusesKey" ]]
	return p0 .. "|" .. p1
end

return function() --[[ line: 31 | named "createGameDeveloperProductStore" ]]
	-- upvalues: createDataCacheModule (ref), fFlagSduiDevStoreSeeAllSupport (ref), createDataResolverModule (ref), logResponseError (ref), discoveryEventErrorLogger (ref), promiseModule (ref), fetchGameDeveloperProductStatusesModule (ref)
	local var6 = createDataCacheModule()
	local var7 = nil
	local var8 = nil
	
	if fFlagSduiDevStoreSeeAllSupport then
		var7 = createDataCacheModule()
		var8 = createDataResolverModule({
			supportsMultiGet = false,
			cache = var7,
			logError = function(p2) --[[ line: 41 ]]
				-- upvalues: logResponseError (copy), discoveryEventErrorLogger (copy)
				logResponseError("developer-products/v1/game-transactions", {
					StatusCode = if type(p2) == "table" and p2.StatusCode then p2.StatusCode else nil
				})
				discoveryEventErrorLogger.reportError("GameDeveloperProductStore", "Failed to fetch developer product statuses", { err = tostring(p2) })
			end,
			fetchFn = function(p3, p4) --[[ line: 50 ]]
				-- upvalues: promiseModule (copy), fetchGameDeveloperProductStatusesModule (copy), var6 (ref)
				local match, match_1 = string.match(p3, "^(.-)|(.+)$")
				
				return if match == nil or match_1 == nil then promiseModule.reject("Invalid developer product statuses key: " .. tostring(p3)) else fetchGameDeveloperProductStatusesModule.fetch(match, match_1):andThen(function(p5) --[[ line: 57 ]]
					-- upvalues: p4 (ref), var6 (copy)
					local t = {}
					
					for i, v in p5.counts do
						t[i] = { pendingReceiptCount = v }
					end
					local var12 = p4 and p4.data(false)
					
					if var12 and var12.counts then
						for i_1 in var12.counts do
							if p5.counts[i_1] == nil then
								t[i_1] = { pendingReceiptCount = 0 }
							end
						end
					end
					if next(t) ~= nil then
						var6.updateItems(t)
					end
					return p5
				end)
			end
		})
	end
	return {
		getGameDeveloperProductInfo = var6.getItem,
		updateGameDeveloperProductInfos = var6.updateItems,
		fetchStatuses = function(p6, p7) --[[ line: 102 ]]
			-- upvalues: var8 (write)
			if var8 then
				var8.fetchItem(p6 .. "|" .. p7)
			end
		end,
		clear = function() --[[ line: 82 ]]
			-- upvalues: var7 (write), var8 (write), var6 (ref)
			if var7 then
				var7.clear()
			end
			if var8 then
				var8.clear()
			end
			var6.clear()
		end,
		dispose = function() --[[ line: 92 ]]
			-- upvalues: var8 (write), var6 (ref)
			if var8 then
				var8.dispose()
			end
			var6.dispose()
		end
	}
end