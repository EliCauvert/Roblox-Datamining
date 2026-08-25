local getFFlagEnableShimmeringIconLegacyChatServiceModule = require(game:GetService("CoreGui").RobloxGui.Modules.Flags.getFFlagEnableShimmeringIconLegacyChatService)

return function(p0, p1, p2)
	-- upvalues: getFFlagEnableShimmeringIconLegacyChatServiceModule (ref)
	local _ = nil
	
	return if getFFlagEnableShimmeringIconLegacyChatServiceModule() and p0 == "Connecting" then "icons/controls/voice/" .. p2 .. "_0_dark" elseif p0 == "Muted" or p0 == "LOCAL_MUTED" then "icons/controls/voice/" .. p2 .. "_off_light" elseif p0 == "Inactive" or p0 == "Connecting" then "icons/controls/voice/" .. p2 .. "_0_light" elseif p0 == "Talking" then "icons/controls/voice/" .. p2 .. "_" .. tostring(math.floor(p1 * 5 + 0.5) * 20) .. "_light" else "icons/controls/voice/" .. p2 .. "_error_light"
end