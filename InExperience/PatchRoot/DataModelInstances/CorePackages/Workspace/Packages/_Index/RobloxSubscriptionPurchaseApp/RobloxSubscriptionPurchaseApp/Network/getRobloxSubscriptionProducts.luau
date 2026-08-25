local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local promiseModule = require(parent.Promise)
local getRobloxSubscriptionProductsModelModule = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local _ = require(parent.LuauPolyfill)
local constantsModule = require(robloxSubscriptionPurchaseApp.Constants)
local marketplaceService = game:GetService("MarketplaceService")

return function()
	-- upvalues: promiseModule (ref), marketplaceService (ref), constantsModule (ref), getRobloxSubscriptionProductsModelModule (ref)
	return promiseModule.new(function(p0, p1)
		-- upvalues: marketplaceService (copy), constantsModule (copy), getRobloxSubscriptionProductsModelModule (copy)
		local ok, status = pcall(function()
			-- upvalues: marketplaceService (copy), constantsModule (copy)
			return marketplaceService:GetAvailableSubscriptionProductsAsync(constantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE)
		end)
		
		if ok then
			p0(getRobloxSubscriptionProductsModelModule.format(status or {}))
			
			return
		end
		p1(tostring(status))
	end)
end