local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getFFlagAppChatEnableRootedNavigationModule = require(parent.AppChat.getFFlagAppChatEnableRootedNavigation)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)

return function(p1)
	-- upvalues: getFFlagAppChatEnableRootedNavigationModule (ref), expChatConversationListAdapterModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref)
	local conversationId = p1.conversationId
	local onBack = p1.onBack
	
	if getFFlagAppChatEnableRootedNavigationModule() then
		local conversationStore = expChatConversationListAdapterModule.getConversationStore()
		local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), conversationStore (ref), conversationId (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: conversationStore (copy), conversationId (copy)
				return conversationStore.getConversation(conversationId, p2) ~= nil
			end)
		end, { conversationStore, conversationId }))
		local var2 = reactModule.useRef(false)
		reactModule.useEffect(function()
			-- upvalues: var2 (ref)
			var2.current = false
		end, { conversationId })
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), var2 (ref), onBack (ref)
			if var1 then
				var2.current = true
				
				return
			elseif var2.current and onBack then
				var2.current = false
				onBack()
			end
		end, { var1, onBack })
	end
end