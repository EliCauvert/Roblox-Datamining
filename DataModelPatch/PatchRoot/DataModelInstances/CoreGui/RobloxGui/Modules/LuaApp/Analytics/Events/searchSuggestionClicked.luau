local LocalizationService = game:GetService("LocalizationService")
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local SearchEventUtilModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Analytics.Events.SearchEventUtil)

return function(p1, p2, Kwd, SearchType, p3, SuggestionPosition, p4)
	-- upvalues: ArgCheckModule (copy), LocalizationService (copy), SearchEventUtilModule (copy)
	ArgCheckModule.isType(p2, "string", "eventContext")
	ArgCheckModule.isType(Kwd, "string", "kwd")
	ArgCheckModule.isType(SearchType, "string", "searchType")
	ArgCheckModule.isType(p3, "table", "entries")
	ArgCheckModule.isType(SuggestionPosition, "number", "clickedPos")
	ArgCheckModule.isType(p4, "table", "clickedEntry")
	local SuggestionNameTypeStrings = SearchEventUtilModule.getSuggestionNameTypeStrings(p4)
	p1:setRBXEventStream(p2, "searchSuggestionClicked", {
		locale = LocalizationService.RobloxLocaleId,
		kwd = Kwd,
		searchType = SearchType,
		suggestions = SearchEventUtilModule.convertSuggestionsToString(p3),
		suggestionPosition = SuggestionPosition,
		suggestionClicked = SuggestionNameTypeStrings.name,
		suggestionType = SuggestionNameTypeStrings.type,
		maxResults = #p3
	})
end