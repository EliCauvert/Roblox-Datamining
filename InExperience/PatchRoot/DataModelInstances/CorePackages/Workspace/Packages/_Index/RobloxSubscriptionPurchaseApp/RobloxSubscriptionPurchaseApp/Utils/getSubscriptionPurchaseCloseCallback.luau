local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local ReadHasRobloxSubscriptionLuaEngineFeature = game:GetEngineFeature("ReadHasRobloxSubscriptionLua")
local EnablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature = game:GetEngineFeature("EnablePromptSignalRobloxSubscriptionPurchaseFinished")

return function() --[[ Line: 8 | Named "getSubscriptionPurchaseCloseCallback" ]]
	-- upvalues: ReadHasRobloxSubscriptionLuaEngineFeature (copy), Players (copy), EnablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature (copy), MarketplaceService (copy)
	local v1 = false
	
	if ReadHasRobloxSubscriptionLuaEngineFeature then
		local Success, Result = pcall(function() --[[ Line: 11 ]]
			-- upvalues: Players (upval)
			return Players.LocalPlayer.HasRobloxSubscription
		end)
		
		if Success then
			Success = Result == true
		end
		v1 = Success
	end
	return if v1 or not EnablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature then nil else function() --[[ Line: 18 ]]
		-- upvalues: MarketplaceService (upval)
		MarketplaceService:signalPromptRobloxSubscriptionPurchaseFinished(" ", true)
	end
end