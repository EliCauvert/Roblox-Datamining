local _ = require(game:GetService("CorePackages").Workspace.Packages.VoiceChat.createVoiceRestrictionController)
local ConstantsModule = require(script.Parent.Parent.Constants)

return function(p1): string --[[ Line: 12 | Named "getRestrictionType" ]]
	-- upvalues: ConstantsModule (copy)
	return if p1 then if p1.bannedUntil then if p1.banReason == ConstantsModule.BAN_REASON.NUDGE_V3 then "NudgeBan" else "TemporaryBan" else "PermanentBan" else "Nudge"
end