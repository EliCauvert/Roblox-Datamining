local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local catalogOffersBannerViewModule = require(script.Parent.CatalogOffersBannerView)
local useCatalogOffersBannerViewModelModule = require(script.Parent.useCatalogOffersBannerViewModel)

return function(p1)
	-- upvalues: useCatalogOffersBannerViewModelModule (ref), reactModule (ref), catalogOffersBannerViewModule (ref)
	local var1 = useCatalogOffersBannerViewModelModule({
		Size = p1.Size,
		Position = p1.Position,
		onBannerVisibleChanged = p1.onOffersBannerVisibleChanged
	})
	
	return if var1.status == "hidden" then nil elseif var1.modals then reactModule.createElement(reactModule.Fragment, nil, {
		Banner = reactModule.createElement(catalogOffersBannerViewModule, var1.viewProps),
		Modals = var1.modals
	}) else reactModule.createElement(catalogOffersBannerViewModule, var1.viewProps)
end