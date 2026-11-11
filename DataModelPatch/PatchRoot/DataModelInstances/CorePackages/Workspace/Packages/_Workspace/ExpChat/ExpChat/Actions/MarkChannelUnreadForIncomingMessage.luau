local Parent = script:FindFirstAncestor("ExpChat").Parent
local FFlagChatLineReportingGlobalMuteEnabled = require(Parent.SharedFlags).FFlagChatLineReportingGlobalMuteEnabled

return require(Parent.Rodux).makeActionCreator(script.Name, function(TextChatMessage, IsSenderLocalPlayer, ChannelNameOverride, p1)
	-- upvalues: FFlagChatLineReportingGlobalMuteEnabled (copy)
	return {
		textChatMessage = TextChatMessage,
		isSenderLocalPlayer = IsSenderLocalPlayer,
		channelNameOverride = ChannelNameOverride,
		isUniverseChat = if FFlagChatLineReportingGlobalMuteEnabled then p1 else nil
	}
end)