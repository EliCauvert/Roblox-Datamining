local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
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
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local name = require(appChat.Logger):new(script.Name)

return function(p1)
	-- upvalues: useDispatch (ref), useSelector (ref), getDeepValue2Module (ref), getEffectiveChatTimeoutDetailsModule (ref), reactModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), setTimeout (ref), appChatNetworkingModule (ref), name (ref), currentConversationTimeoutEndedModule (ref), clearTimeout (ref)
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
		-- upvalues: var3 (ref), fFlagAppChatReactiveFeatureRestrictions (copy), setTimeout (copy), var1 (ref), appChatNetworkingModule (copy), conversationId (ref), name (copy), currentConversationTimeoutEndedModule (copy), clearTimeout (copy)
		local var4 = nil
		
		if var3.isTimedOut then
			local unixTimestamp = DateTime.now().UnixTimestamp
			
			if not fFlagAppChatReactiveFeatureRestrictions or unixTimestamp < var3.timeoutEndTimestamp then
				var4 = setTimeout(function()
					-- upvalues: fFlagAppChatReactiveFeatureRestrictions (copy), var1 (copy), appChatNetworkingModule (copy), conversationId (copy), name (copy), currentConversationTimeoutEndedModule (copy)
					if fFlagAppChatReactiveFeatureRestrictions then
						var1(appChatNetworkingModule.rodux.GetChatModerationStatuses.API(if conversationId then { conversationId } else nil)):catch(function()
							-- upvalues: name (copy)
							name:warning("Failed to refresh expired Party Chat restriction")
						end)
						
						return
					end
					var1(currentConversationTimeoutEndedModule(conversationId))
				end, (var3.timeoutEndTimestamp - unixTimestamp + 1) * 1000)
			end
		end
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