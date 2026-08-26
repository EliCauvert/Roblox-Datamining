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

local function _(p1, p2)
	return p1 .. "|" .. p1
end

return function()
	-- upvalues: createDataCacheModule (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagEnableHomeGameItemOwnershipUpdate (ref), createDataResolverModule (ref), logResponseError (ref), fFlagLuaAppUseGameTransactionsApiForReceipts (ref), discoveryEventErrorLogger (ref), promiseModule (ref), fetchGameDeveloperProductStatusesModule (ref)
	local var1 = createDataCacheModule()
	local var2 = nil
	local var3 = nil
	
	if fFlagSduiDevStoreSeeAllSupport or fFlagEnableHomeGameItemOwnershipUpdate then
		var2 = createDataCacheModule()
		var3 = createDataResolverModule({
			supportsMultiGet = false,
			cache = var2,
			logError = function(p1)
				-- upvalues: logResponseError (copy), fFlagLuaAppUseGameTransactionsApiForReceipts (copy), discoveryEventErrorLogger (copy)
				logResponseError(if fFlagLuaAppUseGameTransactionsApiForReceipts then "game-transactions/v1/receipts" else "developer-products/v1/game-transactions", {
					StatusCode = if type(p1) == "table" and p1.StatusCode then p1.StatusCode else nil
				})
				discoveryEventErrorLogger.reportError("GameDeveloperProductStore", "Failed to fetch developer product statuses", { err = tostring(p1) })
			end,
			fetchFn = function(p1, p2)
				-- upvalues: promiseModule (copy), fetchGameDeveloperProductStatusesModule (copy), var1 (ref)
				local match, match_1 = string.match(p1, "^(.-)|(.+)$")
				
				return if match == nil or match_1 == nil then promiseModule.reject("Invalid developer product statuses key: " .. tostring(p1)) else fetchGameDeveloperProductStatusesModule.fetch(match, match_1):andThen(function(p3)
					-- upvalues: p2 (ref), var1 (copy)
					local t = {}
					
					for i, v in p3.counts do
						t[i] = { pendingReceiptCount = v }
					end
					local var4 = p2 and p2.data(false)
					
					if var4 and var4.counts then
						for i_1 in var4.counts do
							if p3.counts[i_1] == nil then
								t[i_1] = { pendingReceiptCount = 0 }
							end
						end
					end
					if next(t) ~= nil then
						var1.updateItems(t)
					end
					return p3
				end)
			end
		})
	end
	return {
		getGameDeveloperProductInfo = var1.getItem,
		updateGameDeveloperProductInfos = var1.updateItems,
		fetchStatuses = function(p3, p4)
			-- upvalues: var3 (write)
			if var3 then
				var3.fetchItem(p3 .. "|" .. p7)
			end
		end,
		clear = function()
			-- upvalues: var2 (write), var3 (write), var1 (ref)
			if var2 then
				var2.clear()
			end
			if var3 then
				var3.clear()
			end
			var1.clear()
		end,
		dispose = function()
			-- upvalues: var3 (write), var1 (ref)
			if var3 then
				var3.dispose()
			end
			var1.dispose()
		end
	}
end