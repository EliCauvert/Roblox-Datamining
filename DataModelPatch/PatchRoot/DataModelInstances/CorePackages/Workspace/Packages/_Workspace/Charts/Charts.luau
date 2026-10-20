return {
	["jest.config"] = script["jest.config"],
	ChartsConstants = require(script.ChartsPage.ChartsConstants),
	ChartsContentEntryPoint = require(script.ChartsPage.ChartsContentEntryPoint),
	ChartsPageScopeFields = require(script.ChartsPage.ChartsPageScopeFields),
	ChartsPageSession = require(script.ChartsPage.ChartsPageSession),
	ChartsSortDetailPage = require(script.ChartsSortDetailPage.ChartsSortDetailPage),
	getChartsSortDetailPageKey = require(script.ChartsSortDetailPage.getChartsSortDetailPageKey),
	navigateToChartsPage = require(script.ChartsPage.navigateToChartsPage),
	navigateToChartsSortDetailPage = require(script.ChartsSortDetailPage.navigateToChartsSortDetailPage),
	fetchChartsPage = require(script.ChartsPage.fetchChartsPage),
	fetchChartsSortDetail = require(script.ChartsSortDetailPage.fetchChartsSortDetail)
}