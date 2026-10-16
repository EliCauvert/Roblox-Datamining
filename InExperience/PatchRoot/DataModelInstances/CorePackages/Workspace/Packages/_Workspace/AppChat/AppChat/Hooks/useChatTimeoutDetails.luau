local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local _ = require(AppChat.installReducer.ChatTimeouts)
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local _ = require(AppChat.Models.ConversationChannels)
local CurrentConversationTimeoutEndedModule = require(AppChat.Conversations.Actions.CurrentConversationTimeoutEnded)
local GetEffectiveChatTimeoutDetailsModule = require(AppChat.Utils.getEffectiveChatTimeoutDetails)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local NewResult = require(AppChat.Logger):new(script.Name)

return function(p1) --[[ Line: 26 | Named "useChatTimeoutDetails" ]]
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), GetDeepValue2Module (copy), GetEffectiveChatTimeoutDetailsModule (copy), ReactModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy), SetTimeoutFunction (copy), AppChatNetworkingModule (copy), NewResult (copy), CurrentConversationTimeoutEndedModule (copy), ClearTimeoutFunction (copy)
	local ConversationId = p1.conversationId
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 29 ]]
		-- upvalues: GetDeepValue2Module (upval), ConversationId (copy)
		return {
			userTimeout = GetDeepValue2Module(p2, "ChatAppReducer.ChatTimeouts.userTimeout"),
			conversationTimeout = GetDeepValue2Module(p2, `ChatAppReducer.ChatTimeouts.byConversationId.{ConversationId}`)
		}
	end)
	local EffectiveChatTimeoutDetailsModule = GetEffectiveChatTimeoutDetailsModule(UseSelectorResult.userTimeout, UseSelectorResult.conversationTimeout, p1.conversationModerationType, DateTime.now().UnixTimestamp)
	ReactModule.useEffect(function() --[[ Line: 43 ]]
		-- upvalues: EffectiveChatTimeoutDetailsModule (copy), FFlagAppChatReactiveFeatureRestrictions (upval), SetTimeoutFunction (upval), UseDispatchResult (copy), AppChatNetworkingModule (upval), ConversationId (copy), NewResult (upval), CurrentConversationTimeoutEndedModule (upval), ClearTimeoutFunction (upval)
		local v1 = nil
		
		if EffectiveChatTimeoutDetailsModule.isTimedOut then
			local UnixTimestamp = DateTime.now().UnixTimestamp
			
			if not FFlagAppChatReactiveFeatureRestrictions or UnixTimestamp < EffectiveChatTimeoutDetailsModule.timeoutEndTimestamp then
				v1 = SetTimeoutFunction(function() --[[ Line: 48 ]]
					-- upvalues: FFlagAppChatReactiveFeatureRestrictions (upval), UseDispatchResult (upval), AppChatNetworkingModule (upval), ConversationId (upval), NewResult (upval), CurrentConversationTimeoutEndedModule (upval)
					if FFlagAppChatReactiveFeatureRestrictions then
						UseDispatchResult(AppChatNetworkingModule.rodux.GetChatModerationStatuses.API(if ConversationId then { ConversationId } else nil)):catch(function() --[[ Line: 54 ]]
							-- upvalues: NewResult (upval)
							NewResult:warning("Failed to refresh expired Party Chat restriction")
						end)
						
						return
					else
						UseDispatchResult(CurrentConversationTimeoutEndedModule(ConversationId))
					end
				end, (EffectiveChatTimeoutDetailsModule.timeoutEndTimestamp - UnixTimestamp + 1) * 1000)
			end
		end
		return function() --[[ Line: 63 ]]
			-- upvalues: v1 (ref), ClearTimeoutFunction (upval)
			if v1 then
				ClearTimeoutFunction(v1)
			end
		end
	end, {
		EffectiveChatTimeoutDetailsModule.isTimedOut,
		EffectiveChatTimeoutDetailsModule.timeoutEndTimestamp,
		ConversationId,
		UseDispatchResult
	})
	
	return EffectiveChatTimeoutDetailsModule
end