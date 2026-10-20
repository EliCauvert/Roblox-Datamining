local ChatMuteModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.ChatMute)

return {
	aliases = { "/unmute", "/um" },
	run = function(Text: string, p1)
		-- upvalues: ChatMuteModule (copy)
		local ResolveUnmuteTargetResult = ChatMuteModule.resolveUnmuteTarget(string.split(Text, " ")[2], p1)
		
		if ResolveUnmuteTargetResult.playerInfo then
			ChatMuteModule.unmutePlayer(ResolveUnmuteTargetResult.playerInfo)
		end
		return {
			key = ResolveUnmuteTargetResult.key,
			args = ResolveUnmuteTargetResult.args
		}
	end
}