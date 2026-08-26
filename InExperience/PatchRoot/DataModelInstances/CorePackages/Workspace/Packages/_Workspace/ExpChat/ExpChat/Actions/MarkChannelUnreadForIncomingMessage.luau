local parent = script:FindFirstAncestor("ExpChat").Parent
local fFlagChatLineReportingGlobalMuteEnabled = require(parent.SharedFlags).FFlagChatLineReportingGlobalMuteEnabled

return require(parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4)
	-- upvalues: fFlagChatLineReportingGlobalMuteEnabled (ref)
	return {
		textChatMessage = p1,
		isSenderLocalPlayer = p2,
		channelNameOverride = p3,
		isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p4 else nil
	}
end)