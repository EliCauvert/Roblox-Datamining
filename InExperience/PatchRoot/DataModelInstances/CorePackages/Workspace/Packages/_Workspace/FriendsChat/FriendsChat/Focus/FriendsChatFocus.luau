local getFriendsChatNavigationStoreModule = require(script:FindFirstAncestor("FriendsChat").Stores.GetFriendsChatNavigationStore)

return {
	canFocus = function()
		-- upvalues: getFriendsChatNavigationStoreModule (ref)
		return getFriendsChatNavigationStoreModule(false).getSelectedConversationId(false) ~= nil
	end,
	focus = function(_)
		-- upvalues: getFriendsChatNavigationStoreModule (ref)
		local var1 = getFriendsChatNavigationStoreModule(false)
		
		if var1.getSelectedConversationId(false) == nil then
			return Enum.ContextActionResult.Pass
		elseif var1.getIsInputBarFocused(false) then
			return Enum.ContextActionResult.Pass
		end
		var1.requestFocusInputBar()
		
		return Enum.ContextActionResult.Sink
	end
}