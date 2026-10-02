local friendsChat = script:FindFirstAncestor("FriendsChat")
local getFriendsChatNavigationStoreModule = require(friendsChat.Stores.GetFriendsChatNavigationStore)
local fFlagFriendsChatConversationListFocusNav = require(friendsChat.Parent.SharedFlags).FFlagFriendsChatConversationListFocusNav

local function _(p1)
	-- upvalues: fFlagFriendsChatConversationListFocusNav (ref)
	return if fFlagFriendsChatConversationListFocusNav then p1.getEffectiveConversationId(false) else p1.getSelectedConversationId(false)
end

return {
	canFocus = function()
		-- upvalues: fFlagFriendsChatConversationListFocusNav (ref), getFriendsChatNavigationStoreModule (ref)
		if fFlagFriendsChatConversationListFocusNav then
			return true
		end
		local var1 = getFriendsChatNavigationStoreModule(false)
		
		return (if fFlagFriendsChatConversationListFocusNav then var1.getEffectiveConversationId(false) else var1.getSelectedConversationId(false)) ~= nil
	end,
	focus = function(_)
		-- upvalues: getFriendsChatNavigationStoreModule (ref), fFlagFriendsChatConversationListFocusNav (ref)
		local var1 = getFriendsChatNavigationStoreModule(false)
		
		if fFlagFriendsChatConversationListFocusNav then
			if (if fFlagFriendsChatConversationListFocusNav then var1.getEffectiveConversationId(false) else var1.getSelectedConversationId(false)) == nil then
				var1.requestFocusConversationList()
			else
				var1.requestFocusInputBar()
			end
			return nil
		elseif var1.getSelectedConversationId(false) == nil then
			return Enum.ContextActionResult.Pass
		elseif var1.getIsInputBarFocused(false) then
			return Enum.ContextActionResult.Pass
		end
		var1.requestFocusInputBar()
		
		return Enum.ContextActionResult.Sink
	end
}