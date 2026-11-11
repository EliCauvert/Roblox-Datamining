local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CatalogOffersBanner = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.CatalogOffersBanner
local AdaptiveScrollingViewPeekHeaderBackgroundContextModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.AdaptiveScrollingViewPeekHeaderBackgroundContext)

return function()
	-- upvalues: ReactModule (copy), AdaptiveScrollingViewPeekHeaderBackgroundContextModule (copy), CatalogOffersBanner (copy)
	return ReactModule.createElement(CatalogOffersBanner, {
		Size = UDim2.new(1, 0, 0, 0),
		onOffersBannerVisibleChanged = ReactModule.useContext(AdaptiveScrollingViewPeekHeaderBackgroundContextModule).onPeekHeaderBackgroundActiveChanged
	})
end