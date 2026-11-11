local LocalizationService = game:GetService("LocalizationService")
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)

return function(p1, p2, Kwd, ResultingKwd, SearchType)
	-- upvalues: ArgCheckModule (copy), LocalizationService (copy)
	ArgCheckModule.isType(p2, "string", "eventContext")
	ArgCheckModule.isType(Kwd, "string", "kwd")
	ArgCheckModule.isType(ResultingKwd, "string", "resultingKwd")
	ArgCheckModule.isType(SearchType, "string", "searchType")
	p1:setRBXEventStream(p2, "searchTextTrim", {
		locale = LocalizationService.RobloxLocaleId,
		kwd = Kwd,
		resultingKwd = ResultingKwd,
		searchType = SearchType
	})
end