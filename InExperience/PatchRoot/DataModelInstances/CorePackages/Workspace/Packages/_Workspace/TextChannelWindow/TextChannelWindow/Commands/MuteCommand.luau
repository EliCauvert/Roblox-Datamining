local ChatMuteModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.ChatMute)

return {
	aliases = { "/mute", "/m" },
	run = function(Text: string, p1) --[[ Line: 13 ]]
		-- upvalues: ChatMuteModule (copy)
		local ResolveMuteTargetResult = ChatMuteModule.resolveMuteTarget(string.split(Text, " ")[2], p1)
		
		if ResolveMuteTargetResult.playerInfo then
			ChatMuteModule.mutePlayer(ResolveMuteTargetResult.playerInfo)
		end
		return {
			key = ResolveMuteTargetResult.key,
			args = ResolveMuteTargetResult.args
		}
	end
}