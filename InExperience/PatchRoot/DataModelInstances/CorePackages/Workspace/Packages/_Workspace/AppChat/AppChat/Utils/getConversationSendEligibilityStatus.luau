local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.Signals)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local _ = require(appChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(appChat.Stores.GetConversationStore)
local useIsUserPendingModule = require(appChat.Hooks.useIsUserPending)
local getEffectiveChatTimeoutDetailsModule = require(appChat.Utils.getEffectiveChatTimeoutDetails)
local getUserSendEligibilityStatusModule = require(appChat.Utils.getUserSendEligibilityStatus)
local toTimeoutEntryModule = require(appChat.Utils.toTimeoutEntry)
local fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule = require(appChat.Flags.FFlagAppChatEnforceTimeoutsOnUnfilteredChat)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local fFlagShareSheetFriendsSort = require(parent.SharedFlags).FFlagShareSheetFriendsSort
local var1 = if fFlagShareSheetFriendsSort then function(p1, _, p2)
	-- upvalues: getEffectiveChatTimeoutDetailsModule (ref), toTimeoutEntryModule (ref)
	return getEffectiveChatTimeoutDetailsModule(nil, toTimeoutEntryModule(p1), nil, p2).isTimedOut
end else function(p1, p2, p3)
	-- upvalues: fFlagAppChatReactiveFeatureRestrictions (ref), fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule (ref), conversationChannelsModule (ref)
	local var2 = p1 ~= nil and (p1.status == "active" and (if p3 >= p1.endTimestamp then fFlagAppChatReactiveFeatureRestrictions and p1.requiresAcknowledgement == true else true))
	
	return if fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule then var2 else var2 and p2 ~= conversationChannelsModule.ModerationType.TrustedComms
end

local function _(p1)
	-- upvalues: conversationChannelsModule (ref), useIsUserPendingModule (ref)
	return p1.participantPendingStatus == conversationChannelsModule.UserPendingStatus.Pending or useIsUserPendingModule(p1)
end

return function(p1)
	-- upvalues: conversationChannelsModule (ref), useIsUserPendingModule (ref), fFlagShareSheetFriendsSort (ref), getUserSendEligibilityStatusModule (ref), dataHydrationModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule (ref), var1 (ref)
	local conversation = p1.conversation
	
	if not p1.isAvailable then
		return "ineligible"
	elseif not p1.isGroupChatEnabled and conversation.conversationType == "MultiUserConversation" then
		return "ineligible"
	elseif conversation.participantPendingStatus == conversationChannelsModule.UserPendingStatus.Pending or useIsUserPendingModule(conversation) then
		return "ineligible"
	elseif fFlagShareSheetFriendsSort then
		local var2 = getUserSendEligibilityStatusModule({
			currentTimestamp = p1.currentTimestamp,
			isAvailable = p1.isAvailable,
			scope = p1.scope
		})
		
		if var2 ~= "eligible" then
			return var2
		elseif conversation.source == "friends" then
			return "eligible"
		end
		local conversationStatus = p1.timeoutStore.getConversationStatus(conversation.id)
		local var3 = conversationStatus.status(p1.scope)
		
		return if not (not p1.allowConversationStatusLoading and var3 == dataHydrationModule.DataStatus.NotReady) then if var3 == dataHydrationModule.DataStatus.Failed or not var1(conversationStatus.data(p1.scope), conversation.moderationType, p1.currentTimestamp) then "eligible" else "ineligible" else "loading"
	else
		local userStatus = p1.timeoutStore.getUserStatus()
		local var4 = userStatus.status(p1.scope)
		
		if var4 == dataHydrationModule.DataStatus.NotReady then
			return "loading"
		elseif var4 ~= dataHydrationModule.DataStatus.Failed then
			local var5 = userStatus.data(p1.scope)
			local var6 = var5 ~= nil and (var5.status == "active" and (if p1.currentTimestamp >= var5.endTimestamp then fFlagAppChatReactiveFeatureRestrictions and var5.requiresAcknowledgement == true else true))
			
			if if fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule then var6 else var6 and conversation.moderationType ~= conversationChannelsModule.ModerationType.TrustedComms then
				return "ineligible"
			end
		end
	end
end