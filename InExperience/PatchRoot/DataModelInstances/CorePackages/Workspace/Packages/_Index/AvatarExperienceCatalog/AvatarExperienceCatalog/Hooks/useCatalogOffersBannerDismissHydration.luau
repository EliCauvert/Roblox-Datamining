local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local reactModule = require(avatarExperienceCatalog.Parent.React)
local _ = require(avatarExperienceCatalog.Api.GetMarketplaceOffersBanner.MarketplaceOffersBannerTypes)
local _ = require(avatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local catalogOffersBannerAppStorageModule = require(avatarExperienceCatalog.Utils.catalogOffersBannerAppStorage)

return function(p1, p2)
	-- upvalues: reactModule (ref), catalogOffersBannerAppStorageModule (ref)
	reactModule.useLayoutEffect(function()
		-- upvalues: p2 (ref), catalogOffersBannerAppStorageModule (copy), p1 (ref)
		if p2 == nil then return end
		if catalogOffersBannerAppStorageModule.shouldHydrateDismissed(p2) then
			p1.setDismissed(true)
			
			return
		end
		p1.setDismissed(false)
	end, { p2, p1 })
end