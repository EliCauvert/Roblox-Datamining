local AppChat = script:FindFirstAncestor("AppChat")
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local _ = require(script.Parent.serializeChatTimeoutRange)
local FFlagAppChatEnforceTimeoutsOnUnfilteredChatModule = require(AppChat.Flags.FFlagAppChatEnforceTimeoutsOnUnfilteredChat)
local FFlagAppChatReactiveFeatureRestrictions = require(AppChat.Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return function(p1, p2, TrustedComms, p3)
	-- upvalues: FFlagAppChatReactiveFeatureRestrictions (copy), FFlagAppChatEnforceTimeoutsOnUnfilteredChatModule (copy), ConversationChannelsModule (copy)
	local EndTimestamp = if p1 and p1.endTimestamp then p1.endTimestamp else 0
	local EndTimestamp1 = if p2 and p2.endTimestamp then p2.endTimestamp else 0
	local IsRequiresAcknowledgement: boolean = FFlagAppChatReactiveFeatureRestrictions and (p2 ~= nil and p2.requiresAcknowledgement == true)
	local IsRequiresAcknowledgement1: boolean = FFlagAppChatReactiveFeatureRestrictions and (p1 ~= nil and p1.requiresAcknowledgement == true) or IsRequiresAcknowledgement
	local IsEndTimestampBelow = EndTimestamp < EndTimestamp1
	local v1 = if IsEndTimestampBelow then p2 else p1
	local Largest = math.max(EndTimestamp, EndTimestamp1)
	local IsLargestAbove: boolean = (p3 or DateTime.now().UnixTimestamp) < Largest or IsRequiresAcknowledgement1
	
	return {
		isTimedOut = if FFlagAppChatEnforceTimeoutsOnUnfilteredChatModule then IsLargestAbove else IsLargestAbove and TrustedComms ~= ConversationChannelsModule.ModerationType.TrustedComms,
		timeoutEndTimestamp = Largest,
		decisionEventId = if v1 then v1.decisionEventId else nil,
		duration = if v1 then v1.duration else nil,
		requiresAcknowledgement = if FFlagAppChatReactiveFeatureRestrictions then IsRequiresAcknowledgement1 else nil
	}
end