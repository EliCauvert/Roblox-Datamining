local Parent = script:FindFirstAncestor("FriendRequests").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local GetResult = require(Parent.DataHydration.FriendsRequests).FriendsRequestsStore.get()
local DataStatus = DataHydrationModule.DataStatus
local config = { skipFetch = true }

return function(p1)
	-- upvalues: ReactModule (copy), GetResult (copy), config (copy), SignalsModule (copy), DataStatus (copy), SignalsReactModule (copy)
	local IsSkipFetch: boolean = p1 ~= nil and p1.skipFetch == true
	local ForceFetch: boolean = p1 == nil or p1.forceFetch == true
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetResult (upval), config (upval)
		return GetResult.getFriendsRequests(config)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: IsSkipFetch (copy), GetResult (upval), ForceFetch (copy)
		if not IsSkipFetch then
			GetResult.getFriendsRequests({ forceFetch = ForceFetch })
		end
	end, { IsSkipFetch, ForceFetch })
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: UseMemoResult (upval)
			local DataResult = UseMemoResult.data(p2)
			
			return if DataResult then DataResult.requests else {}
		end)
	end, { UseMemoResult }))), SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), DataStatus (upval)
		return SignalsModule.createComputed(function(p2): boolean
			-- upvalues: UseMemoResult (upval), DataStatus (upval)
			return UseMemoResult.status(p2) == DataStatus.NotReady
		end)
	end, { UseMemoResult }))), (ReactModule.useCallback(function()
		-- upvalues: GetResult (upval)
		GetResult.fetchMoreFriendsRequests()
	end, {}))
end