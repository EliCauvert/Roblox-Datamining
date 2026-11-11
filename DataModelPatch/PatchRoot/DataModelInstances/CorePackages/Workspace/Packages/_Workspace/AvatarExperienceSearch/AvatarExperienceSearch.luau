return {
	Components = { SearchBar = require(script.Components.SearchBar) },
	Features = {
		SearchLandingPage = require(script.Features.SearchLandingPage.SearchLandingPage),
		useSearchLandingPageProps = require(script.Features.SearchLandingPage.useSearchLandingPageProps)
	},
	Utils = {
		RecentSearchTermsAppStorage = require(script.Utils.RecentSearchTermsAppStorage),
		RecentlyViewedSearchItemsAppStorage = require(script.Utils.RecentlyViewedSearchItemsAppStorage),
		normalizeKeyword = require(script.Utils.normalizeKeyword)
	},
	Enums = {
		Counter = require(script.Enums.Counter),
		Stat = require(script.Enums.Stat),
		SearchLandingPageWidgetEnum = require(script.Enums.SearchLandingPageWidgetEnum)
	},
	Flags = {
		GetFFlagAXRecentlyViewedCounters = require(script.Flags.GetFFlagAXRecentlyViewedCounters)
	},
	["jest.config"] = script["jest.config"]
}