local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local PromiseModule = require(Parent.Promise)
local GetRobloxSubscriptionProductsModelModule = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local _ = require(Parent.LuauPolyfill)
local ConstantsModule = require(RobloxSubscriptionPurchaseApp.Constants)
local MarketplaceService = game:GetService("MarketplaceService")

return function() --[[ Line: 15 ]]
	-- upvalues: PromiseModule (copy), MarketplaceService (copy), ConstantsModule (copy), GetRobloxSubscriptionProductsModelModule (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 16 ]]
		-- upvalues: MarketplaceService (upval), ConstantsModule (upval), GetRobloxSubscriptionProductsModelModule (upval)
		local Success, Result = pcall(function() --[[ Line: 17 ]]
			-- upvalues: MarketplaceService (upval), ConstantsModule (upval)
			return MarketplaceService:GetAvailableSubscriptionProductsAsync(ConstantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE)
		end)
		
		if Success then
			Callback((GetRobloxSubscriptionProductsModelModule.format(Result or {})))
			
			return
		else
			Callback1((tostring(Result)))
		end
	end)
end