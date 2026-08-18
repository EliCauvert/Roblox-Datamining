local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local reactModule = require(avatarExperienceCatalog.Parent.React)
local _ = require(avatarExperienceCatalog.Api.GetMarketplaceOffersBanner.MarketplaceOffersBannerTypes)
local _ = require(avatarExperienceCatalog.Stores.createCatalogOffersBannerStore)
local catalogOffersBannerAppStorageModule = require(avatarExperienceCatalog.Utils.catalogOffersBannerAppStorage)

return function(p0, p1) --[[ line: 18 | named "useCatalogOffersBannerDismissHydration" ]]
	-- upvalues: reactModule (ref), catalogOffersBannerAppStorageModule (ref)
	reactModule.useLayoutEffect(function() --[[ line: 22 ]]
		-- upvalues: p1 (ref), catalogOffersBannerAppStorageModule (copy), p0 (ref)
		if p1 == nil then return end
		if catalogOffersBannerAppStorageModule.shouldHydrateDismissed(p1) then
			p0.setDismissed(true)
			
			return
		end
		p0.setDismissed(false)
	end, { p1, p0 })
end