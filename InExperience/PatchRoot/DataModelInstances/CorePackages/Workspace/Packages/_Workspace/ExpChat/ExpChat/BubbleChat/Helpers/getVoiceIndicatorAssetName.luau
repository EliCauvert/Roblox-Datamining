local GetFFlagExpChatEnableVoiceReverseNudgeModule = require(script:FindFirstAncestor("ExpChat").Flags.GetFFlagExpChatEnableVoiceReverseNudge)

return function(p1, p2: number, Text, p3): string
	-- upvalues: GetFFlagExpChatEnableVoiceReverseNudgeModule (copy)
	if p1 == "Connecting" then
		return "icons/controls/voice/" .. Text .. "_0_dark"
	end
	if p1 == "Muted" or p1 == "LOCAL_MUTED" then
		return "icons/controls/voice/" .. Text .. "_off_light"
	end
	if p1 == "Inactive" or p1 == "Connecting" then
		return "icons/controls/voice/" .. Text .. "_0_light"
	end
	local Text1 = nil
	if p1 == "Talking" then
		local ScaledFloored = math.floor(p2 * 5 + 0.5) * 20
		Text1 = "icons/controls/voice/" .. Text .. "_" .. tostring(ScaledFloored) .. "_light"
		
		if GetFFlagExpChatEnableVoiceReverseNudgeModule() then
			return "icons/controls/voice/" .. (if p3 then "red_" else "") .. Text .. "_" .. tostring(ScaledFloored) .. "_light"
		end
	else
		Text1 = "icons/controls/voice/" .. Text .. "_error_light"
	end
	return Text1
end