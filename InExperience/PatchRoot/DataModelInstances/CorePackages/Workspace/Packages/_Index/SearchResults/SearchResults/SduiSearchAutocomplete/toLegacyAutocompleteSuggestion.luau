local DiscoveryEventErrorLogger = require(script:FindFirstAncestor("SearchResults").Parent.DiscoveryUtils).DiscoveryEventErrorLogger

return function(p1)
	-- upvalues: DiscoveryEventErrorLogger (copy)
	if p1 == nil then
		return nil
	end
	if typeof(p1.prefix) ~= "string" or p1.suggestions == nil then
		DiscoveryEventErrorLogger.reportError("SearchAutocomplete", "toLegacyAutocompleteSuggestion: ranked data has no prefix or suggestions")
		
		return nil
	end
	local List = {}
	local SuggestionType = nil
	
	for _, suggestion in p1.suggestions do
		local SearchQuery = suggestion.search_query
		
		if typeof(SearchQuery) ~= "string" or SearchQuery == "" then
			DiscoveryEventErrorLogger.reportError("SearchAutocomplete", "toLegacyAutocompleteSuggestion: row has no search_query")
			
			return nil
		end
		SuggestionType = suggestion.suggestion_type
		
		if SuggestionType == "SUGGESTION_TYPE_RICH" then
			table.insert(List, {
				type = 0,
				searchQuery = SearchQuery,
				canonicalTitle = if suggestion.canonical_title and suggestion.canonical_title ~= "" then suggestion.canonical_title else SearchQuery,
				universeId = suggestion.universe_id,
				position = suggestion.position
			})
		elseif SuggestionType ~= "SUGGESTION_TYPE_QUERY" and SuggestionType ~= "SUGGESTION_TYPE_TRENDING_QUERY" then
			DiscoveryEventErrorLogger.reportError("SearchAutocomplete", "toLegacyAutocompleteSuggestion: unsupported suggestion_type", { suggestionType = tostring(SuggestionType) })
			
			return nil
		else
			table.insert(List, {
				type = 1,
				searchQuery = SearchQuery,
				position = suggestion.position
			})
		end
	end
	return {
		prefix = p1.prefix,
		algorithmName = p1.algorithm_name or "",
		entries = List
	}
end