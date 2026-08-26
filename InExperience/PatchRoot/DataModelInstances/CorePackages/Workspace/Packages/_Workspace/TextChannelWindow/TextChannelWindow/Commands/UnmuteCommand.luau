local chatMuteModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.ChatMute)

return {
	aliases = { "/unmute", "/um" },
	run = function(p1, p2)
		-- upvalues: chatMuteModule (ref)
		local var1 = chatMuteModule.resolveUnmuteTarget(string.split(p1, " ")[2], p2)
		
		if var1.playerInfo then
			chatMuteModule.unmutePlayer(var1.playerInfo)
		end
		return { key = var1.key, args = var1.args }
	end
}