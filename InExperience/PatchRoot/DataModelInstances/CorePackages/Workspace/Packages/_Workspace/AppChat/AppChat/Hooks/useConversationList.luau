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

return function(p0) --[[ line: 21 | named "useConversationList" ]]
	-- upvalues: getConversationListStoreModule (ref), reactModule (ref), signalsModule (ref), t (ref), signalsReactModule (ref)
	local var6 = getConversationListStoreModule(false)
	local var7 = p0 ~= false
	
	return {
		items = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 25 ]]
			-- upvalues: signalsModule (copy), var7 (ref), var6 (ref)
			return signalsModule.createComputed(function(p1) --[[ line: 26 ]]
				-- upvalues: var7 (copy), var6 (copy)
				return if var7 then var6.getConversations(p1) else {}
			end)
		end, { var6, var7 })),
		listStatus = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 35 ]]
			-- upvalues: signalsModule (copy), var7 (ref), t (copy), var6 (ref)
			return signalsModule.createComputed(function(p2) --[[ line: 36 ]]
				-- upvalues: var7 (copy), t (copy), var6 (copy)
				return if var7 then var6.getListStatus(p2) else t
			end)
		end, { var6, var7 }))
	}
end