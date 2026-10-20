local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Url = require(RobloxSubscriptionPurchaseApp.Parent.Http).Url
local GetRobloxSubscriptionProductsModelModule = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local ConstantsModule = require(RobloxSubscriptionPurchaseApp.Constants)
local HttpRequestModule = require(script.Parent.HttpRequest)
local Text = Url.APIS_URL .. "subscriptions/v2/products?"

return function(p1)
	-- upvalues: Text (copy), Url (copy), ConstantsModule (copy), HttpRequestModule (copy), GetRobloxSubscriptionProductsModelModule (copy)
	return HttpRequestModule.new():get(Text .. Url:makeQueryString({
		includePurchased = "false",
		productType = ConstantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE,
		referrerId = tostring(p1 or 0)
	})):andThen(function(Result)
		-- upvalues: GetRobloxSubscriptionProductsModelModule (upval)
		return (GetRobloxSubscriptionProductsModelModule.formatFromRest(Result or {}))
	end)
end