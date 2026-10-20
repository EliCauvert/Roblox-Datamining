local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, Uid, Btid)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy)
	ArgCheckModule.isType(Uid, "string", "openedEmotesPage event expects userId to be a string")
	ArgCheckModule.isType(Btid, "string", "openedEmotesPage event expects browserTrackerId to be a string")
	p1:sendTelemetryEvent("avatarEditor", "openedEmotesPage", {
		feature = ConstantsModule.AnalyticsTag,
		uid = Uid,
		btid = Btid
	})
end