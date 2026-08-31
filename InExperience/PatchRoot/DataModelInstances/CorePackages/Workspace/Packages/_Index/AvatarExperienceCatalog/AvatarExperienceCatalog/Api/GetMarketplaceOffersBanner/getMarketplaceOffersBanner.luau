local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local url = require(parent.Http).Url
local _ = require(parent.LuauPolyfill)
local makeAXResponseHandlerModule = require(avatarExperienceCatalog.Utils.makeAXResponseHandler)
local normalizeMarketplaceOffersBannerResponseModule = require(script.Parent.normalizeMarketplaceOffersBannerResponse)
local _ = require(script.Parent.MarketplaceOffersBannerTypes)
local constantsModule = require(script.Parent.constants)

return {
	getMarketplaceOffersBanner = function(p1, p2, p3)
		-- upvalues: constantsModule (ref), url (ref), makeAXResponseHandlerModule (ref), normalizeMarketplaceOffersBannerResponseModule (ref)
		local var1, var2 = p2(`{url.APIS_URL}{constantsModule.OFFERS_V1_RELATIVE_PATH}?{url:makeQueryString({
			userId = p1,
			featureKey = if p3 == "cart" then constantsModule.OFFERS_FOR_USER_FEATURE_KEY_CART else constantsModule.OFFERS_FOR_USER_FEATURE_KEY_FEED
		})}`, "GET")
		
		return makeAXResponseHandlerModule(var1, normalizeMarketplaceOffersBannerResponseModule, {
			modelMismatchCounter = constantsModule.FETCH_MARKETPLACE_OFFERS_BANNER_MODEL_MISMATCH_COUNTER_NAME,
			latencyCounter = constantsModule.FETCH_MARKETPLACE_OFFERS_BANNER_LATENCY_COUNTER_NAME
		}), var2
	end
}