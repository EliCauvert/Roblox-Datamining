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

local function areChatTimeoutDetailsEqual(p0, p1)
	return p0.isTimedOut == p1.isTimedOut and (p0.timeoutEndTimestamp == p1.timeoutEndTimestamp and (p0.decisionEventId == p1.decisionEventId and p0.duration == p1.duration))
end

local function _(p2)
	return if p2 == nil or p2.status ~= "active" then nil else {
		endTimestamp = p2.endTimestamp,
		decisionEventId = p2.decisionEventId,
		duration = p2.duration
	}
end

return function(p3)
	-- upvalues: reactModule (ref), createCurrentTimeSignal (ref), getChatModerationStatusDataHydrationModule (ref), signalsModule (ref), getEffectiveChatTimeoutDetailsModule (ref), dataHydrationModule (ref), areChatTimeoutDetailsEqual (ref)
	local var7 = reactModule.useMemo(function()
		-- upvalues: createCurrentTimeSignal (copy)
		return createCurrentTimeSignal(1)
	end, {})
	local var8 = getChatModerationStatusDataHydrationModule(false)
	local userStatus = var8.getUserStatus()
	local var10 = if p3.conversationId then var8.getConversationStatus(p3.conversationId) else userStatus
	local conversationId = p3.conversationId
	
	return reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), userStatus (ref), var10 (ref), getEffectiveChatTimeoutDetailsModule (copy), dataHydrationModule (copy), conversationId (ref), p3 (ref), var7 (ref), areChatTimeoutDetailsEqual (copy)
		return signalsModule.createComputed(function(p4)
			-- upvalues: userStatus (copy), var10 (copy), getEffectiveChatTimeoutDetailsModule (copy), dataHydrationModule (copy), conversationId (copy), p3 (copy), var7 (copy)
			local var11 = userStatus.data(p4)
			local var12 = var10.data(p4)
			
			return getEffectiveChatTimeoutDetailsModule(if userStatus.status(p4) == dataHydrationModule.DataStatus.Failed then nil elseif var11 == nil or var11.status ~= "active" then nil else {
				endTimestamp = var11.endTimestamp,
				decisionEventId = var11.decisionEventId,
				duration = var11.duration
			}, if not conversationId or var10.status(p4) == dataHydrationModule.DataStatus.Failed then if var12 == nil or var12.status ~= "active" then nil else {
				endTimestamp = var12.endTimestamp,
				decisionEventId = var12.decisionEventId,
				duration = var12.duration
			} else nil, p3.conversationModerationType, var7(p4))
		end, areChatTimeoutDetailsEqual)
	end, {
		conversationId, var10.data, var10.status, var7, p3.conversationModerationType,
		userStatus.data, userStatus.status
	})
end