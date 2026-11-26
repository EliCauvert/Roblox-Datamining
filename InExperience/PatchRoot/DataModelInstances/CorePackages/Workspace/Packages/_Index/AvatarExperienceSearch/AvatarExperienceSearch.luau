return {
	Api = {
		autocompleteUnifiedSuggest = require(script.Api.AutocompleteUnifiedSuggest.autocompleteUnifiedSuggest)
	},
	Components = {
		SearchBar = require(script.Components.SearchBar),
		SearchViewExposureLogger = require(script.Components.SearchViewExposureLogger)
	},
	Features = {
		SearchLandingPage = require(script.Features.SearchLandingPage.SearchLandingPage),
		useSearchLandingPageProps = require(script.Features.SearchLandingPage.useSearchLandingPageProps)
	},
	Utils = {
		RecentSearchTermsAppStorage = require(script.Utils.RecentSearchTermsAppStorage),
		RecentlyViewedSearchItemsAppStorage = require(script.Utils.RecentlyViewedSearchItemsAppStorage),
		normalizeKeyword = require(script.Utils.normalizeKeyword),
		getAutocompleteQueryKey = require(script.Utils.getAutocompleteQueryKey)
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