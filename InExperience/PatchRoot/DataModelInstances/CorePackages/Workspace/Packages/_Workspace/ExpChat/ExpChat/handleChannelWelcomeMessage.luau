local ExpChat = script:FindFirstAncestor("ExpChat")
local Set = require(ExpChat.Parent.llama).Set
local GetOtherDisplayNameInWhisperChannelModule = require(ExpChat.getOtherDisplayNameInWhisperChannel)
local AddResult = {}

return function(p1, p2) --[[ Line: 14 ]]
	-- upvalues: Set (copy), AddResult (ref), GetOtherDisplayNameInWhisperChannelModule (copy)
	if p1.TextChannel and string.find(p1.TextChannel.Name, "^RBXWhisper") and not Set.has(AddResult, p1.TextChannel) then
		local OtherDisplayNameInWhisperChannelModule = GetOtherDisplayNameInWhisperChannelModule(p1.TextChannel, p2)
		
		if OtherDisplayNameInWhisperChannelModule then
			AddResult = Set.add(AddResult, p1.TextChannel)
			
			return {
				key = "CoreScripts.TextChat.Notification.WhisperChat.Created",
				metadata = "Roblox.Whisper.Welcome.Sent",
				args = { RBX_NAME = OtherDisplayNameInWhisperChannelModule }
			}
		end
	end
	return nil
end