local reactModule = require(script:FindFirstAncestor("FriendsChat").Parent.React)
local friendsChatDependencyContextModule = require(script.Parent.FriendsChatDependencyContext)

return function()
	-- upvalues: reactModule (ref), friendsChatDependencyContextModule (ref)
	local var2 = reactModule.useContext(friendsChatDependencyContextModule)
	
	if var2 == nil then
		error("useChatWindow must be used within a FriendsChatDependencyBridge")
	end
	return var2.ChatWindow
end