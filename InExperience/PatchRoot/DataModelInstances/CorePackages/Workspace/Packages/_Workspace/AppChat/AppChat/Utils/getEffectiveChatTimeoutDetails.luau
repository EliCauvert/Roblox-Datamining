local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local _ = require(script.Parent.serializeChatTimeoutRange)
local fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule = require(appChat.Flags.FFlagAppChatEnforceTimeoutsOnUnfilteredChat)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return function(p1, p2, p3, p4)
	-- upvalues: fFlagAppChatReactiveFeatureRestrictions (ref), fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule (ref), conversationChannelsModule (ref)
	p4 = p4 or DateTime.now().UnixTimestamp
	local var1 = if p1 and p1.endTimestamp then p1.endTimestamp else 0
	local var2 = if p2 and p2.endTimestamp then p2.endTimestamp else 0
	local var3 = (fFlagAppChatReactiveFeatureRestrictions and (p1 ~= nil and p1.requiresAcknowledgement == true)) or (fFlagAppChatReactiveFeatureRestrictions and (p2 ~= nil and p2.requiresAcknowledgement == true))
	local var4 = if var1 < var2 then p2 else p1
	local maxValue = math.max(var1, var2)
	local var5 = if p4 >= maxValue then var3 else true
	
	return {
		isTimedOut = if fFlagAppChatEnforceTimeoutsOnUnfilteredChatModule then var5 else var5 and p3 ~= conversationChannelsModule.ModerationType.TrustedComms,
		timeoutEndTimestamp = maxValue,
		decisionEventId = if var4 then var4.decisionEventId else nil,
		duration = if var4 then var4.duration else nil,
		requiresAcknowledgement = if fFlagAppChatReactiveFeatureRestrictions then var3 else nil
	}
end