local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local FFlagAXCatalogOffersBannerEnabled = require(AvatarExperienceCatalog.Parent.AvatarExperienceFlags).FFlagAXCatalogOffersBannerEnabled
local CreateAXShoppingCartStoreModule = require(AvatarExperienceCatalog.Stores.createAXShoppingCartStore)
local CreateCatalogOffersBannerStoreModule = require(AvatarExperienceCatalog.Stores.createCatalogOffersBannerStore)

return function() --[[ Line: 21 | Named "getCatalogStores" ]]
	-- upvalues: CreateAXShoppingCartStoreModule (copy), FFlagAXCatalogOffersBannerEnabled (copy), CreateCatalogOffersBannerStoreModule (copy)
	return {
		shoppingCartStore = CreateAXShoppingCartStoreModule(),
		catalogOffersBannerStore = if FFlagAXCatalogOffersBannerEnabled then CreateCatalogOffersBannerStoreModule() else nil
	}
end