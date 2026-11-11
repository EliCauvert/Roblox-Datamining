local Parent = script.Parent.Parent.Parent
local DashModule = require(Parent.Dash)

return require(Parent.React).createContext({
	isZooming = false,
	fireAnalyticsEvent = DashModule.noop,
	navigateBack = DashModule.noop,
	navigateToItemDetailPage = DashModule.noop,
	navigateToReportPage = DashModule.noop,
	setIsZooming = DashModule.noop
})