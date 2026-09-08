return {
	["jest.config"] = script["jest.config"],
	HomeConstants = require(script.HomeConstants),
	HomeContentEntryPoint = require(script.HomeContentEntryPoint),
	HomePageSession = require(script.HomePageSession),
	fetchHomePage = require(script.fetchHomePage),
	refreshHomePage = require(script.refreshHomePage),
	setHomePageSessionInfo = require(script.setHomePageSessionInfo)
}