local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local HttpService = game:GetService("HttpService")
local Parent = AvatarExperienceCatalog.Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.LuauPolyfill)
local MakeAXResponseHandlerModule = require(AvatarExperienceCatalog.Utils.makeAXResponseHandler)
local NormalizeCartPricingForOffersResponseModule = require(script.Parent.normalizeCartPricingForOffersResponse)
local _ = require(script.Parent.CartPricingForOffersTypes)
local ConstantsModule = require(script.Parent.constants)

return function(Callback, Input) --[[ Line: 31 | Named "postCartPricingForOffers" ]]
	-- upvalues: Url (copy), ConstantsModule (copy), HttpService (copy), MakeAXResponseHandlerModule (copy), NormalizeCartPricingForOffersResponseModule (copy)
	local POST, POST2 = Callback(`{Url.APIS_URL}{ConstantsModule.CART_PRICING_URL}`, "POST", { postBody = HttpService:JSONEncode(Input) })
	
	return MakeAXResponseHandlerModule(POST, NormalizeCartPricingForOffersResponseModule, {
		modelMismatchCounter = ConstantsModule.POST_CART_PRICING_FOR_OFFERS_MODEL_MISMATCH_COUNTER_NAME,
		latencyCounter = ConstantsModule.POST_CART_PRICING_FOR_OFFERS_LATENCY_COUNTER_NAME
	}), POST2
end