local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FriendsChatDependencyContextModule = require(Parent.FriendsChat.FriendsChatDependencyContext)
local config = { ChatWindow = require(ExpChat.ChatWindow.UI.ChatWindow) }

return function(p1)
	-- upvalues: ReactModule (copy), FriendsChatDependencyContextModule (copy), config (copy)
	return ReactModule.createElement(FriendsChatDependencyContextModule.Provider, { value = config }, p1.children)
end