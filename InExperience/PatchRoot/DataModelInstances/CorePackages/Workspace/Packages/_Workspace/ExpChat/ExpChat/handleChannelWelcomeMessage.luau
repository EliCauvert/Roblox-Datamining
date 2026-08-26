local expChat = script:FindFirstAncestor("ExpChat")
local set = require(expChat.Parent.llama).Set
local getOtherDisplayNameInWhisperChannelModule = require(expChat.getOtherDisplayNameInWhisperChannel)
local t = {}

return function(p1, p2)
	-- upvalues: set (ref), t (write), getOtherDisplayNameInWhisperChannelModule (ref)
	if p1.TextChannel and string.find(p1.TextChannel.Name, "^RBXWhisper") and not set.has(t, p1.TextChannel) then
		local var1 = getOtherDisplayNameInWhisperChannelModule(p1.TextChannel, p2)
		
		if var1 then
			t = set.add(t, p1.TextChannel)
			
			return {
				key = "CoreScripts.TextChat.Notification.WhisperChat.Created",
				metadata = "Roblox.Whisper.Welcome.Sent",
				args = { RBX_NAME = var1 }
			}
		end
	end
	return nil
end