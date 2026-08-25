local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local _ = require(parent.Promise)
local fetchConversationDetailsToSignalsModule = require(parent.AppChat.fetchConversationDetailsToSignals)
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local getFriendsChatNavigationStoreModule = require(friendsChat.Stores.GetFriendsChatNavigationStore)

return function(p0)
	-- upvalues: fetchConversationDetailsToSignalsModule (ref), getConversationStoreModule (ref), getFriendsChatNavigationStoreModule (ref)
	return fetchConversationDetailsToSignalsModule(p0):andThen(function()
		-- upvalues: getConversationStoreModule (copy), p0 (ref), getFriendsChatNavigationStoreModule (copy)
		if getConversationStoreModule(false).getConversation(p0, false) == nil then
			return false
		end
		getFriendsChatNavigationStoreModule(false).setSelectedConversationId(p0)
		
		return true
	end, function()
		return false
	end)
end