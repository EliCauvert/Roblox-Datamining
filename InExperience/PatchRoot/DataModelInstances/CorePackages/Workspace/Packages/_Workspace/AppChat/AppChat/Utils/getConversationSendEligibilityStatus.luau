local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.Signals)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local _ = require(appChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(appChat.Stores.GetConversationStore)
local useIsUserPendingModule = require(appChat.Hooks.useIsUserPending)
local fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule = require(appChat.Flags.FFlagAppChatEnforceTimeoutsOnUnfilteredChat)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

local function _(p1, p2, p3)
	-- upvalues: fFlagAppChatReactiveFeatureRestrictions (ref), fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule (ref), conversationChannelsModule (ref)
	local var1 = p1 ~= nil and (p1.status == "active" and (if p3 >= p1.endTimestamp then fFlagAppChatReactiveFeatureRestrictions and p1.requiresAcknowledgement == true else true))
	
	return if fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule then var1 else var1 and p2 ~= conversationChannelsModule.ModerationType.TrustedComms
end

local _ = function(p1)
	-- upvalues: conversationChannelsModule (ref), useIsUserPendingModule (ref)
	return p1.participantPendingStatus == conversationChannelsModule.UserPendingStatus.Pending or useIsUserPendingModule(p1)
end

return function(p1)
	-- upvalues: conversationChannelsModule (ref), useIsUserPendingModule (ref), dataHydrationModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule (ref)
	local conversation = p1.conversation
	
	if not p1.isAvailable then
		return "ineligible"
	elseif not p1.isGroupChatEnabled and conversation.conversationType == "MultiUserConversation" then
		return "ineligible"
	elseif conversation.participantPendingStatus == conversationChannelsModule.UserPendingStatus.Pending or useIsUserPendingModule(conversation) then
		return "ineligible"
	end
	local userStatus = p1.timeoutStore.getUserStatus()
	local var1 = userStatus.status(p1.scope)
	
	if var1 == dataHydrationModule.DataStatus.NotReady then
		return "loading"
	elseif var1 ~= dataHydrationModule.DataStatus.Failed then
		local var2 = userStatus.data(p1.scope)
		local var3 = var2 ~= nil and (var2.status == "active" and (if p1.currentTimestamp >= var2.endTimestamp then fFlagAppChatReactiveFeatureRestrictions and var2.requiresAcknowledgement == true else true))
		
		if if fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule then var3 else var3 and conversation.moderationType ~= conversationChannelsModule.ModerationType.TrustedComms then
			return "ineligible"
		elseif conversation.source == "friends" then
			return "eligible"
		end
		local conversationStatus = p1.timeoutStore.getConversationStatus(conversation.id)
		local var4 = conversationStatus.status(p1.scope)
		
		if not p1.allowConversationStatusLoading and var4 == dataHydrationModule.DataStatus.NotReady then
			return "loading"
		elseif var4 ~= dataHydrationModule.DataStatus.Failed then
			local var5 = conversationStatus.data(p1.scope)
			local var6 = var5 ~= nil and (var5.status == "active" and (if p1.currentTimestamp >= var5.endTimestamp then fFlagAppChatReactiveFeatureRestrictions and var5.requiresAcknowledgement == true else true))
			
			return if if fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule then var6 else var6 and conversation.moderationType ~= conversationChannelsModule.ModerationType.TrustedComms then "ineligible" else "eligible"
		end
	end
end