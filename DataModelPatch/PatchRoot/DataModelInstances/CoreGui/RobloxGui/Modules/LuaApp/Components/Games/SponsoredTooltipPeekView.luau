local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local InfoPeekView = require(CorePackages.Workspace.Packages.AppBlox).InfoPeekView

return function()
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), InfoPeekView (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds",
		SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic"
	})
	
	return ReactModule.createElement(InfoPeekView, {
		title = UseLocalizationResult.SponsoredTitle,
		body = UseLocalizationResult.SponsoredDisclosure
	})
end