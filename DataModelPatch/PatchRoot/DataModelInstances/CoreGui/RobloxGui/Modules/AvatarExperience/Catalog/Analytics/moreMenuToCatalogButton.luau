local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, p2)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy)
	ArgCheckModule.isType(p2, "string", "moreMenuToCatalogButton event expects eventContext")
	p1:sendTelemetryEvent(p2, "moreMenuToCatalogButton", { feature = ConstantsModule.AnalyticsTag })
end