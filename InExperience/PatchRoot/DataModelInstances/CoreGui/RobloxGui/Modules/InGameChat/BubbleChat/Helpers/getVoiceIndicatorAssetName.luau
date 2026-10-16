local GetFFlagEnableShimmeringIconLegacyChatServiceModule = require(game:GetService("CoreGui").RobloxGui.Modules.Flags.getFFlagEnableShimmeringIconLegacyChatService)

return function(p1, p2: number, Text): string --[[ Line: 5 ]]
	-- upvalues: GetFFlagEnableShimmeringIconLegacyChatServiceModule (copy)
	return if GetFFlagEnableShimmeringIconLegacyChatServiceModule() and p1 == "Connecting" then "icons/controls/voice/" .. Text .. "_0_dark" elseif p1 == "Muted" or p1 == "LOCAL_MUTED" then "icons/controls/voice/" .. Text .. "_off_light" elseif p1 == "Inactive" or p1 == "Connecting" then "icons/controls/voice/" .. Text .. "_0_light" elseif p1 == "Talking" then "icons/controls/voice/" .. Text .. "_" .. tostring(math.floor(p2 * 5 + 0.5) * 20) .. "_light" else "icons/controls/voice/" .. Text .. "_error_light"
end