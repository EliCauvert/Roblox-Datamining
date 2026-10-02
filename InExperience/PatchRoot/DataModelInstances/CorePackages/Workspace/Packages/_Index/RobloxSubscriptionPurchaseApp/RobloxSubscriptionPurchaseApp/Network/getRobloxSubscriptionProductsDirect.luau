local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local url = require(robloxSubscriptionPurchaseApp.Parent.Http).Url
local getRobloxSubscriptionProductsModelModule = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local constantsModule = require(robloxSubscriptionPurchaseApp.Constants)
local httpRequestModule = require(script.Parent.HttpRequest)
local text = url.APIS_URL .. "subscriptions/v2/products?"

return function(p1)
	-- upvalues: text (ref), url (ref), constantsModule (ref), httpRequestModule (ref), getRobloxSubscriptionProductsModelModule (ref)
	return httpRequestModule.new():get(text .. url:makeQueryString({
		includePurchased = "false",
		productType = constantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE,
		referrerId = tostring(p1 or 0)
	})):andThen(function(p2)
		-- upvalues: getRobloxSubscriptionProductsModelModule (copy)
		return getRobloxSubscriptionProductsModelModule.formatFromRest(p2 or {})
	end)
end