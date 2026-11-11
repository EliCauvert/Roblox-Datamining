local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, Uid, Btid, RangeId)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy)
	ArgCheckModule.isType(Uid, "string", "selectedBodyColorRangeWithId event expects userId to be a string")
	ArgCheckModule.isType(Btid, "string", "selectedBodyColorRangeWithId event expects browserTrackerId to be a string")
	ArgCheckModule.isType(RangeId, "string", "selectedBodyColorRangeWithId event expects rangeId to be a string")
	p1:sendTelemetryEvent("avatarEditor", "selectedBodyColorRangeWithId", {
		feature = ConstantsModule.AnalyticsTag,
		uid = Uid,
		btid = Btid,
		rangeId = RangeId
	})
end