local parent = script.Parent
local createLazyComponent = require(parent.RoactUtils).Components.createLazyComponent

return {
	Components = {
		FlyoutSidePanelComponent = createLazyComponent(function() --[[ line: 8 ]]
			return require(script.Components.FlyoutSidePanelComponent)
		end),
		FlyoutProfileCard = createLazyComponent(function() --[[ line: 11 ]]
			return require(script.Components.FlyoutProfileCard)
		end),
		FlyoutLeftHeader = require(script.Components.FlyoutLeftHeader),
		FlyoutStatusListener = if require(parent.SharedFlags).FFlagEnableHomeRobloxLogo then nil else require(script.Components.FlyoutStatusListener)
	},
	Flags = {
		FFlagFlyoutTermsPrivacyFooter = require(script.Flags.FFlagFlyoutTermsPrivacyFooter)
	},
	Utils = {
		shouldShowLeftHeader = require(script.Utils.shouldShowLeftHeader)
	},
	FlyoutScrollAwayControl = require(script.FlyoutScrollAwayControl)
}