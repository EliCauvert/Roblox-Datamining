local Parent = script:FindFirstAncestor("Ads").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local IconWithTooltip = require(Parent.AppBlox).IconWithTooltip

return function(p1) --[[ Line: 20 | Named "SponsoredTooltipHover" ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), IconWithTooltip (copy), CryoModule (copy)
	return ReactModule.createElement(IconWithTooltip, CryoModule.Dictionary.join(p1, {
		triggerPointName = "SponsoredTooltip",
		hoverText = UseLocalizationFunction({
			SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic"
		}).SponsoredDisclosure
	}))
end