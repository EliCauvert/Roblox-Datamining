local _ = require(script.Parent.VoiceChatServiceManager)
local t = { voice = "voice", text = "text", other = "other" }

function GetDefaultMethodOfAbuse(p1, p2)
	-- upvalues: t (ref)
	return if p1 then if p2:getRecentUsersInteractionData()[tostring(p1.UserId)] then t.voice else t.text elseif p2:GetMutedAnyone() then t.voice else t.text
end

return {
	MethodsOfAbuse = t,
	GetDefaultMethodOfAbuse = GetDefaultMethodOfAbuse
}