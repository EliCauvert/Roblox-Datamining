local Parent = script.Parent
local CreateLazyComponentFunction = require(Parent.RoactUtils).Components.createLazyComponent
local FFlagEnableHomeRobloxLogo = require(Parent.SharedFlags).FFlagEnableHomeRobloxLogo

return {
	Components = {
		FlyoutSidePanelComponent = CreateLazyComponentFunction(function()
			return require(script.Components.FlyoutSidePanelComponent)
		end),
		FlyoutProfileCard = CreateLazyComponentFunction(function()
			return require(script.Components.FlyoutProfileCard)
		end),
		FlyoutLeftHeader = require(script.Components.FlyoutLeftHeader),
		FlyoutStatusListener = if FFlagEnableHomeRobloxLogo then nil else require(script.Components.FlyoutStatusListener)
	},
	Flags = {
		FFlagFlyoutTermsPrivacyFooter = require(script.Flags.FFlagFlyoutTermsPrivacyFooter)
	},
	Utils = {
		shouldShowLeftHeader = require(script.Utils.shouldShowLeftHeader)
	},
	FlyoutScrollAwayControl = require(script.FlyoutScrollAwayControl)
}