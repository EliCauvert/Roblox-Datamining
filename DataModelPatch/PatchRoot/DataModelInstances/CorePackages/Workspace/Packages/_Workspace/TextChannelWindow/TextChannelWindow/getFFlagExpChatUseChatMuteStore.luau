local SharedFlagsModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.SharedFlags)

return function()
	-- upvalues: SharedFlagsModule (copy)
	return SharedFlagsModule.FFlagExpChatUseChatMuteStore
end