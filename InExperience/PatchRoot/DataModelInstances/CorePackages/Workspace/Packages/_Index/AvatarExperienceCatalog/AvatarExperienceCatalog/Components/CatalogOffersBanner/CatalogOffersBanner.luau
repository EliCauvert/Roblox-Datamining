local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local CatalogOffersBannerViewModule = require(script.Parent.CatalogOffersBannerView)
local UseCatalogOffersBannerViewModelModule = require(script.Parent.useCatalogOffersBannerViewModel)

return function(p1) --[[ Line: 17 | Named "CatalogOffersBanner" ]]
	-- upvalues: UseCatalogOffersBannerViewModelModule (copy), ReactModule (copy), CatalogOffersBannerViewModule (copy)
	local UseCatalogOffersBannerViewModelModuleResult = UseCatalogOffersBannerViewModelModule({
		Size = p1.Size,
		Position = p1.Position,
		onBannerVisibleChanged = p1.onOffersBannerVisibleChanged
	})
	
	return if UseCatalogOffersBannerViewModelModuleResult.status == "hidden" then nil elseif UseCatalogOffersBannerViewModelModuleResult.modals then ReactModule.createElement(ReactModule.Fragment, nil, {
		Banner = ReactModule.createElement(CatalogOffersBannerViewModule, UseCatalogOffersBannerViewModelModuleResult.viewProps),
		Modals = UseCatalogOffersBannerViewModelModuleResult.modals
	}) else ReactModule.createElement(CatalogOffersBannerViewModule, UseCatalogOffersBannerViewModelModuleResult.viewProps)
end