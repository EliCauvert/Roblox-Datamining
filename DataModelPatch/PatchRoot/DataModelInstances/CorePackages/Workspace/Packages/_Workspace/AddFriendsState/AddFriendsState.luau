return {
	installReducer = require(script.installReducer),
	RODUX_KEY = require(script.RODUX_KEY),
	AddFriendsSelector = require(script.AddFriendsSelector),
	Actions = {
		ContactImporterWarningSeen = require(script.Actions.ContactImporterWarningSeen)
	},
	contactImporterWarning = require(script.contactImporterWarning),
	IsUserFollowing = require(script.IsUserFollowing),
	RequestsFromOriginSourceType = require(script.RequestsFromOriginSourceType),
	RoduxAnalytics = require(script.RoduxAnalytics),
	RoduxFriends = require(script.RoduxFriends),
	RoduxGames = require(script.RoduxGames),
	RoduxPresence = require(script.RoduxPresence),
	RoduxUsers = require(script.RoduxUsers),
	Networking = {
		FriendsNetworking = require(script.Networking.FriendsNetworking),
		myRoduxNetworking = require(script.Networking.myRoduxNetworking)
	},
	["jest.config"] = script["jest.config"]
}