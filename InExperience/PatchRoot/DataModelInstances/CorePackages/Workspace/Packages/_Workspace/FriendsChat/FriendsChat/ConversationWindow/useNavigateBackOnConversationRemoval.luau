local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getFFlagAppChatEnableRootedNavigationModule = require(parent.AppChat.getFFlagAppChatEnableRootedNavigation)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)

return function(p0) --[[ line: 30 | named "useNavigateBackOnConversationRemoval" ]]
	-- upvalues: getFFlagAppChatEnableRootedNavigationModule (ref), expChatConversationListAdapterModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref)
	local conversationId = p0.conversationId
	local onBack = p0.onBack
	
	if getFFlagAppChatEnableRootedNavigationModule() then
		local conversationStore = expChatConversationListAdapterModule.getConversationStore()
		local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 36 ]]
			-- upvalues: signalsModule (copy), conversationStore (ref), conversationId (ref)
			return signalsModule.createComputed(function(p1) --[[ line: 37 ]]
				-- upvalues: conversationStore (copy), conversationId (copy)
				return conversationStore.getConversation(conversationId, p1) ~= nil
			end)
		end, { conversationStore, conversationId }))
		local var7 = reactModule.useRef(false)
		reactModule.useEffect(function() --[[ line: 44 ]]
			-- upvalues: var7 (ref)
			var7.current = false
		end, { conversationId })
		reactModule.useEffect(function() --[[ line: 47 ]]
			-- upvalues: var6 (ref), var7 (ref), onBack (ref)
			if var6 then
				var7.current = true
				
				return
			elseif var7.current and onBack then
				var7.current = false
				onBack()
			end
		end, { var6, onBack })
	end
end