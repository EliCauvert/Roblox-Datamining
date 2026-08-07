local parent = script.Parent
local createLazyComponent = require(parent.RoactUtils).Components.createLazyComponent
local sharedFlagsModule = require(parent.SharedFlags)

return {
	Components = {
		FlyoutSidePanelComponent = createLazyComponent(function() --[[ line: 9 ]]
			return require(script.Components.FlyoutSidePanelComponent)
		end),
		FlyoutProfileCard = createLazyComponent(function() --[[ line: 12 ]]
			return require(script.Components.FlyoutProfileCard)
		end),
		FlyoutLeftHeader = require(script.Components.FlyoutLeftHeader),
		FlyoutStatusListener = if sharedFlagsModule.FFlagEnableHomeRobloxLogo then nil else require(script.Components.FlyoutStatusListener),
		FlyoutHamburgerButton = if sharedFlagsModule.FFlagEnableFlyoutOnNavRail then require(script.Components.FlyoutHamburgerButton) else nil
	},
	Flags = {
		FFlagFlyoutTermsPrivacyFooter = require(script.Flags.FFlagFlyoutTermsPrivacyFooter)
	},
	Utils = {
		shouldShowLeftHeader = require(script.Utils.shouldShowLeftHeader)
	},
	FlyoutScrollAwayControl = require(script.FlyoutScrollAwayControl),
	["jest.config"] = script["jest.config"]
}