local SharedFlagsModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.SharedFlags)
local FFlagExpChatWhisperSetDirectChatRequester = SharedFlagsModule.FFlagExpChatWhisperSetDirectChatRequester
local FFlagExpChatIgnoreWhisperNameForDirectChat = SharedFlagsModule.FFlagExpChatIgnoreWhisperNameForDirectChat

return function(p1): boolean
	-- upvalues: FFlagExpChatWhisperSetDirectChatRequester (copy), FFlagExpChatIgnoreWhisperNameForDirectChat (copy)
	if FFlagExpChatWhisperSetDirectChatRequester and FFlagExpChatIgnoreWhisperNameForDirectChat or string.sub(p1.Name, 1, 10) ~= "RBXWhisper" then
		return p1.DirectChatRequester ~= nil
	else
		return true
	end
end