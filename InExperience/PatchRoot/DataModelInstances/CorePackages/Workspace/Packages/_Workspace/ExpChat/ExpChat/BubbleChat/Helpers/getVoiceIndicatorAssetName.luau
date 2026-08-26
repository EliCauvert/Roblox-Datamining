local getFFlagExpChatEnableVoiceReverseNudgeModule = require(script:FindFirstAncestor("ExpChat").Flags.GetFFlagExpChatEnableVoiceReverseNudge)

return function(p1, p2, p3, p4)
	-- upvalues: getFFlagExpChatEnableVoiceReverseNudgeModule (ref)
	local text
	local _ = nil
	
	if p1 == "Connecting" then
		return "icons/controls/voice/" .. p2 .. "_0_dark"
	elseif p1 == "Muted" or p1 == "LOCAL_MUTED" then
		return "icons/controls/voice/" .. p2 .. "_off_light"
	elseif p1 == "Inactive" or p1 == "Connecting" then
		return "icons/controls/voice/" .. p2 .. "_0_light"
	elseif p1 == "Talking" then
		local var1 = math.floor(p2 * 5 + 0.5) * 20
		text = "icons/controls/voice/" .. p2 .. "_" .. tostring(var1) .. "_light"
		
		return if getFFlagExpChatEnableVoiceReverseNudgeModule() then "icons/controls/voice/" .. (if p4 then "red_" else "") .. p2 .. "_" .. tostring(var1) .. "_light" else text
	end
	text = "icons/controls/voice/" .. p2 .. "_error_light"
end