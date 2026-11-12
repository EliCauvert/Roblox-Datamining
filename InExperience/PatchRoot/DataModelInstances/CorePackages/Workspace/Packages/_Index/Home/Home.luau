return {
	["jest.config"] = script["jest.config"],
	HomeConstants = require(script.HomeConstants),
	HomeContentEntryPoint = require(script.HomeContentEntryPoint),
	HomePageSession = require(script.HomePageSession),
	HomeSortDetailPage = require(script.HomeSortDetailPage.HomeSortDetailPage),
	buildHomeSortDetailPageEntry = require(script.HomeSortDetailPage.buildHomeSortDetailPageEntry),
	useHomeSortDropDownOptions = require(script.HomeSortDetailPage.useHomeSortDropDownOptions),
	fetchHomePage = require(script.fetchHomePage),
	getHomePageAutoRefreshStore = require(script.getHomePageAutoRefreshStore),
	startHomeCollectionLayoutSync = require(script.startHomeCollectionLayoutSync),
	refreshHomePage = require(script.refreshHomePage),
	setHomePageSessionInfo = require(script.setHomePageSessionInfo)
}