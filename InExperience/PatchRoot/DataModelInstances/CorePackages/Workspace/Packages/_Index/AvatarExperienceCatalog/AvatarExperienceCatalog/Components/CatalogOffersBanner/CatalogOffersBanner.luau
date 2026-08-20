local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local catalogOffersBannerViewModule = require(script.Parent.CatalogOffersBannerView)
local useCatalogOffersBannerViewModelModule = require(script.Parent.useCatalogOffersBannerViewModel)

return function(p0) --[[ line: 17 | named "CatalogOffersBanner" ]]
	-- upvalues: useCatalogOffersBannerViewModelModule (ref), reactModule (ref), catalogOffersBannerViewModule (ref)
	local var3 = useCatalogOffersBannerViewModelModule({
		Size = p0.Size,
		Position = p0.Position,
		onBannerVisibleChanged = p0.onOffersBannerVisibleChanged
	})
	
	return if var3.status == "hidden" then nil elseif var3.modals then reactModule.createElement(reactModule.Fragment, nil, {
		Banner = reactModule.createElement(catalogOffersBannerViewModule, var3.viewProps),
		Modals = var3.modals
	}) else reactModule.createElement(catalogOffersBannerViewModule, var3.viewProps)
end