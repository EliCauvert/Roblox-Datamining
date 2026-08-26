local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local _ = require(parent.Promise)
local fetchConversationDetailsToSignalsModule = require(parent.AppChat.fetchConversationDetailsToSignals)
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local getFriendsChatNavigationStoreModule = require(friendsChat.Stores.GetFriendsChatNavigationStore)

return function(p1)
	-- upvalues: fetchConversationDetailsToSignalsModule (ref), getConversationStoreModule (ref), getFriendsChatNavigationStoreModule (ref)
	return fetchConversationDetailsToSignalsModule(p1):andThen(function()
		-- upvalues: getConversationStoreModule (copy), p1 (ref), getFriendsChatNavigationStoreModule (copy)
		if getConversationStoreModule(false).getConversation(p1, false) == nil then
			return false
		end
		getFriendsChatNavigationStoreModule(false).setSelectedConversationId(p1)
		
		return true
	end, function()
		return false
	end)
end