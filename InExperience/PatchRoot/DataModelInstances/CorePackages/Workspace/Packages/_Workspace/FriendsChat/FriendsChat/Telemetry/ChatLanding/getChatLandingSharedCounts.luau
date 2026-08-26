local parent = script:FindFirstAncestor("FriendsChat").Parent
local conversationChannelsModule = require(parent.AppChat.ConversationChannels)
local _ = require(parent.AppChat.GetConversationListStore)
local isUserPendingModule = require(parent.AppChat.isUserPending)

return function(p1)
	-- upvalues: isUserPendingModule (ref), conversationChannelsModule (ref)
	p1 = p1 or {}
	local var1 = 0
	local var2 = 0
	
	for i, v in p1 do
		if isUserPendingModule(v) then
			var1 += 1
		end
		if v.moderationType == conversationChannelsModule.ModerationType.TrustedComms then
			var2 += 1
		end
	end
	return {
		chatLandingListCount = #p1,
		pendingConversationCount = var1,
		unfilteredConversationCount = var2
	}
end