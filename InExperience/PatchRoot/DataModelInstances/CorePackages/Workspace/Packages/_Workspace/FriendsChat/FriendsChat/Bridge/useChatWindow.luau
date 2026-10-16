local ReactModule = require(script:FindFirstAncestor("FriendsChat").Parent.React)
local FriendsChatDependencyContextModule = require(script.Parent.FriendsChatDependencyContext)

return function() --[[ Line: 8 | Named "useChatWindow" ]]
	-- upvalues: ReactModule (copy), FriendsChatDependencyContextModule (copy)
	local UseContextResult = ReactModule.useContext(FriendsChatDependencyContextModule)
	
	if UseContextResult == nil then
		error("useChatWindow must be used within a FriendsChatDependencyBridge")
	end
	return UseContextResult.ChatWindow
end