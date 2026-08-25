local _ = require(script.Parent.VoiceChatServiceManager)
local t = { voice = "voice", text = "text", other = "other" }

function GetDefaultMethodOfAbuse(p0, p1)
	-- upvalues: t (ref)
	return if p0 then if p1:getRecentUsersInteractionData()[tostring(p0.UserId)] then t.voice else t.text elseif p1:GetMutedAnyone() then t.voice else t.text
end

return {
	MethodsOfAbuse = t,
	GetDefaultMethodOfAbuse = GetDefaultMethodOfAbuse
}