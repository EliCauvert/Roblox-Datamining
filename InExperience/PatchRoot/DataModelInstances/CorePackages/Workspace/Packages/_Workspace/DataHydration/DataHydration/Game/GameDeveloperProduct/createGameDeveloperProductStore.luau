local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiDevStoreSeeAllSupport = sharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local fFlagEnableHomeGameItemOwnershipUpdate = sharedFlagsModule.FFlagEnableHomeGameItemOwnershipUpdate
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.GameDeveloperProductStoreTypes)
local fetchGameDeveloperProductStatusesModule = require(script.Parent.fetchGameDeveloperProductStatuses)
local fFlagLuaAppUseGameTransactionsApiForReceipts = sharedFlagsModule.FFlagLuaAppUseGameTransactionsApiForReceipts

local function _(p0, p1) --[[ line: 30 | named "buildStatusesKey" ]]
	return p0 .. "|" .. p1
end

return function() --[[ line: 34 | named "createGameDeveloperProductStore" ]]
	-- upvalues: createDataCacheModule (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagEnableHomeGameItemOwnershipUpdate (ref), createDataResolverModule (ref), logResponseError (ref), fFlagLuaAppUseGameTransactionsApiForReceipts (ref), discoveryEventErrorLogger (ref), promiseModule (ref), fetchGameDeveloperProductStatusesModule (ref)
	local var7 = createDataCacheModule()
	local var8 = nil
	local var9 = nil
	
	if fFlagSduiDevStoreSeeAllSupport or fFlagEnableHomeGameItemOwnershipUpdate then
		var8 = createDataCacheModule()
		var9 = createDataResolverModule({
			supportsMultiGet = false,
			cache = var8,
			logError = function(p2) --[[ line: 44 ]]
				-- upvalues: logResponseError (copy), fFlagLuaAppUseGameTransactionsApiForReceipts (copy), discoveryEventErrorLogger (copy)
				logResponseError(if fFlagLuaAppUseGameTransactionsApiForReceipts then "game-transactions/v1/receipts" else "developer-products/v1/game-transactions", {
					StatusCode = if type(p2) == "table" and p2.StatusCode then p2.StatusCode else nil
				})
				discoveryEventErrorLogger.reportError("GameDeveloperProductStore", "Failed to fetch developer product statuses", { err = tostring(p2) })
			end,
			fetchFn = function(p3, p4) --[[ line: 58 ]]
				-- upvalues: promiseModule (copy), fetchGameDeveloperProductStatusesModule (copy), var7 (ref)
				local match, match_1 = string.match(p3, "^(.-)|(.+)$")
				
				return if match == nil or match_1 == nil then promiseModule.reject("Invalid developer product statuses key: " .. tostring(p3)) else fetchGameDeveloperProductStatusesModule.fetch(match, match_1):andThen(function(p5) --[[ line: 65 ]]
					-- upvalues: p4 (ref), var7 (copy)
					local t = {}
					
					for i, v in p5.counts do
						t[i] = { pendingReceiptCount = v }
					end
					local var13 = p4 and p4.data(false)
					
					if var13 and var13.counts then
						for i_1 in var13.counts do
							if p5.counts[i_1] == nil then
								t[i_1] = { pendingReceiptCount = 0 }
							end
						end
					end
					if next(t) ~= nil then
						var7.updateItems(t)
					end
					return p5
				end)
			end
		})
	end
	return {
		getGameDeveloperProductInfo = var7.getItem,
		updateGameDeveloperProductInfos = var7.updateItems,
		fetchStatuses = function(p6, p7) --[[ line: 110 ]]
			-- upvalues: var9 (write)
			if var9 then
				var9.fetchItem(p6 .. "|" .. p7)
			end
		end,
		clear = function() --[[ line: 90 ]]
			-- upvalues: var8 (write), var9 (write), var7 (ref)
			if var8 then
				var8.clear()
			end
			if var9 then
				var9.clear()
			end
			var7.clear()
		end,
		dispose = function() --[[ line: 100 ]]
			-- upvalues: var9 (write), var7 (ref)
			if var9 then
				var9.dispose()
			end
			var7.dispose()
		end
	}
end