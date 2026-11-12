local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.Signals)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local _ = require(AppChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(AppChat.Stores.GetConversationStore)
local UseIsUserPendingModule = require(AppChat.Hooks.useIsUserPending)
local GetEffectiveChatTimeoutDetailsModule = require(AppChat.Utils.getEffectiveChatTimeoutDetails)
local GetUserSendEligibilityStatusModule = require(AppChat.Utils.getUserSendEligibilityStatus)
local ToTimeoutEntryModule = require(AppChat.Utils.toTimeoutEntry)

local function _(p1)
	-- upvalues: ConversationChannelsModule (copy), UseIsUserPendingModule (copy)
	return p1.participantPendingStatus == ConversationChannelsModule.UserPendingStatus.Pending or UseIsUserPendingModule(p1)
end

return function(p1)
	-- upvalues: ConversationChannelsModule (copy), UseIsUserPendingModule (copy), GetUserSendEligibilityStatusModule (copy), DataHydrationModule (copy), GetEffectiveChatTimeoutDetailsModule (copy), ToTimeoutEntryModule (copy)
	local Conversation = p1.conversation
	
	if not p1.isAvailable then
		return "ineligible"
	elseif not p1.isGroupChatEnabled and Conversation.conversationType == "MultiUserConversation" then
		return "ineligible"
	elseif Conversation.participantPendingStatus == ConversationChannelsModule.UserPendingStatus.Pending or UseIsUserPendingModule(Conversation) then
		return "ineligible"
	else
		local UserSendEligibilityStatusModule = GetUserSendEligibilityStatusModule({
			currentTimestamp = p1.currentTimestamp,
			isAvailable = p1.isAvailable,
			scope = p1.scope
		})
		
		if UserSendEligibilityStatusModule ~= "eligible" then
			return UserSendEligibilityStatusModule
		elseif Conversation.source == "friends" then
			return "eligible"
		else
			local ConversationStatus = p1.timeoutStore.getConversationStatus(Conversation.id)
			local StatusResult = ConversationStatus.status(p1.scope)
			
			return if p1.allowConversationStatusLoading or StatusResult ~= DataHydrationModule.DataStatus.NotReady then if StatusResult == DataHydrationModule.DataStatus.Failed or not GetEffectiveChatTimeoutDetailsModule(nil, ToTimeoutEntryModule(ConversationStatus.data(p1.scope)), nil, p1.currentTimestamp).isTimedOut then "eligible" else "ineligible" else "loading"
		end
	end
end