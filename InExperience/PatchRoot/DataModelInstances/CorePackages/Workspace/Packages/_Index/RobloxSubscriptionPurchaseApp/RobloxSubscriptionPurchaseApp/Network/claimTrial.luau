local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local promiseModule = require(parent.Promise)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local constantsModule = require(robloxSubscriptionPurchaseApp.Constants)
local httpRequestModule = require(script.Parent.HttpRequest)
local _ = require(robloxSubscriptionPurchaseApp.Enums.SubscriptionGrantType)
local ROBLOX_SUBSCRIPTION_PRODUCT_TYPE = constantsModule.ROBLOX_SUBSCRIPTION_PRODUCT_TYPE
local var4 = urlBuilder.new({
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
local var5 = urlBuilder.new({
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

return function(p0) --[[ line: 40 ]]
	-- upvalues: httpRequestModule (ref), var4 (ref), promiseModule (ref), var5 (ref)
	local var6 = httpRequestModule.new()
	
	return var6:get(var4({ grantType = p0 })):andThen(function(p1) --[[ line: 45 ]]
		-- upvalues: promiseModule (copy), var5 (copy), p0 (ref), var6 (ref)
		local var7 = p1 and (p1.products and p1.products[1])
		local id = var7 and (var7.productKey and var7.productKey.id)
		
		return if id and id ~= "" then var6:post(var5({ productId = id, grantType = p0 }), {}) else promiseModule.reject("No eligible trial product found")
	end)
end