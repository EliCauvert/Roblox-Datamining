local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local GetFFlagLuaAppUseWithLocalizationModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)

return function(p1, p2, Keyword, Callback: (any, any, any) -> (), p3, p4)
	-- upvalues: ArgCheckModule (copy), UrlBuilderModule (copy), GetFFlagLuaAppUseWithLocalizationModule (copy)
	ArgCheckModule.isNotNil(Keyword, "keyword")
	local SearchResult = UrlBuilderModule.user.search({ keyword = Keyword })
	p1.reportTouchSearchInsteadForPlayerNamed(Keyword)
	Callback(SearchResult, GetFFlagLuaAppUseWithLocalizationModule() and p4 or p3:Format(p4), p2)
end