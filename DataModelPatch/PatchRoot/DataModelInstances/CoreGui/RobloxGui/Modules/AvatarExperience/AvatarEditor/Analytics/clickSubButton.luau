local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, p2, Nav, SubNav, SubButton)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy)
	ArgCheckModule.isType(p2, "string", "clickSubButton event expects eventContext to be a string")
	ArgCheckModule.isType(Nav, "string", "clickSubButton event expects categoryName to be a string")
	ArgCheckModule.isType(SubNav, "string", "clickSubButton event expects subCategoryName to be a string")
	ArgCheckModule.isType(SubButton, "string", "clickSubButton event expects subButtonName to be a string")
	p1:sendTelemetryEvent(p2, "avatarEditorSubButtonClick", {
		feature = ConstantsModule.AnalyticsTag,
		nav = Nav,
		subNav = SubNav,
		subButton = SubButton
	})
end