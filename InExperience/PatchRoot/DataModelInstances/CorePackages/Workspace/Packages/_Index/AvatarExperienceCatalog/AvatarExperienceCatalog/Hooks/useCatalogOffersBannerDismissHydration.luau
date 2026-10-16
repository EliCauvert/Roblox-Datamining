local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local ReactModule = require(AvatarExperienceCatalog.Parent.React)
local _ = require(AvatarExperienceCatalog.Api.GetMarketplaceOffersBanner.MarketplaceOffersBannerTypes)
local _ = require(AvatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local CatalogOffersBannerAppStorageModule = require(AvatarExperienceCatalog.Utils.catalogOffersBannerAppStorage)

return function(p1, p2) --[[ Line: 18 | Named "useCatalogOffersBannerDismissHydration" ]]
	-- upvalues: ReactModule (copy), CatalogOffersBannerAppStorageModule (copy)
	ReactModule.useLayoutEffect(function() --[[ Line: 22 ]]
		-- upvalues: p2 (copy), CatalogOffersBannerAppStorageModule (upval), p1 (copy)
		if p2 == nil then return end
		if CatalogOffersBannerAppStorageModule.shouldHydrateDismissed(p2) then
			p1.setDismissed(true)
			
			return
		else
			p1.setDismissed(false)
		end
	end, { p2, p1 })
end