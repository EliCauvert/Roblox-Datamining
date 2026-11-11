local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local SearchEventUtilModule = require(Modules.LuaApp.Analytics.Events.SearchEventUtil)
local GetFIntLuaAppAutocompleteDebounceMsModule = require(Modules.LuaApp.Flags.GetFIntLuaAppAutocompleteDebounceMs)

return function(p1, p2, Kwd, PrevKwd, p3, Page, Latency, FromLocalCache)
	-- upvalues: ArgCheckModule (copy), LocalizationService (copy), SearchEventUtilModule (copy), GetFIntLuaAppAutocompleteDebounceMsModule (copy)
	if Kwd ~= PrevKwd then
		ArgCheckModule.isType(p2, "string", "eventContext")
		ArgCheckModule.isType(Kwd, "string", "kwd")
		ArgCheckModule.isType(PrevKwd, "string", "prevKwd")
		ArgCheckModule.isType(p3, "table", "suggestion")
		ArgCheckModule.isType(Page, "string", "page")
		p1:setRBXEventStream(p2, "searchAutocomplete", {
			locale = LocalizationService.RobloxLocaleId,
			suggestions = SearchEventUtilModule.convertSuggestionsToString(p3.entries),
			kwd = Kwd,
			prevKwd = PrevKwd,
			page = Page,
			latency = Latency,
			fromLocalCache = FromLocalCache,
			algorithm = p3.algorithmName,
			timeoutDelayMs = GetFIntLuaAppAutocompleteDebounceMsModule()
		})
		
		return
	end
end