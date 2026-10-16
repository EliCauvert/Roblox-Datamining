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
local FFlagAppChatEnforceTimeoutsOnUnfilteredChatModule = require(AppChat.Flags.FFlagAppChatEnforceTimeoutsOnUnfilteredChat)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort

local function isActiveTimeout(p1, TrustedComms, p2): boolean --[[ Line: 38 ]]
	-- upvalues: FFlagAppChatReactiveFeatureRestrictions (copy), FFlagAppChatEnforceTimeoutsOnUnfilteredChatModule (copy), ConversationChannelsModule (copy)
	local IsEndTimestampAbove: boolean = p1 ~= nil and (p1.status == "active" and (p2 < p1.endTimestamp or FFlagAppChatReactiveFeatureRestrictions and p1.requiresAcknowledgement == true))
	
	return if FFlagAppChatEnforceTimeoutsOnUnfilteredChatModule then IsEndTimestampAbove else IsEndTimestampAbove and TrustedComms ~= ConversationChannelsModule.ModerationType.TrustedComms
end

local Callback = if FFlagShareSheetFriendsSort then function(p1, _, p2) --[[ Line: 57 ]]
	-- upvalues: GetEffectiveChatTimeoutDetailsModule (copy), ToTimeoutEntryModule (copy)
	return GetEffectiveChatTimeoutDetailsModule(nil, ToTimeoutEntryModule(p1), nil, p2).isTimedOut
end else isActiveTimeout

local function _(p1) --[[ Line: 62 | Named "isConversationPending" ]]
	-- upvalues: ConversationChannelsModule (copy), UseIsUserPendingModule (copy)
	return p1.participantPendingStatus == ConversationChannelsModule.UserPendingStatus.Pending or UseIsUserPendingModule(p1)
end

return function(p1) --[[ Line: 67 | Named "getConversationSendEligibilityStatus" ]]
	-- upvalues: ConversationChannelsModule (copy), UseIsUserPendingModule (copy), FFlagShareSheetFriendsSort (copy), GetUserSendEligibilityStatusModule (copy), DataHydrationModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy), FFlagAppChatEnforceTimeoutsOnUnfilteredChatModule (copy), Callback (copy)
	local Conversation = p1.conversation
	
	if not p1.isAvailable then
		return "ineligible"
	end
	if not p1.isGroupChatEnabled and Conversation.conversationType == "MultiUserConversation" then
		return "ineligible"
	end
	if Conversation.participantPendingStatus == ConversationChannelsModule.UserPendingStatus.Pending or UseIsUserPendingModule(Conversation) then
		return "ineligible"
	end
	if FFlagShareSheetFriendsSort then
		local UserSendEligibilityStatusModule = GetUserSendEligibilityStatusModule({
			currentTimestamp = p1.currentTimestamp,
			isAvailable = p1.isAvailable,
			scope = p1.scope
		})
		
		if UserSendEligibilityStatusModule ~= "eligible" then
			return UserSendEligibilityStatusModule
		end
	else
		local UserStatus = p1.timeoutStore.getUserStatus()
		local StatusResult = UserStatus.status(p1.scope)
		
		if StatusResult == DataHydrationModule.DataStatus.NotReady then
			return "loading"
		end
		if StatusResult ~= DataHydrationModule.DataStatus.Failed then
			local DataResult = UserStatus.data(p1.scope)
			local ModerationType = Conversation.moderationType
			local CurrentTimestamp = p1.currentTimestamp
			local IsCurrentTimestampBelow: boolean = DataResult ~= nil and (DataResult.status == "active" and (CurrentTimestamp < DataResult.endTimestamp or FFlagAppChatReactiveFeatureRestrictions and DataResult.requiresAcknowledgement == true))
			
			if if FFlagAppChatEnforceTimeoutsOnUnfilteredChatModule then IsCurrentTimestampBelow else IsCurrentTimestampBelow and ModerationType ~= ConversationChannelsModule.ModerationType.TrustedComms then
				return "ineligible"
			end
		end
	end
	if Conversation.source == "friends" then
		return "eligible"
	else
		local ConversationStatus = p1.timeoutStore.getConversationStatus(Conversation.id)
		local StatusResult = ConversationStatus.status(p1.scope)
		
		return if p1.allowConversationStatusLoading or StatusResult ~= DataHydrationModule.DataStatus.NotReady then if StatusResult == DataHydrationModule.DataStatus.Failed or not Callback(ConversationStatus.data(p1.scope), Conversation.moderationType, p1.currentTimestamp) then "eligible" else "ineligible" else "loading"
	end
end