local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.Signals)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local _ = require(appChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(appChat.Stores.GetConversationStore)
local useIsUserPendingModule = require(appChat.Hooks.useIsUserPending)

local function _(p0, p1, p2) --[[ line: 31 | named "isActiveTimeout" ]]
	-- upvalues: conversationChannelsModule (ref)
	return p0 ~= nil and (p0.status == "active" and (p2 < p0.endTimestamp and p1 ~= conversationChannelsModule.ModerationType.TrustedComms))
end

local _ = function(p3) --[[ line: 42 | named "isConversationPending" ]]
	-- upvalues: conversationChannelsModule (ref), useIsUserPendingModule (ref)
	return p3.participantPendingStatus == conversationChannelsModule.UserPendingStatus.Pending or useIsUserPendingModule(p3)
end

return function(p4) --[[ line: 47 | named "getConversationSendEligibilityStatus" ]]
	-- upvalues: conversationChannelsModule (ref), useIsUserPendingModule (ref), dataHydrationModule (ref)
	local conversation = p4.conversation
	
	if not p4.isAvailable then
		return "ineligible"
	elseif not p4.isGroupChatEnabled and conversation.conversationType == "MultiUserConversation" then
		return "ineligible"
	elseif conversation.participantPendingStatus == conversationChannelsModule.UserPendingStatus.Pending or useIsUserPendingModule(conversation) then
		return "ineligible"
	end
	local userStatus = p4.timeoutStore.getUserStatus()
	local var5 = userStatus.status(p4.scope)
	
	if var5 == dataHydrationModule.DataStatus.NotReady then
		return "loading"
	elseif var5 ~= dataHydrationModule.DataStatus.Failed then
		local var6 = userStatus.data(p4.scope)
		
		if var6 ~= nil and (var6.status == "active" and (p4.currentTimestamp < var6.endTimestamp and conversation.moderationType ~= conversationChannelsModule.ModerationType.TrustedComms)) then
			return "ineligible"
		elseif conversation.source == "friends" then
			return "eligible"
		end
		local conversationStatus = p4.timeoutStore.getConversationStatus(conversation.id)
		local var8 = conversationStatus.status(p4.scope)
		
		if not p4.allowConversationStatusLoading and var8 == dataHydrationModule.DataStatus.NotReady then
			return "loading"
		elseif var8 ~= dataHydrationModule.DataStatus.Failed then
			local var9 = conversationStatus.data(p4.scope)
			
			return if var9 ~= nil and (var9.status == "active" and (p4.currentTimestamp < var9.endTimestamp and conversation.moderationType ~= conversationChannelsModule.ModerationType.TrustedComms)) then "ineligible" else "eligible"
		end
	end
end