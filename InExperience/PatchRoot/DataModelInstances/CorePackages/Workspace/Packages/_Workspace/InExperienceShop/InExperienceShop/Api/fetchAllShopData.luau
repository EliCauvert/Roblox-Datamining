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
	local var6 = httpService:GenerateGUID(false)
	local var7 = shopDebugLoggerModule.startTimer()
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: var6 (ref)
		return "fetchAllShopData: start requestId=" .. var6
	end)
	
	return shopDebugLoggerModule.tracePromise(fetchShopItemIdsModule(var6):andThen(function(p0)
		-- upvalues: buildShopDataFromWidgetsModule (copy), multiGetProductInfoModule (copy)
		return buildShopDataFromWidgetsModule(p0, multiGetProductInfoModule)
	end), {
		onSuccess = function(p1)
			-- upvalues: shopDebugLoggerModule (copy), var6 (ref), var7 (ref)
			shopDebugLoggerModule.logElapsedLazy(function()
				-- upvalues: var6 (copy)
				return "fetchAllShopData: success requestId=" .. var6
			end, var7)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p1 (ref)
				return "fetchAllShopData: result categories=" .. #p1.categories .. " sections=" .. #p1.sections .. " failedItems=" .. #(p1.failedItems or {})
			end)
		end,
		onError = function(p2)
			-- upvalues: shopDebugLoggerModule (copy), var6 (ref), var7 (ref)
			shopDebugLoggerModule.logElapsedLazy(function()
				-- upvalues: var6 (copy)
				return "fetchAllShopData: error requestId=" .. var6
			end, var7)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p2 (ref)
				return "fetchAllShopData: error kind=" .. tostring(p2 and p2.kind) .. " msg=" .. tostring(p2 and p2.message)
			end)
		end
	})
end