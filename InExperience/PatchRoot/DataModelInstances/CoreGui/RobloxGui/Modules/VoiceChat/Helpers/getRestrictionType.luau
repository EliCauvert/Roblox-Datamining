local _ = require(game:GetService("CorePackages").Workspace.Packages.VoiceChat.createVoiceRestrictionController)
local constantsModule = require(script.Parent.Parent.Constants)

return function(p1)
	-- upvalues: constantsModule (ref)
	return if p1 then if p1.bannedUntil then if p1.banReason == constantsModule.BAN_REASON.NUDGE_V3 then "NudgeBan" else "TemporaryBan" else "PermanentBan" else "Nudge"
end