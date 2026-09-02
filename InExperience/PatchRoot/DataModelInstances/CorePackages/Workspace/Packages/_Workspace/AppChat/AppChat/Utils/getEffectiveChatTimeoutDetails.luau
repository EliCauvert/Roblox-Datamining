local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local _ = require(script.Parent.serializeChatTimeoutRange)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return function(p1, p2, p3, p4)
	-- upvalues: fFlagAppChatReactiveFeatureRestrictions (ref), conversationChannelsModule (ref)
	local var1
	p4 = p4 or DateTime.now().UnixTimestamp
	local var2 = if p1 and p1.endTimestamp then p1.endTimestamp else 0
	local var3 = if p2 and p2.endTimestamp then p2.endTimestamp else 0
	local var4 = (fFlagAppChatReactiveFeatureRestrictions and (p1 ~= nil and p1.requiresAcknowledgement == true)) or (fFlagAppChatReactiveFeatureRestrictions and (p2 ~= nil and p2.requiresAcknowledgement == true))
	local var5 = if var2 < var3 then p2 else p1
	local maxValue = math.max(var2, var3)
	local t = {}
	
	if p4 >= maxValue then
		var1 = var4 and p3 ~= conversationChannelsModule.ModerationType.TrustedComms
	end
	t.isTimedOut = var1
	t.timeoutEndTimestamp = maxValue
	t.decisionEventId = if var5 then var5.decisionEventId else nil
	t.duration = if var5 then var5.duration else nil
	t.requiresAcknowledgement = if fFlagAppChatReactiveFeatureRestrictions then var4 else nil
	
	return t
end