local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.LuauPolyfill)
local MakeAXResponseHandlerModule = require(AvatarExperienceCatalog.Utils.makeAXResponseHandler)
local NormalizeMarketplaceOffersBannerResponseModule = require(script.Parent.normalizeMarketplaceOffersBannerResponse)
local _ = require(script.Parent.MarketplaceOffersBannerTypes)
local ConstantsModule = require(script.Parent.constants)

return {
	getMarketplaceOffersBanner = function(UserId, Callback, p1) --[[ Line: 20 ]]
		-- upvalues: ConstantsModule (copy), Url (copy), MakeAXResponseHandlerModule (copy), NormalizeMarketplaceOffersBannerResponseModule (copy)
		local GET, GET2 = Callback(`{Url.APIS_URL}{ConstantsModule.OFFERS_V1_RELATIVE_PATH}?{Url:makeQueryString({
			userId = UserId,
			featureKey = if p1 == "cart" then ConstantsModule.OFFERS_FOR_USER_FEATURE_KEY_CART else ConstantsModule.OFFERS_FOR_USER_FEATURE_KEY_FEED
		})}`, "GET")
		
		return MakeAXResponseHandlerModule(GET, NormalizeMarketplaceOffersBannerResponseModule, {
			modelMismatchCounter = ConstantsModule.FETCH_MARKETPLACE_OFFERS_BANNER_MODEL_MISMATCH_COUNTER_NAME,
			latencyCounter = ConstantsModule.FETCH_MARKETPLACE_OFFERS_BANNER_LATENCY_COUNTER_NAME
		}), GET2
	end
}