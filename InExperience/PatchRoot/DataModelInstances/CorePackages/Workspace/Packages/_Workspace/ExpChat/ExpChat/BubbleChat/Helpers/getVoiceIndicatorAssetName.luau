local getFFlagExpChatEnableVoiceReverseNudgeModule = require(script:FindFirstAncestor("ExpChat").Flags.GetFFlagExpChatEnableVoiceReverseNudge)

return function(p0, p1, p2, p3) --[[ line: 4 ]]
	-- upvalues: getFFlagExpChatEnableVoiceReverseNudgeModule (ref)
	local text
	local _ = nil
	
	if p0 == "Connecting" then
		return "icons/controls/voice/" .. p2 .. "_0_dark"
	elseif p0 == "Muted" or p0 == "LOCAL_MUTED" then
		return "icons/controls/voice/" .. p2 .. "_off_light"
	elseif p0 == "Inactive" or p0 == "Connecting" then
		return "icons/controls/voice/" .. p2 .. "_0_light"
	elseif p0 == "Talking" then
		local var1 = math.floor(p1 * 5 + 0.5) * 20
		text = "icons/controls/voice/" .. p2 .. "_" .. tostring(var1) .. "_light"
		
		return if getFFlagExpChatEnableVoiceReverseNudgeModule() then "icons/controls/voice/" .. (if p3 then "red_" else "") .. p2 .. "_" .. tostring(var1) .. "_light" else text
	end
	text = "icons/controls/voice/" .. p2 .. "_error_light"
end