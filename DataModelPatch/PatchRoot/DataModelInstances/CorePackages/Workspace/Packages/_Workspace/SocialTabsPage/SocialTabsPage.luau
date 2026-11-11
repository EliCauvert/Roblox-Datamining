return {
	["jest.config"] = script["jest.config"],
	RoduxKey = require(script.Common.Constants).RODUX_KEY,
	installReducer = require(script.Rodux.installReducer),
	SocialTabsPage = require(script.Components.SocialTabsPage),
	SocialTabsPageNavigator = require(script.Navigation.SocialTabsPageNavigator),
	SocialTabsContext = require(script.Contexts.SocialTabsContext),
	useSocialTabsContext = require(script.Contexts.useSocialTabsContext)
}