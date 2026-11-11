return {
	["jest.config"] = script.Parent["jest.config"],
	UserSearchTile = require(script.Parent.Components.UserSearchTile),
	UserSearchScreen = require(script.Parent.Components.UserSearchScreen),
	UserSearchHydrationLayer = require(script.Parent.Components.UserSearchHydrationLayer),
	ProfileInsightsContextFetchWrapper = require(script.Parent.Components.ProfileInsightsContextFetchWrapper),
	Analytics = require(script.Parent.Analytics),
	installReducer = require(script.Parent.Rodux.installReducer),
	RoduxKey = require(script.Parent.Common.Constants).RODUX_KEY
}