local chatMuteModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.ChatMute)

return {
	aliases = { "/unmute", "/um" },
	run = function(p0, p1) --[[ line: 8 ]]
		-- upvalues: chatMuteModule (ref)
		local var1 = chatMuteModule.resolveUnmuteTarget(string.split(p0, " ")[2], p1)
		
		if var1.playerInfo then
			chatMuteModule.unmutePlayer(var1.playerInfo)
		end
		return { key = var1.key, args = var1.args }
	end
}