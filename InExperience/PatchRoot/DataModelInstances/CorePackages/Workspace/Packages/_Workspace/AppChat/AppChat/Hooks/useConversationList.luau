local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getConversationListStoreModule = require(appChat.Stores.GetConversationListStore)
local t = {
	oldestConversationIsFetched = false,
	isFetchingConversations = false
}

return function(p1)
	-- upvalues: getConversationListStoreModule (ref), reactModule (ref), signalsModule (ref), t (ref), signalsReactModule (ref)
	local var1 = getConversationListStoreModule(false)
	local var2 = p1 ~= false
	
	return {
		items = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var2 (ref), var1 (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var2 (copy), var1 (copy)
				return if var2 then var1.getConversations(p2) else {}
			end)
		end, { var1, var2 })),
		listStatus = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var2 (ref), t (copy), var1 (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var2 (copy), t (copy), var1 (copy)
				return if var2 then var1.getListStatus(p2) else t
			end)
		end, { var1, var2 }))
	}
end