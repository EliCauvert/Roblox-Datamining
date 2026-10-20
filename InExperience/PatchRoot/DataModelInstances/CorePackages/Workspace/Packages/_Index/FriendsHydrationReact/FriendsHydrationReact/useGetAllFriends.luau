local Parent = script:FindFirstAncestor("FriendsHydrationReact").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()

return function()
	-- upvalues: ReactModule (copy), GetResult (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: GetResult (upval)
		return GetResult.GetAllFriends()
	end, {}))), SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: GetResult (upval)
		return GetResult.GetAllFriendsStatus()
	end, {}))), (ReactModule.useCallback(function()
		-- upvalues: GetResult (upval)
		GetResult.FetchMoreFriends()
	end, {}))
end