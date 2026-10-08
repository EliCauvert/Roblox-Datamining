local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local friendsChatFocusModule = require(parent.FriendsChat.FriendsChatFocus)
local getFocusNavigationStoreModule = require(expChat.Stores.GetFocusNavigationStore)
local tabTypes = expChatSharedModule.TabTypes
local t = {
	canOpenChat = function()
		return false
	end,
	focus = function(_)
		-- upvalues: getFocusNavigationStoreModule (ref)
		getFocusNavigationStoreModule(false).requestChatInputBarFocus()
		
		return Enum.ContextActionResult.Sink
	end
}
local t_1 = {
	canOpenChat = friendsChatFocusModule.canFocus,
	focus = function(p1)
		-- upvalues: friendsChatFocusModule (ref)
		return friendsChatFocusModule.focus(p1.keyCode)
	end
}

return function(value)
	-- upvalues: t_1 (ref), t (ref), tabTypes (ref)
	return if value == "FriendsChat" then t_1 elseif value == "TextChat" then t elseif value == "UniverseChat" then t else tabTypes.unreachable(value)
end