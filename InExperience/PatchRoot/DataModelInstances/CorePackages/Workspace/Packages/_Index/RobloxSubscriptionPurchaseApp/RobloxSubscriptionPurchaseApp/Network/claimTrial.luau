local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local promiseModule = require(parent.Promise)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local constantsModule = require(robloxSubscriptionPurchaseApp.Constants)
local httpRequestModule = require(script.Parent.HttpRequest)
local _ = require(robloxSubscriptionPurchaseApp.Enums.SubscriptionGrantType)
local ROBLOX_SUBSCRIPTION_PRODUCT_TYPE = constantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE
local var1 = urlBuilder.new({
	path = "subscriptions/v2/products",
	base = urlBase.APIS,
	query = {
		{
			name = "productType",
			optional = false,
			value = ROBLOX_SUBSCRIPTION_PRODUCT_TYPE
		},
		{
			name = "includePurchased",
			value = "false",
			optional = false
		},
		{
			name = "grantType",
			value = "{grantType}",
			optional = false
		}
	}
})
local var2 = urlBuilder.new({
	base = urlBase.APIS,
	path = "subscriptions/v2/products/" .. ROBLOX_SUBSCRIPTION_PRODUCT_TYPE .. "/{productId}/claim",
	query = {
		{
			name = "grantType",
			value = "{grantType}",
			optional = false
		}
	}
})

return function(p1)
	-- upvalues: httpRequestModule (ref), var1 (ref), promiseModule (ref), var2 (ref)
	local var3 = httpRequestModule.new()
	
	return var3:get(var1({ grantType = p1 })):andThen(function(p2)
		-- upvalues: promiseModule (copy), var2 (copy), p1 (ref), var3 (ref)
		local var4 = p2 and (p2.products and p2.products[1])
		local id = var4 and (var4.productKey and var4.productKey.id)
		
		return if id and id ~= "" then var3:post(var2({ productId = id, grantType = p1 }), {}) else promiseModule.reject("No eligible trial product found")
	end)
end