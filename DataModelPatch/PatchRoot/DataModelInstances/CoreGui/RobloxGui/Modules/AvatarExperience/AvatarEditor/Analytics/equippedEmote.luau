local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, Uid, Btid, AssetID, Slot)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy)
	ArgCheckModule.isType(Uid, "string", "equippedEmote event expects userId to be a string")
	ArgCheckModule.isType(Btid, "string", "equippedEmote event expects browserTrackerId to be a string")
	ArgCheckModule.isType(AssetID, "string", "equippedEmote event expects assetId to be a string")
	ArgCheckModule.isType(Slot, "number", "equippedEmote event expects slot to be a string")
	p1:sendTelemetryEvent("avatarEditor", "equippedEmote", {
		feature = ConstantsModule.AnalyticsTag,
		uid = Uid,
		btid = Btid,
		slot = Slot,
		assetID = AssetID
	})
end