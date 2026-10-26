local SduiSharedUtilitiesModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiSharedUtilities)

return function(p1, Prefix, p2, SearchQuery): boolean
	-- upvalues: SduiSharedUtilitiesModule (copy)
	local SuggestionsInputData = if p1 then SduiSharedUtilitiesModule.getSduiApiStore().getInputData(p1, "suggestions") else nil
	local Suggestion = if SuggestionsInputData and SuggestionsInputData.suggestions then SuggestionsInputData.suggestions[p2] else nil
	
	return SuggestionsInputData ~= nil and (SuggestionsInputData.prefix == Prefix and (Suggestion ~= nil and Suggestion.search_query == SearchQuery))
end