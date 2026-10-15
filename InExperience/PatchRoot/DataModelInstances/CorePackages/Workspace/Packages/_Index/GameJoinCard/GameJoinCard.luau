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
	getInExperienceGameJoinCard = function()
		return require(script.Components.InExperienceGameJoinCard.InExperienceGameJoinCard)
	end,
	useGameJoinCardNavigation = require(script.Components.DesktopGameJoinCard.useGameJoinCardNavigation),
	useJoinUserActions = require(script.Hooks.useJoinUserActions),
	usePrefetchInGameFriendsMedia = require(script.Hooks.usePrefetchInGameFriendsMedia),
	MobileGameJoinCard = require(script.Components.MobileGameJoinCard),
	MobileGameJoinCardView = require(script.Components.MobileGameJoinCard.MobileGameJoinCard),
	Telemetry = {
		GameJoinCardTelemetry = require(script.Telemetry.GameJoinCardTelemetry),
		GameJoinCardTTI = require(script.Telemetry.GameJoinCardTTI)
	},
	["jest.config"] = script["jest.config"]
}