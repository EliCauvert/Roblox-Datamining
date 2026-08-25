local parent = script:FindFirstAncestor("FriendsChat").Parent
local conversationChannelsModule = require(parent.AppChat.ConversationChannels)
local _ = require(parent.AppChat.GetConversationListStore)
local isUserPendingModule = require(parent.AppChat.isUserPending)

return function(p0)
	-- upvalues: isUserPendingModule (ref), conversationChannelsModule (ref)
	p0 = p0 or {}
	local var3 = 0
	local var4 = 0
	
	for i, v in p0 do
		if isUserPendingModule(v) then
			var3 += 1
		end
		if v.moderationType == conversationChannelsModule.ModerationType.TrustedComms then
			var4 += 1
		end
	end
	return {
		chatLandingListCount = #p0,
		pendingConversationCount = var3,
		unfilteredConversationCount = var4
	}
end