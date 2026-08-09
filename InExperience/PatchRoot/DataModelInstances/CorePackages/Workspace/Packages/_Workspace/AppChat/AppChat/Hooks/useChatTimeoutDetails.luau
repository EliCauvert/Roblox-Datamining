local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.installReducer.ChatTimeouts)
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local luauPolyfillModule = require(parent.LuauPolyfill)
local clearTimeout = luauPolyfillModule.clearTimeout
local setTimeout = luauPolyfillModule.setTimeout
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local currentConversationTimeoutEndedModule = require(appChat.Conversations.Actions.CurrentConversationTimeoutEnded)

return function(p0) --[[ line: 20 | named "useChatTimeoutDetails" ]]
	-- upvalues: useDispatch (ref), useSelector (ref), getDeepValue2Module (ref), conversationChannelsModule (ref), reactModule (ref), setTimeout (ref), currentConversationTimeoutEndedModule (ref), clearTimeout (ref)
	local conversationId = p0.conversationId
	local var6 = useDispatch()
	local var7 = useSelector(function(p1) --[[ line: 23 ]]
		-- upvalues: getDeepValue2Module (copy), conversationId (ref)
		return {
			userTimeout = getDeepValue2Module(p1, "ChatAppReducer.ChatTimeouts.userTimeout"),
			conversationTimeout = getDeepValue2Module(p1, `ChatAppReducer.ChatTimeouts.byConversationId.{conversationId}`)
		}
	end)
	local unixTimestamp = DateTime.now().UnixTimestamp
	local var8 = if var7.userTimeout then var7.userTimeout.endTimestamp else 0
	local var9 = if var7.conversationTimeout then var7.conversationTimeout.endTimestamp else 0
	local maxValue = math.max(var8, var9)
	local var11 = unixTimestamp < maxValue and p0.conversationModerationType ~= conversationChannelsModule.ModerationType.TrustedComms
	local var12 = if var8 < var9 then var7.conversationTimeout and var7.conversationTimeout.decisionEventId else var7.userTimeout and var7.userTimeout.decisionEventId
	local var13 = if var8 < var9 then var7.conversationTimeout and var7.conversationTimeout.duration else var7.userTimeout and var7.userTimeout.duration
	reactModule.useEffect(function() --[[ line: 44 ]]
		-- upvalues: var11 (ref), setTimeout (copy), var6 (ref), currentConversationTimeoutEndedModule (copy), conversationId (ref), maxValue (ref), unixTimestamp (ref), clearTimeout (copy)
		local var14 = if var11 then setTimeout(function() --[[ line: 47 ]]
			-- upvalues: var6 (copy), currentConversationTimeoutEndedModule (copy), conversationId (copy)
			var6(currentConversationTimeoutEndedModule(conversationId))
		end, (maxValue - unixTimestamp + 1) * 1000) else nil
		
		return function() --[[ line: 51 ]]
			-- upvalues: var14 (write), clearTimeout (copy)
			if var14 then
				clearTimeout(var14)
			end
		end
	end, { var11, maxValue, p0.conversationId })
	
	return {
		isTimedOut = var11,
		timeoutEndTimestamp = maxValue,
		decisionEventId = var12,
		duration = var13
	}
end