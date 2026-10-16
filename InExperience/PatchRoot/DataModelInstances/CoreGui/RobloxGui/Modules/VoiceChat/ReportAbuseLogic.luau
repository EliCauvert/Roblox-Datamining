local _ = require(script.Parent.VoiceChatServiceManager)
local MethodsOfAbuse = { voice = "voice", text = "text", other = "other" }

function GetDefaultMethodOfAbuse(Player, p1) --[[ Line: 14 ]]
	-- upvalues: MethodsOfAbuse (copy)
	return if Player then if p1:getRecentUsersInteractionData()[tostring(Player.UserId)] then MethodsOfAbuse.voice else MethodsOfAbuse.text elseif p1:GetMutedAnyone() then MethodsOfAbuse.voice else MethodsOfAbuse.text
end

return {
	MethodsOfAbuse = MethodsOfAbuse,
	GetDefaultMethodOfAbuse = GetDefaultMethodOfAbuse
}