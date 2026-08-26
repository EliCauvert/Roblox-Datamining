local parent = script:FindFirstAncestor("FriendsHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local var1 = require(parent.DataHydration).Friends.FriendsStore.get()

return function()
	-- upvalues: reactModule (ref), var1 (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var1 (copy)
		return var1.GetAllFriends()
	end, {})), signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var1 (copy)
		return var1.GetAllFriendsStatus()
	end, {})), reactModule.useCallback(function()
		-- upvalues: var1 (copy)
		var1.FetchMoreFriends()
	end, {})
end