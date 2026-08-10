local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local friendsChatDependencyContextModule = require(parent.FriendsChat.FriendsChatDependencyContext)
local t = { ChatWindow = require(expChat.ChatWindow.UI.ChatWindow) }

return function(p0) --[[ line: 31 | named "FriendsChatDependencyBridge" ]]
	-- upvalues: reactModule (ref), friendsChatDependencyContextModule (ref), t (ref)
	return reactModule.createElement(friendsChatDependencyContextModule.Provider, { value = t }, p0.children)
end