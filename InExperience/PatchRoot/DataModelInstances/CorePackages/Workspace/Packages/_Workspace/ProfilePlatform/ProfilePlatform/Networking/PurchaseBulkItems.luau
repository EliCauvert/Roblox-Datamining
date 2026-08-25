local httpService = game:GetService("HttpService")
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local myRoduxNetworkingImplModule = require(profilePlatform.Networking.myRoduxNetworkingImpl)
local apis_url = `{require(profilePlatform.Parent.Http).Url.APIS_URL}cloud/v2/avatar-marketplace-orders`

return function(p0)
	-- upvalues: httpService (ref), apis_url (ref), myRoduxNetworkingImplModule (ref)
	return myRoduxNetworkingImplModule(`{apis_url}?idempotencyKey.key={httpService:GenerateGUID(false)}`, "POST", {
		postBody = httpService:JSONEncode({
			purchasingUser = `users/{p0.userId}`,
			context = { productSurface = "MARKETPLACE_UA" },
			fulfillmentGroups = { { strategy = "BEST_EFFORT", lineItems = p0.lineItems } }
		})
	})
end