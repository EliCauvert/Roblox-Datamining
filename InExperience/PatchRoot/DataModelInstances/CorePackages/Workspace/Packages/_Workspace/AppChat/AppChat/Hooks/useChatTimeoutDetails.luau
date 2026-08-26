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

return function(p1)
	-- upvalues: useDispatch (ref), useSelector (ref), getDeepValue2Module (ref), getEffectiveChatTimeoutDetailsModule (ref), reactModule (ref), setTimeout (ref), currentConversationTimeoutEndedModule (ref), clearTimeout (ref)
	local conversationId = p1.conversationId
	local var1 = useDispatch()
	local var2 = useSelector(function(p2)
		-- upvalues: getDeepValue2Module (copy), conversationId (ref)
		return {
			userTimeout = getDeepValue2Module(p2, "ChatAppReducer.ChatTimeouts.userTimeout"),
			conversationTimeout = getDeepValue2Module(p2, `ChatAppReducer.ChatTimeouts.byConversationId.{conversationId}`)
		}
	end)
	local var3 = getEffectiveChatTimeoutDetailsModule(var2.userTimeout, var2.conversationTimeout, p1.conversationModerationType, DateTime.now().UnixTimestamp)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), setTimeout (copy), var1 (ref), currentConversationTimeoutEndedModule (copy), conversationId (ref), clearTimeout (copy)
		local var4 = if var3.isTimedOut then setTimeout(function()
			-- upvalues: var1 (copy), currentConversationTimeoutEndedModule (copy), conversationId (copy)
			var1(currentConversationTimeoutEndedModule(conversationId))
		end, (var3.timeoutEndTimestamp - DateTime.now().UnixTimestamp + 1) * 1000) else nil
		
		return function()
			-- upvalues: var4 (write), clearTimeout (copy)
			if var4 then
				clearTimeout(var4)
			end
		end
	end, {
		var3.isTimedOut,
		var3.timeoutEndTimestamp,
		conversationId,
		var1
	})
	
	return var3
end