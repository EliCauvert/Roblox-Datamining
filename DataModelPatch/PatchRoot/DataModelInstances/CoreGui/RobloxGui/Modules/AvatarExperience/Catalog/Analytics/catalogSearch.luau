local HttpService = game:GetService("HttpService")
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, p2, Keyword, List, Page, Sort, Input)
	-- upvalues: ArgCheckModule (copy), HttpService (copy), ConstantsModule (copy)
	ArgCheckModule.isType(p2, "string", "catalogSearch event expects eventContext")
	ArgCheckModule.isType(Keyword, "string", "catalogSearch event expects keyword")
	ArgCheckModule.isType(List, "table", "catalogSearch event expects assetsReturned")
	ArgCheckModule.isType(Page, "number", "catalogSearch event expects pageNumber")
	ArgCheckModule.isTypeOrNil(Sort, "string", "catalogSearch event expects sortType")
	ArgCheckModule.isTypeOrNil(Input, "table", "catalogSearch event expects filters")
	p1:sendTelemetryEvent(p2, "catalogSearch", {
		feature = ConstantsModule.AnalyticsTag,
		keyword = Keyword,
		page = Page,
		sort = Sort,
		filters = Input and HttpService:JSONEncode(Input),
		assetsReturned = table.concat(List, ",")
	})
end