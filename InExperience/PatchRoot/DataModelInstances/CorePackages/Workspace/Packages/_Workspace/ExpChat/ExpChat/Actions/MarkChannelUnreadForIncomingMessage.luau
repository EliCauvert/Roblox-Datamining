local parent = script:FindFirstAncestor("ExpChat").Parent
local fFlagChatLineReportingGlobalMuteEnabled = require(parent.SharedFlags).FFlagChatLineReportingGlobalMuteEnabled

return require(parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3) --[[ line: 17 ]]
	-- upvalues: fFlagChatLineReportingGlobalMuteEnabled (ref)
	return {
		textChatMessage = p0,
		isSenderLocalPlayer = p1,
		channelNameOverride = p2,
		isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p3 else nil
	}
end)