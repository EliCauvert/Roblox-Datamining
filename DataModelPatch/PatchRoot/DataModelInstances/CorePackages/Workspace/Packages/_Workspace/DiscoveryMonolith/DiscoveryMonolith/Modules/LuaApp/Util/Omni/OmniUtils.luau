local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local OmniRecommendationsContentType = require(Parent.DiscoveryTypes).OmniRecommendationsContentType
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer

return {
	storeForContentType = function(p1, CatalogAsset)
		-- upvalues: OmniRecommendationsContentType (copy), GameInfosReducer (copy)
		return if CatalogAsset == OmniRecommendationsContentType.Game then p1.Personalization[GameInfosReducer.key] elseif CatalogAsset == OmniRecommendationsContentType.GameCoPlay then p1.GameCoPlay elseif CatalogAsset == OmniRecommendationsContentType.CatalogAsset then p1.CatalogAssets elseif CatalogAsset == OmniRecommendationsContentType.CatalogBundle then p1.CatalogBundles else nil
	end
}