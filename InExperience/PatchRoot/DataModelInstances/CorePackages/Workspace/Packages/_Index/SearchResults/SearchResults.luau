return {
	["jest.config"] = script["jest.config"],
	isInContextRecommendationsEnabled = require(script.isInContextRecommendationsEnabled),
	SduiSearchResultsPage = require(script.SduiSearchResultsPage.SduiSearchResultsPage),
	navigateToSearchResults = require(script.SduiSearchResultsPage.navigateToSearchResults),
	getSearchResultsPageConfigKey = require(script.SduiSearchResultsPage.getSearchResultsPageConfigKey),
	prewarmSearchResultsTemplates = require(script.SduiSearchResultsPage.prewarmSearchResultsTemplates),
	createSearchResultsVideoAutoplayWinnerLine = require(script.SduiSearchResultsPage.createSearchResultsVideoAutoplayWinnerLine),
	SduiSearchAutocomplete = require(script.SduiSearchAutocomplete.SduiSearchAutocomplete),
	fetchSearchAutocompleteIfNeeded = require(script.SduiSearchAutocomplete.fetchSearchAutocompleteIfNeeded),
	SearchAutocompleteInputDataIdentifier = require(script.SduiSearchAutocomplete.SearchAutocompleteInputDataIdentifier),
	getClickedSuggestion = require(script.SduiSearchAutocomplete.getClickedSuggestion),
	getSearchAutocompleteConfigKey = require(script.SduiSearchAutocomplete.getSearchAutocompleteConfigKey),
	createSearchAutocompleteRequestContext = require(script.SduiSearchAutocomplete.createSearchAutocompleteRequestContext),
	prewarmSearchAutocompleteTemplates = require(script.SduiSearchAutocomplete.prewarmSearchAutocompleteTemplates),
	toLegacyAutocompleteSuggestion = require(script.SduiSearchAutocomplete.toLegacyAutocompleteSuggestion),
	searchGuidedPillRequest = require(script.SduiSearchResultsPage.GuidedPill.searchGuidedPillRequest)
}