local SharedFlagsModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.SharedFlags)

return function() --[[ Line: 5 ]]
	-- upvalues: SharedFlagsModule (copy)
	return SharedFlagsModule.FFlagExpChatUseChatMuteStore
end