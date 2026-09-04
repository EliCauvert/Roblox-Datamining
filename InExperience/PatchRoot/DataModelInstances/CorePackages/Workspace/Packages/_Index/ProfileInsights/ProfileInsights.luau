return {
	ProfileInsightsStore = require(script["data-hydration"].ProfileInsightsStore),
	ProfileInsightsModel = require(script["data-hydration"].ProfileInsightsModel),
	useSignalProfileInsightsByUserId = require(script.Hooks.useSignalProfileInsightsByUserId),
	["jest.config"] = script["jest.config"],
	["data-hydration"] = require(script["data-hydration"])
}