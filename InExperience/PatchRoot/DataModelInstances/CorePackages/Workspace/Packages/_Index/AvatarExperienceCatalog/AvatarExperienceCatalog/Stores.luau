local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local fFlagAXCatalogOffersBannerEnabled = require(avatarExperienceCatalog.Parent.AvatarExperienceFlags).FFlagAXCatalogOffersBannerEnabled
local createAXShoppingCartStoreModule = require(avatarExperienceCatalog.Stores.createAXShoppingCartStore)
local createCatalogOffersBannerStoreModule = require(avatarExperienceCatalog.Stores.createCatalogOffersBannerStore)

return function()
	-- upvalues: createAXShoppingCartStoreModule (ref), fFlagAXCatalogOffersBannerEnabled (ref), createCatalogOffersBannerStoreModule (ref)
	return {
		shoppingCartStore = createAXShoppingCartStoreModule(),
		catalogOffersBannerStore = if fFlagAXCatalogOffersBannerEnabled then createCatalogOffersBannerStoreModule() else nil
	}
end