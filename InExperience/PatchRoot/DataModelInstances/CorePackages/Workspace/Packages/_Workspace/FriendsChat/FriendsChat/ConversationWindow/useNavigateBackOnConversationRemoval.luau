local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetFFlagAppChatEnableRootedNavigationModule = require(Parent.AppChat.getFFlagAppChatEnableRootedNavigation)
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)

return function(p1) --[[ Line: 30 | Named "useNavigateBackOnConversationRemoval" ]]
	-- upvalues: GetFFlagAppChatEnableRootedNavigationModule (copy), ExpChatConversationListAdapterModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	local ConversationId = p1.conversationId
	local OnBackFunction = p1.onBack
	
	if GetFFlagAppChatEnableRootedNavigationModule() then
		local ConversationStore = ExpChatConversationListAdapterModule.getConversationStore()
		local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 36 ]]
			-- upvalues: SignalsModule (upval), ConversationStore (copy), ConversationId (copy)
			return SignalsModule.createComputed(function(p2): boolean --[[ Line: 37 ]]
				-- upvalues: ConversationStore (upval), ConversationId (upval)
				return ConversationStore.getConversation(ConversationId, p2) ~= nil
			end)
		end, { ConversationStore, ConversationId })))
		local UseRefResult = ReactModule.useRef(false)
		ReactModule.useEffect(function() --[[ Line: 44 ]]
			-- upvalues: UseRefResult (copy)
			UseRefResult.current = false
		end, { ConversationId })
		ReactModule.useEffect(function() --[[ Line: 47 ]]
			-- upvalues: UseSignalStateResult (copy), UseRefResult (copy), OnBackFunction (copy)
			if UseSignalStateResult then
				UseRefResult.current = true
				
				return
			end
			if UseRefResult.current and OnBackFunction then
				UseRefResult.current = false
				OnBackFunction()
			end
		end, { UseSignalStateResult, OnBackFunction })
	end
end