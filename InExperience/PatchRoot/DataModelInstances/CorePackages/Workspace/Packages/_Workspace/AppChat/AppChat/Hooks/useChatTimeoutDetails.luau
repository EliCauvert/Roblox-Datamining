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
local _ = require(appChat.Models.ConversationChannels)
local currentConversationTimeoutEndedModule = require(appChat.Conversations.Actions.CurrentConversationTimeoutEnded)
local getEffectiveChatTimeoutDetailsModule = require(appChat.Utils.getEffectiveChatTimeoutDetails)

return function(p0)
	-- upvalues: useDispatch (ref), useSelector (ref), getDeepValue2Module (ref), getEffectiveChatTimeoutDetailsModule (ref), reactModule (ref), setTimeout (ref), currentConversationTimeoutEndedModule (ref), clearTimeout (ref)
	local conversationId = p0.conversationId
	local var6 = useDispatch()
	local var7 = useSelector(function(p1)
		-- upvalues: getDeepValue2Module (copy), conversationId (ref)
		return {
			userTimeout = getDeepValue2Module(p1, "ChatAppReducer.ChatTimeouts.userTimeout"),
			conversationTimeout = getDeepValue2Module(p1, `ChatAppReducer.ChatTimeouts.byConversationId.{conversationId}`)
		}
	end)
	local var8 = getEffectiveChatTimeoutDetailsModule(var7.userTimeout, var7.conversationTimeout, p0.conversationModerationType, DateTime.now().UnixTimestamp)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), setTimeout (copy), var6 (ref), currentConversationTimeoutEndedModule (copy), conversationId (ref), clearTimeout (copy)
		local var9 = if var8.isTimedOut then setTimeout(function()
			-- upvalues: var6 (copy), currentConversationTimeoutEndedModule (copy), conversationId (copy)
			var6(currentConversationTimeoutEndedModule(conversationId))
		end, (var8.timeoutEndTimestamp - DateTime.now().UnixTimestamp + 1) * 1000) else nil
		
		return function()
			-- upvalues: var9 (write), clearTimeout (copy)
			if var9 then
				clearTimeout(var9)
			end
		end
	end, {
		var8.isTimedOut,
		var8.timeoutEndTimestamp,
		conversationId,
		var6
	})
	
	return var8
end