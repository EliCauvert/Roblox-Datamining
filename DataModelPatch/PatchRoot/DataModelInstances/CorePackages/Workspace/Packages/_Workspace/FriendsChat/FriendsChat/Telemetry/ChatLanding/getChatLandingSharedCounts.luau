local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ConversationChannelsModule = require(Parent.AppChat.ConversationChannels)
local _ = require(Parent.AppChat.GetConversationListStore)
local IsUserPendingModule = require(Parent.AppChat.isUserPending)

return function(p1)
	-- upvalues: IsUserPendingModule (copy), ConversationChannelsModule (copy)
	local P0 = p1 or {}
	local PendingConversationCount = 0
	local UnfilteredConversationCount = 0
	
	for _, value in P0 do
		if IsUserPendingModule(value) then
			PendingConversationCount += 1
		end
		if value.moderationType == ConversationChannelsModule.ModerationType.TrustedComms then
			UnfilteredConversationCount += 1
		end
	end
	return {
		chatLandingListCount = #P0,
		pendingConversationCount = PendingConversationCount,
		unfilteredConversationCount = UnfilteredConversationCount
	}
end