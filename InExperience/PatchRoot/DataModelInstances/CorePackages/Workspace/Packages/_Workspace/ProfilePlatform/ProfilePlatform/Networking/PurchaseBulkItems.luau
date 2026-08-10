local httpService = game:GetService("HttpService")
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local httpModule = require(parent.Http)
local myRoduxNetworkingImplModule = require(profilePlatform.Networking.myRoduxNetworkingImpl)
local purchasePromptLiteModule = require(parent.PurchasePromptLite)
local fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module = require(profilePlatform.Flags.FFlagSocialEnableProfileInspectAndBuyAnalyticsV2)
local apis_url = `{httpModule.Url.APIS_URL}cloud/v2/avatar-marketplace-orders`

return function(p0) --[[ line: 25 | named "PurchaseBulkItems" ]]
	-- upvalues: httpService (ref), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (ref), purchasePromptLiteModule (ref), apis_url (ref), myRoduxNetworkingImplModule (ref)
	return myRoduxNetworkingImplModule(`{apis_url}?idempotencyKey.key={httpService:GenerateGUID(false)}`, "POST", {
		postBody = httpService:JSONEncode({
			purchasingUser = `users/{p0.userId}`,
			context = {
				productSurface = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then purchasePromptLiteModule.Enums.ProductPurchaseSurface.Profile else "MARKETPLACE_UA"
			},
			fulfillmentGroups = { { strategy = "BEST_EFFORT", lineItems = p0.lineItems } }
		})
	})
end