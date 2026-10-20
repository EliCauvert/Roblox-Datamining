local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local FriendsChatFocusModule = require(Parent.FriendsChat.FriendsChatFocus)
local GetFocusNavigationStoreModule = require(ExpChat.Stores.GetFocusNavigationStore)
local TabTypes = require(Parent.ExpChatShared).TabTypes
local config = {
	canOpenChat = function(): boolean
		return false
	end,
	focus = function(_)
		-- upvalues: GetFocusNavigationStoreModule (copy)
		GetFocusNavigationStoreModule(false).requestChatInputBarFocus()
		
		return Enum.ContextActionResult.Sink
	end
}
local config1 = {
	canOpenChat = FriendsChatFocusModule.canFocus,
	focus = function(p1)
		-- upvalues: FriendsChatFocusModule (copy)
		return FriendsChatFocusModule.focus(p1.keyCode)
	end
}

return function(p1)
	-- upvalues: config1 (copy), config (copy), TabTypes (copy)
	return if p1 == "FriendsChat" then config1 elseif p1 == "TextChat" then config elseif p1 == "UniverseChat" then config else TabTypes.unreachable(p1)
end