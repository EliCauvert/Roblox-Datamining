local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Promise = DependenciesModule.Promise
local T = DependenciesModule.t
local FriendsNetworking = DependenciesModule.FriendsNetworking
local StrictInterfaceResult = T.strictInterface({
	localUserId = T.string,
	inactiveFriendsNetworkRequestStatus = T.string,
	onResolve = T.union(T.callback, T.table),
	onError = T.union(T.callback, T.table)
})

return function(Callback) --[[ Line: 16 ]]
	-- upvalues: StrictInterfaceResult (copy), FriendsNetworking (copy), Promise (copy)
	return {
		refreshPageData = function(p1) --[[ Line: 18 ]]
			-- upvalues: StrictInterfaceResult (upval), Callback (copy), FriendsNetworking (upval), Promise (upval)
			assert(StrictInterfaceResult(p1))
			local List = {}
			table.insert(List, Callback(FriendsNetworking.GetFriendRequestsCount.API()))
			
			return Promise.all(List):andThen(p1.onResolve):catch(p1.onError)
		end,
		getFriendRequestsCount = function() --[[ Line: 26 ]]
			-- upvalues: Callback (copy), FriendsNetworking (upval)
			return Callback(FriendsNetworking.GetFriendRequestsCount.API())
		end
	}
end