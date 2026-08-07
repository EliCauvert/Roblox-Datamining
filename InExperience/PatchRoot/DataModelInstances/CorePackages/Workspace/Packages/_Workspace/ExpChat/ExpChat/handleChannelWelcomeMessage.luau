local expChat = script:FindFirstAncestor("ExpChat")
local set = require(expChat.Parent.llama).Set
local getOtherDisplayNameInWhisperChannelModule = require(expChat.getOtherDisplayNameInWhisperChannel)
local t = {}

return function(p0, p1) --[[ line: 14 ]]
	-- upvalues: set (ref), t (write), getOtherDisplayNameInWhisperChannelModule (ref)
	if p0.TextChannel and string.find(p0.TextChannel.Name, "^RBXWhisper") and not set.has(t, p0.TextChannel) then
		local var3 = getOtherDisplayNameInWhisperChannelModule(p0.TextChannel, p1)
		
		if var3 then
			t = set.add(t, p0.TextChannel)
			
			return {
				key = "CoreScripts.TextChat.Notification.WhisperChat.Created",
				metadata = "Roblox.Whisper.Welcome.Sent",
				args = { RBX_NAME = var3 }
			}
		end
	end
	return nil
end