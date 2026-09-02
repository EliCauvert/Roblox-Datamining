local parent = script.Parent
local createLazyComponent = require(parent.RoactUtils).Components.createLazyComponent
local sharedFlagsModule = require(parent.SharedFlags)

return {
	Components = {
		FlyoutSidePanelComponent = createLazyComponent(function()
			return require(script.Components.FlyoutSidePanelComponent)
		end),
		FlyoutProfileCard = createLazyComponent(function()
			return require(script.Components.FlyoutProfileCard)
		end),
		FlyoutLeftHeader = require(script.Components.FlyoutLeftHeader),
		FlyoutStatusListener = if sharedFlagsModule.FFlagEnableHomeRobloxLogo then nil else require(script.Components.FlyoutStatusListener),
		FlyoutHamburgerButton = if sharedFlagsModule.FFlagEnableFlyoutOnNavRail then require(script.Components.FlyoutHamburgerButton) else nil
	},
	Flags = {},
	Utils = {
		shouldShowLeftHeader = require(script.Utils.shouldShowLeftHeader)
	},
	Hooks = {
		useOpenFlyoutSidePanel = if sharedFlagsModule.FFlagFlyoutUseOpenHook then require(script.Hooks.useOpenFlyoutSidePanel) else nil
	},
	FlyoutScrollAwayControl = require(script.FlyoutScrollAwayControl),
	["jest.config"] = script["jest.config"]
}