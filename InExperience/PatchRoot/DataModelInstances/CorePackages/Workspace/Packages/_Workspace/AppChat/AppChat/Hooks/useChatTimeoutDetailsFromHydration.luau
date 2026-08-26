local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)
local createCurrentTimeSignal = require(parent.SignalsUtils).createCurrentTimeSignal
local _ = require(appChat.Models.ConversationChannels)
local getChatModerationStatusDataHydrationModule = require(appChat.Stores.GetChatModerationStatusDataHydration)
local getEffectiveChatTimeoutDetailsModule = require(appChat.Utils.getEffectiveChatTimeoutDetails)
local _ = require(appChat.Utils.serializeChatTimeoutRange)

local function areChatTimeoutDetailsEqual(p1, p2)
	return p1.isTimedOut == p2.isTimedOut and (p1.timeoutEndTimestamp == p2.timeoutEndTimestamp and (p1.decisionEventId == p2.decisionEventId and p1.duration == p2.duration))
end

local function _(p1)
	return if p1 == nil or p1.status ~= "active" then nil else {
		endTimestamp = p1.endTimestamp,
		decisionEventId = p1.decisionEventId,
		duration = p1.duration
	}
end

return function(p1)
	-- upvalues: reactModule (ref), createCurrentTimeSignal (ref), getChatModerationStatusDataHydrationModule (ref), signalsModule (ref), getEffectiveChatTimeoutDetailsModule (ref), dataHydrationModule (ref), areChatTimeoutDetailsEqual (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: createCurrentTimeSignal (copy)
		return createCurrentTimeSignal(1)
	end, {})
	local var2 = getChatModerationStatusDataHydrationModule(false)
	local userStatus = var2.getUserStatus()
	local var3 = if p1.conversationId then var2.getConversationStatus(p1.conversationId) else userStatus
	local conversationId = p1.conversationId
	
	return reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), userStatus (ref), var3 (ref), getEffectiveChatTimeoutDetailsModule (copy), dataHydrationModule (copy), conversationId (ref), p1 (ref), var1 (ref), areChatTimeoutDetailsEqual (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: userStatus (copy), var3 (copy), getEffectiveChatTimeoutDetailsModule (copy), dataHydrationModule (copy), conversationId (copy), p1 (copy), var1 (copy)
			local var4 = userStatus.data(p2)
			local var5 = var3.data(p2)
			
			return getEffectiveChatTimeoutDetailsModule(if userStatus.status(p2) == dataHydrationModule.DataStatus.Failed then nil elseif var4 == nil or var4.status ~= "active" then nil else {
				endTimestamp = var4.endTimestamp,
				decisionEventId = var4.decisionEventId,
				duration = var4.duration
			}, if not conversationId or var3.status(p2) == dataHydrationModule.DataStatus.Failed then if var5 == nil or var5.status ~= "active" then nil else {
				endTimestamp = var5.endTimestamp,
				decisionEventId = var5.decisionEventId,
				duration = var5.duration
			} else nil, p1.conversationModerationType, var1(p2))
		end, areChatTimeoutDetailsEqual)
	end, {
		conversationId, var3.data, var3.status, var1, p1.conversationModerationType,
		userStatus.data, userStatus.status
	})
end