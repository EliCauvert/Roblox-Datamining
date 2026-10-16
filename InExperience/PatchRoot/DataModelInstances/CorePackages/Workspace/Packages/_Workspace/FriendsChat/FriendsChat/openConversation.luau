local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local _ = require(Parent.Promise)
local FetchConversationDetailsToSignalsModule = require(Parent.AppChat.fetchConversationDetailsToSignals)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local GetFriendsChatNavigationStoreModule = require(FriendsChat.Stores.GetFriendsChatNavigationStore)

return function(p1) --[[ Line: 16 | Named "openConversation" ]]
	-- upvalues: FetchConversationDetailsToSignalsModule (copy), GetConversationStoreModule (copy), GetFriendsChatNavigationStoreModule (copy)
	return FetchConversationDetailsToSignalsModule(p1):andThen(function(): boolean --[[ Line: 17 ]]
		-- upvalues: GetConversationStoreModule (upval), p1 (copy), GetFriendsChatNavigationStoreModule (upval)
		if GetConversationStoreModule(false).getConversation(p1, false) == nil then
			return false
		else
			GetFriendsChatNavigationStoreModule(false).setSelectedConversationId(p1)
			
			return true
		end
	end, function(): boolean --[[ Line: 24 ]]
		return false
	end)
end