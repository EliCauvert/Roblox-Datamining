local playersService = game:GetService("Players")
local marketplaceService = game:GetService("MarketplaceService")
local readHasRobloxSubscriptionLuaEngineFeature = game:GetEngineFeature("ReadHasRobloxSubscriptionLua")
local enablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature = game:GetEngineFeature("EnablePromptSignalRobloxSubscriptionPurchaseFinished")

return function()
	-- upvalues: readHasRobloxSubscriptionLuaEngineFeature (ref), playersService (ref), enablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature (ref), marketplaceService (ref)
	local var4 = false
	
	if readHasRobloxSubscriptionLuaEngineFeature then
		local ok, status = pcall(function()
			-- upvalues: playersService (copy)
			return playersService.LocalPlayer.HasRobloxSubscription
		end)
		var4 = ok and status == true
	end
	return if var4 or not enablePromptSignalRobloxSubscriptionPurchaseFinishedEngineFeature then nil else function()
		-- upvalues: marketplaceService (copy)
		marketplaceService:signalPromptRobloxSubscriptionPurchaseFinished(" ", true)
	end
end