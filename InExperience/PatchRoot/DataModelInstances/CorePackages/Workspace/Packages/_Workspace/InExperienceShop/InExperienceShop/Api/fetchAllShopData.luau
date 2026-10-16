local HttpService = game:GetService("HttpService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(InExperienceShop.Parent.Promise)
local _ = require(InExperienceShop.Types)
local FetchShopItemIdsModule = require(script.Parent.fetchShopItemIds)
local MultiGetProductInfoModule = require(script.Parent.multiGetProductInfo)
local BuildShopDataFromWidgetsModule = require(script.Parent.buildShopDataFromWidgets)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)

return function() --[[ Line: 28 | Named "fetchAllShopData" ]]
	-- upvalues: HttpService (copy), ShopDebugLoggerModule (copy), FetchShopItemIdsModule (copy), BuildShopDataFromWidgetsModule (copy), MultiGetProductInfoModule (copy)
	local Guid = HttpService:GenerateGUID(false)
	local StartTimerResult = ShopDebugLoggerModule.startTimer()
	ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 36 ]]
		-- upvalues: Guid (copy)
		return "fetchAllShopData: start requestId=" .. Guid
	end)
	
	return ShopDebugLoggerModule.tracePromise(FetchShopItemIdsModule(Guid):andThen(function(Result) --[[ Line: 39 ]]
		-- upvalues: BuildShopDataFromWidgetsModule (upval), MultiGetProductInfoModule (upval)
		return BuildShopDataFromWidgetsModule(Result, MultiGetProductInfoModule)
	end), {
		onSuccess = function(p1) --[[ Line: 43 ]]
			-- upvalues: ShopDebugLoggerModule (upval), Guid (copy), StartTimerResult (copy)
			ShopDebugLoggerModule.logElapsedLazy(function(): string --[[ Line: 44 ]]
				-- upvalues: Guid (upval)
				return "fetchAllShopData: success requestId=" .. Guid
			end, StartTimerResult)
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 47 ]]
				-- upvalues: p1 (copy)
				return "fetchAllShopData: result categories=" .. #p1.categories .. " sections=" .. #p1.sections .. " failedItems=" .. #(p1.failedItems or {})
			end)
		end,
		onError = function(p1) --[[ Line: 56 ]]
			-- upvalues: ShopDebugLoggerModule (upval), Guid (copy), StartTimerResult (copy)
			ShopDebugLoggerModule.logElapsedLazy(function(): string --[[ Line: 57 ]]
				-- upvalues: Guid (upval)
				return "fetchAllShopData: error requestId=" .. Guid
			end, StartTimerResult)
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 60 ]]
				-- upvalues: p1 (copy)
				return "fetchAllShopData: error kind=" .. tostring(p1 and p1.kind) .. " msg=" .. tostring(p1 and p1.message)
			end)
		end
	})
end