local Parent = script.Parent
local CreateLazyComponentFunction = require(Parent.RoactUtils).Components.createLazyComponent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableHomeRobloxLogo = SharedFlagsModule.FFlagEnableHomeRobloxLogo
local FFlagEnableFlyoutOnNavRail = SharedFlagsModule.FFlagEnableFlyoutOnNavRail
local FFlagEnableFlyoutNavRailBumperNavigation = SharedFlagsModule.FFlagEnableFlyoutNavRailBumperNavigation
local FFlagFlyoutUseOpenHook = SharedFlagsModule.FFlagFlyoutUseOpenHook
local FFlagSendLogOutClickTelemetry = SharedFlagsModule.FFlagSendLogOutClickTelemetry
local FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled = SharedFlagsModule.FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled

return {
	Components = {
		FlyoutSidePanelComponent = CreateLazyComponentFunction(function()
			return require(script.Components.FlyoutSidePanelComponent)
		end),
		FlyoutProfileCard = CreateLazyComponentFunction(function()
			return require(script.Components.FlyoutProfileCard)
		end),
		FlyoutLeftHeader = require(script.Components.FlyoutLeftHeader),
		FlyoutStatusListener = if FFlagEnableHomeRobloxLogo then nil else require(script.Components.FlyoutStatusListener),
		FlyoutHamburgerButton = if FFlagEnableFlyoutOnNavRail then require(script.Components.FlyoutHamburgerButton) else nil
	},
	Utils = {
		shouldShowLeftHeader = require(script.Utils.shouldShowLeftHeader),
		sendMoreLegacyAndFlyoutItemClickEvent = if FFlagSendLogOutClickTelemetry then require(script.Analytics.FlyoutAnalytics).sendMoreLegacyAndFlyoutItemClickEvent else nil,
		logCTAChangeMorePageFlyoutButtonTextExposure = if FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled then require(script.Utils.logCTAChangeMorePageFlyoutButtonTextExposure) else nil
	},
	Hooks = {
		useOpenFlyoutSidePanel = if FFlagEnableFlyoutNavRailBumperNavigation or FFlagFlyoutUseOpenHook then require(script.Hooks.useOpenFlyoutSidePanel) else nil
	},
	FlyoutScrollAwayControl = require(script.FlyoutScrollAwayControl),
	["jest.config"] = script["jest.config"]
}