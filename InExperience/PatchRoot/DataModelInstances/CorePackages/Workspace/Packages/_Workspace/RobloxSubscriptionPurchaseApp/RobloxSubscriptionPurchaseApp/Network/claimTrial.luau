local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local PromiseModule = require(Parent.Promise)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local HttpRequestModule = require(script.Parent.HttpRequest)
local _ = require(RobloxSubscriptionPurchaseApp.Enums.SubscriptionGrantType)
local ROBLOXSUBSCRIPTIONPRODUCTTYPE = require(RobloxSubscriptionPurchaseApp.Constants).ROBLOX_SUBSCRIPTION_PRODUCT_TYPE
local NewUrlBuilder = UrlBuilder.new({
	path = "subscriptions/v2/products",
	base = UrlBase.APIS,
	query = {
		{
			name = "productType",
			optional = false,
			value = ROBLOXSUBSCRIPTIONPRODUCTTYPE
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
local NewUrlBuilder1 = UrlBuilder.new({
	base = UrlBase.APIS,
	path = "subscriptions/v2/products/" .. ROBLOXSUBSCRIPTIONPRODUCTTYPE .. "/{productId}/claim",
	query = {
		{
			name = "grantType",
			value = "{grantType}",
			optional = false
		}
	}
})

return function(GrantType)
	-- upvalues: HttpRequestModule (copy), NewUrlBuilder (copy), PromiseModule (copy), NewUrlBuilder1 (copy)
	local NewHttpRequest = HttpRequestModule.new()
	
	return NewHttpRequest:get((NewUrlBuilder({ grantType = GrantType }))):andThen(function(Result)
		-- upvalues: PromiseModule (upval), NewUrlBuilder1 (upval), GrantType (copy), NewHttpRequest (copy)
		local Product = Result and (Result.products and Result.products[1])
		local Id = Product and (Product.productKey and Product.productKey.id)
		
		return if Id and Id ~= "" then NewHttpRequest:post(NewUrlBuilder1({ productId = Id, grantType = GrantType }), {}) else PromiseModule.reject("No eligible trial product found")
	end)
end