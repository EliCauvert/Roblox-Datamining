local parent = script:FindFirstAncestor("FriendsHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local var2 = require(parent.DataHydration).Friends.FriendsStore.get()

return function()
	-- upvalues: reactModule (ref), var2 (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var2 (copy)
		return var2.GetAllFriends()
	end, {})), signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var2 (copy)
		return var2.GetAllFriendsStatus()
	end, {})), reactModule.useCallback(function()
		-- upvalues: var2 (copy)
		var2.FetchMoreFriends()
	end, {})
end