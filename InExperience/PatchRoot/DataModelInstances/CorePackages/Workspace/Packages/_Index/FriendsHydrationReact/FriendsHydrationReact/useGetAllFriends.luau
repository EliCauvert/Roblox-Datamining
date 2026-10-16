local Parent = script:FindFirstAncestor("FriendsHydrationReact").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()

return function() --[[ Line: 14 | Named "useGetAllFriends" ]]
	-- upvalues: ReactModule (copy), GetResult (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 15 ]]
		-- upvalues: GetResult (upval)
		return GetResult.GetAllFriends()
	end, {}))), SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 18 ]]
		-- upvalues: GetResult (upval)
		return GetResult.GetAllFriendsStatus()
	end, {}))), (ReactModule.useCallback(function() --[[ Line: 25 ]]
		-- upvalues: GetResult (upval)
		GetResult.FetchMoreFriends()
	end, {}))
end