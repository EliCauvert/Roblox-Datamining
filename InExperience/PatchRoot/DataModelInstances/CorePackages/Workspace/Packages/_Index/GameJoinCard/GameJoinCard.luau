local analyticsConstantsModule = require(script.Analytics.AnalyticsConstants)

return {
	Analytics = {
		AnalyticsConstants = analyticsConstantsModule,
		Constants = analyticsConstantsModule,
		useGameJoinCardAnalytics = require(script.Analytics.useGameJoinCardAnalytics)
	},
	DesktopGameJoinCard = require(script.Components.DesktopGameJoinCard.DesktopGameJoinCard),
	DesktopGameJoinCardContainer = require(script.Components.DesktopGameJoinCard.DesktopGameJoinCardContainer),
	GamepadJoinFocusBehavior = require(script.Components.DesktopGameJoinCard.GamepadJoinFocusBehavior),
	useGameJoinCardNavigation = require(script.Components.DesktopGameJoinCard.useGameJoinCardNavigation),
	usePrefetchInGameFriendsMedia = require(script.Hooks.usePrefetchInGameFriendsMedia),
	MobileGameJoinCard = require(script.Components.MobileGameJoinCard),
	Telemetry = {
		GameJoinCardTelemetry = require(script.Telemetry.GameJoinCardTelemetry),
		GameJoinCardTTI = require(script.Telemetry.GameJoinCardTTI)
	},
	["jest.config"] = script["jest.config"]
}