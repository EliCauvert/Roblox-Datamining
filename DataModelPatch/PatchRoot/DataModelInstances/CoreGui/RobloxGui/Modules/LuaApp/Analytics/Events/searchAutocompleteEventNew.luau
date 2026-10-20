local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local SearchEventUtilModule = require(Modules.LuaApp.Analytics.Events.SearchEventUtil)
local GetFIntLuaAppAutocompleteDebounceMsModule = require(Modules.LuaApp.Flags.GetFIntLuaAppAutocompleteDebounceMs)

return function(p1, p2, Kwd, PrevKwd, p3, Page, Latency, FromLocalCache, SearchType)
	-- upvalues: ArgCheckModule (copy), LocalizationService (copy), SearchEventUtilModule (copy), GetFIntLuaAppAutocompleteDebounceMsModule (copy)
	if Kwd ~= PrevKwd then
		ArgCheckModule.isType(p2, "string", "eventContext")
		ArgCheckModule.isType(Kwd, "string", "kwd")
		ArgCheckModule.isType(PrevKwd, "string", "prevKwd")
		ArgCheckModule.isType(p3, "table", "suggestion")
		ArgCheckModule.isType(Page, "string", "page")
		p1:sendEventDeferred(p2, "searchAutocomplete", {
			searchBox = "mobile",
			locale = LocalizationService.RobloxLocaleId,
			suggestions = SearchEventUtilModule.convertSuggestionsToString(p3.entries),
			kwd = Kwd,
			prevKwd = PrevKwd,
			page = Page,
			latency = Latency,
			fromLocalCache = FromLocalCache,
			algorithm = p3.algorithmName,
			timeoutDelayMs = GetFIntLuaAppAutocompleteDebounceMsModule(),
			maxResults = #p3.entries,
			searchType = SearchType
		})
		
		return
	end
end