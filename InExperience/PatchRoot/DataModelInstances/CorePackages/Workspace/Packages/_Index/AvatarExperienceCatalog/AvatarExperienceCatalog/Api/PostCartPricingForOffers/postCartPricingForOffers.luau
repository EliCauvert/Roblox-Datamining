local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local httpService = game:GetService("HttpService")
local parent = avatarExperienceCatalog.Parent
local url = require(parent.Http).Url
local _ = require(parent.LuauPolyfill)
local makeAXResponseHandlerModule = require(avatarExperienceCatalog.Utils.makeAXResponseHandler)
local normalizeCartPricingForOffersResponseModule = require(script.Parent.normalizeCartPricingForOffersResponse)
local _ = require(script.Parent.CartPricingForOffersTypes)
local constantsModule = require(script.Parent.constants)

return function(p1, p2)
	-- upvalues: url (ref), constantsModule (ref), httpService (ref), makeAXResponseHandlerModule (ref), normalizeCartPricingForOffersResponseModule (ref)
	local var1, var2 = p1(`{url.APIS_URL}{constantsModule.CART_PRICING_URL}`, "POST", { postBody = httpService:JSONEncode(p2) })
	
	return makeAXResponseHandlerModule(var1, normalizeCartPricingForOffersResponseModule, {
		modelMismatchCounter = constantsModule.POST_CART_PRICING_FOR_OFFERS_MODEL_MISMATCH_COUNTER_NAME,
		latencyCounter = constantsModule.POST_CART_PRICING_FOR_OFFERS_LATENCY_COUNTER_NAME
	}), var2
end