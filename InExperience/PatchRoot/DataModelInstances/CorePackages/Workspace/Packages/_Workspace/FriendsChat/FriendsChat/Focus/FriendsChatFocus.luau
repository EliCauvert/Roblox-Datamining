local FriendsChat = script:FindFirstAncestor("FriendsChat")
local GetFriendsChatNavigationStoreModule = require(FriendsChat.Stores.GetFriendsChatNavigationStore)
local FFlagFriendsChatConversationListFocusNav = require(FriendsChat.Parent.SharedFlags).FFlagFriendsChatConversationListFocusNav

local function _(p1)
	-- upvalues: FFlagFriendsChatConversationListFocusNav (copy)
	return if FFlagFriendsChatConversationListFocusNav then p1.getEffectiveConversationId(false) else p1.getSelectedConversationId(false)
end

return {
	canFocus = function(): boolean
		-- upvalues: FFlagFriendsChatConversationListFocusNav (copy), GetFriendsChatNavigationStoreModule (copy)
		if FFlagFriendsChatConversationListFocusNav then
			return true
		else
			local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
			
			return (if FFlagFriendsChatConversationListFocusNav then FriendsChatNavigationStoreModule.getEffectiveConversationId(false) else FriendsChatNavigationStoreModule.getSelectedConversationId(false)) ~= nil
		end
	end,
	focus = function(_)
		-- upvalues: GetFriendsChatNavigationStoreModule (copy), FFlagFriendsChatConversationListFocusNav (copy)
		local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
		
		if FFlagFriendsChatConversationListFocusNav then
			if (if FFlagFriendsChatConversationListFocusNav then FriendsChatNavigationStoreModule.getEffectiveConversationId(false) else FriendsChatNavigationStoreModule.getSelectedConversationId(false)) == nil then
				FriendsChatNavigationStoreModule.requestFocusConversationList()
			else
				FriendsChatNavigationStoreModule.requestFocusInputBar()
			end
			return nil
		elseif FriendsChatNavigationStoreModule.getSelectedConversationId(false) == nil then
			return Enum.ContextActionResult.Pass
		elseif FriendsChatNavigationStoreModule.getIsInputBarFocused(false) then
			return Enum.ContextActionResult.Pass
		else
			FriendsChatNavigationStoreModule.requestFocusInputBar()
			
			return Enum.ContextActionResult.Sink
		end
	end
}