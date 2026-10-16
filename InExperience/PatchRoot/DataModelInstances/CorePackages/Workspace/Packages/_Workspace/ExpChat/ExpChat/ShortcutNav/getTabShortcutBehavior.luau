local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local FriendsChatFocusModule = require(Parent.FriendsChat.FriendsChatFocus)
local GetFocusNavigationStoreModule = require(ExpChat.Stores.GetFocusNavigationStore)
local TabTypes = require(Parent.ExpChatShared).TabTypes
local config = {
	canOpenChat = function(): boolean --[[ Line: 44 ]]
		return false
	end,
	focus = function(_) --[[ Line: 54 ]]
		-- upvalues: GetFocusNavigationStoreModule (copy)
		GetFocusNavigationStoreModule(false).requestChatInputBarFocus()
		
		return Enum.ContextActionResult.Sink
	end
}
local config1 = {
	canOpenChat = FriendsChatFocusModule.canFocus,
	focus = function(p1) --[[ Line: 64 ]]
		-- upvalues: FriendsChatFocusModule (copy)
		return FriendsChatFocusModule.focus(p1.keyCode)
	end
}

return function(p1) --[[ Line: 69 | Named "getTabShortcutBehavior" ]]
	-- upvalues: config1 (copy), config (copy), TabTypes (copy)
	return if p1 == "FriendsChat" then config1 elseif p1 == "TextChat" then config elseif p1 == "UniverseChat" then config else TabTypes.unreachable(p1)
end