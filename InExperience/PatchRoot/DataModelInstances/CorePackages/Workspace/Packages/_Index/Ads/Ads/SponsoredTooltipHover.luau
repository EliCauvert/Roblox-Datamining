local parent = script:FindFirstAncestor("Ads").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local iconWithTooltip = require(parent.AppBlox).IconWithTooltip

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), iconWithTooltip (ref), cryoModule (ref)
	return reactModule.createElement(iconWithTooltip, cryoModule.Dictionary.join(p1, {
		triggerPointName = "SponsoredTooltip",
		hoverText = useLocalization({
			SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic"
		}).SponsoredDisclosure
	}))
end