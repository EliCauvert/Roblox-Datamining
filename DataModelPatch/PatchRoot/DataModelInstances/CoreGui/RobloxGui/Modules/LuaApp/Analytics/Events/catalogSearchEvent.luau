local LocalizationService = game:GetService("LocalizationService")
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local SearchEventUtilModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Analytics.Events.SearchEventUtil)

return function(p1, p2, Kwd, Enabled, PreviousPage, p3)
	-- upvalues: ArgCheckModule (copy), SearchEventUtilModule (copy), LocalizationService (copy)
	ArgCheckModule.isType(p2, "string", "eventContext")
	ArgCheckModule.isType(Kwd, "string", "kwd")
	ArgCheckModule.isType(PreviousPage, "string", "page")
	p1:sendEventDeferred(p2, "catalogSearch", {
		locale = LocalizationService.RobloxLocaleId,
		kwd = Kwd,
		autoCompleteFlag = if Enabled == true then 1 else 0,
		previousPage = PreviousPage,
		suggestions = if p3 then SearchEventUtilModule.convertSuggestionsToString(p3) else ""
	})
end