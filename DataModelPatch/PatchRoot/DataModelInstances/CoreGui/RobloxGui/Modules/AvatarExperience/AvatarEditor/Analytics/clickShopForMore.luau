local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, p2, Nav, SubNav)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy)
	ArgCheckModule.isType(p2, "string", "clickShopForMore event expects eventContext to be a string")
	ArgCheckModule.isType(Nav, "string", "clickShopForMore event expects categoryName to be a string")
	ArgCheckModule.isType(SubNav, "string", "clickShopForMore event expects subCategoryName to be a string")
	p1:sendTelemetryEvent(p2, "clickShopForMore", {
		feature = ConstantsModule.AnalyticsTag,
		nav = Nav,
		subNav = SubNav
	})
end