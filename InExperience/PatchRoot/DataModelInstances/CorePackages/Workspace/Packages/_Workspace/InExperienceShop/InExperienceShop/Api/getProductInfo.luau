local MarketplaceService = game:GetService("MarketplaceService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local PromiseModule = require(InExperienceShop.Parent.Promise)
local ErrorsModule = require(script.Parent.Errors)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)

return function(AssetId, InfoType) --[[ Line: 18 | Named "getProductInfo" ]]
	-- upvalues: PromiseModule (copy), ShopDebugLoggerModule (copy), MarketplaceService (copy), ErrorsModule (copy)
	return PromiseModule.new(function(Callback, Callback1) --[[ Line: 19 ]]
		-- upvalues: ShopDebugLoggerModule (upval), AssetId (copy), InfoType (copy), MarketplaceService (upval), ErrorsModule (upval)
		task.spawn(function() --[[ Line: 20 ]]
			-- upvalues: ShopDebugLoggerModule (upval), AssetId (upval), InfoType (upval), MarketplaceService (upval), Callback (copy), Callback1 (copy), ErrorsModule (upval)
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 21 ]]
				-- upvalues: AssetId (upval), InfoType (upval)
				return "getProductInfo: call id=" .. AssetId .. " infoType=" .. tostring(InfoType)
			end)
			local StartTimerResult = ShopDebugLoggerModule.startTimer()
			local Success, Result = pcall(function() --[[ Line: 25 ]]
				-- upvalues: MarketplaceService (upval), AssetId (upval), InfoType (upval)
				return MarketplaceService:GetProductInfoAsync(AssetId, InfoType)
			end)
			
			if Success then
				ShopDebugLoggerModule.logElapsedLazy(function(): string --[[ Line: 29 ]]
					-- upvalues: AssetId (upval)
					return "getProductInfo: success id=" .. AssetId
				end, StartTimerResult)
				Callback(Result)
				
				return
			else
				ShopDebugLoggerModule.logElapsedLazy(function(): string --[[ Line: 34 ]]
					-- upvalues: AssetId (upval)
					return "getProductInfo: error id=" .. AssetId
				end, StartTimerResult)
				ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 37 ]]
					-- upvalues: Result (copy)
					return "getProductInfo: error detail=" .. tostring(Result)
				end)
				Callback1(ErrorsModule.engineError("getProductInfo: GetProductInfoAsync raised", Result))
			end
		end)
	end)
end