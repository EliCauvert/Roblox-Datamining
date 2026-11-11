local HttpService = game:GetService("HttpService")
local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local MyRoduxNetworkingImplModule = require(ProfilePlatform.Networking.myRoduxNetworkingImpl)
local MarketplaceName: string = `{require(ProfilePlatform.Parent.Http).Url.APIS_URL}cloud/v2/avatar-marketplace-orders`

return function(p1)
	-- upvalues: HttpService (copy), MarketplaceName (copy), MyRoduxNetworkingImplModule (copy)
	return MyRoduxNetworkingImplModule(`{MarketplaceName}?idempotencyKey.key={HttpService:GenerateGUID(false)}`, "POST", {
		postBody = HttpService:JSONEncode({
			purchasingUser = `users/{p1.userId}`,
			context = { productSurface = "MARKETPLACE_UA" },
			fulfillmentGroups = { { strategy = "BEST_EFFORT", lineItems = p1.lineItems } }
		})
	})
end