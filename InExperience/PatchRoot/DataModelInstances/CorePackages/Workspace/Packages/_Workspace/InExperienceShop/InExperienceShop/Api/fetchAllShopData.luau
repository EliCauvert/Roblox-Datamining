local httpService = game:GetService("HttpService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)
local fetchShopItemIdsModule = require(script.Parent.fetchShopItemIds)
local multiGetProductInfoModule = require(script.Parent.multiGetProductInfo)
local buildShopDataFromWidgetsModule = require(script.Parent.buildShopDataFromWidgets)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)

return function()
	-- upvalues: httpService (ref), shopDebugLoggerModule (ref), fetchShopItemIdsModule (ref), buildShopDataFromWidgetsModule (ref), multiGetProductInfoModule (ref)
	local var1 = httpService:GenerateGUID(false)
	local var2 = shopDebugLoggerModule.startTimer()
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: var1 (ref)
		return "fetchAllShopData: start requestId=" .. var6
	end)
	
	return shopDebugLoggerModule.tracePromise(fetchShopItemIdsModule(var1):andThen(function(p1)
		-- upvalues: buildShopDataFromWidgetsModule (copy), multiGetProductInfoModule (copy)
		return buildShopDataFromWidgetsModule(p1, multiGetProductInfoModule)
	end), {
		onSuccess = function(p1)
			-- upvalues: shopDebugLoggerModule (copy), var1 (ref), var2 (ref)
			shopDebugLoggerModule.logElapsedLazy(function()
				-- upvalues: var1 (copy)
				return "fetchAllShopData: success requestId=" .. var6
			end, var2)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p1 (ref)
				return "fetchAllShopData: result categories=" .. #p1.categories .. " sections=" .. #p1.sections .. " failedItems=" .. #(p1.failedItems or {})
			end)
		end,
		onError = function(p1)
			-- upvalues: shopDebugLoggerModule (copy), var1 (ref), var2 (ref)
			shopDebugLoggerModule.logElapsedLazy(function()
				-- upvalues: var1 (copy)
				return "fetchAllShopData: error requestId=" .. var6
			end, var2)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p1 (ref)
				return "fetchAllShopData: error kind=" .. tostring(p1 and p1.kind) .. " msg=" .. tostring(p1 and p1.message)
			end)
		end
	})
end