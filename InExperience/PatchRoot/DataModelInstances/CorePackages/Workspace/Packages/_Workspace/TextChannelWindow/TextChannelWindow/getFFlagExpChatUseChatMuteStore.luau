local sharedFlagsModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.SharedFlags)

return function()
	-- upvalues: sharedFlagsModule (ref)
	return sharedFlagsModule.FFlagExpChatUseChatMuteStore
end