local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local Url = require(Parent.Http).Url
local HttpClientModule = require(Parent.HttpClient)
local AsPromiseFunction = HttpClientModule.asPromise
local CreateRequestFunction = HttpClientModule.createRequest
local CreateRequestInternalNetworkFunction = HttpClientModule.createRequestInternalNetwork
local DecodeJsonFunction = HttpClientModule.decodeJson
local EncodeRawFunction = HttpClientModule.encodeRaw
local GetShopPurchasePayloadModule = require(InExperienceShop.Utils.getShopPurchasePayload)

return {
	redeemGamePassTrial = function(p1)
		-- upvalues: CreateRequestFunction (copy), CreateRequestInternalNetworkFunction (copy), Url (copy), GetShopPurchasePayloadModule (copy), EncodeRawFunction (copy), DecodeJsonFunction (copy), AsPromiseFunction (copy)
		return AsPromiseFunction((CreateRequestFunction({
			method = "POST",
			analyticsKey = "game-passes.redeem-trial",
			networkImpl = CreateRequestInternalNetworkFunction(),
			url = `{Url.APIS_URL}game-passes/v1/game-passes/{p1}/trial:redeem`,
			body = GetShopPurchasePayloadModule(),
			headers = {},
			encode = EncodeRawFunction("application/json"),
			decode = DecodeJsonFunction(function(p2)
				return p2
			end)
		})))
	end
}