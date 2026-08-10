local sharedFlagsModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.SharedFlags)

return function() --[[ line: 5 ]]
	-- upvalues: sharedFlagsModule (ref)
	return sharedFlagsModule.FFlagExpChatUseChatMuteStore
end