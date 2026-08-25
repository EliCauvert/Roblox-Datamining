local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local promise = dependenciesModule.Promise
local t = dependenciesModule.t
local friendsNetworking = dependenciesModule.FriendsNetworking
local var1 = t.strictInterface({
	localUserId = t.string,
	inactiveFriendsNetworkRequestStatus = t.string,
	onResolve = t.union(t.callback, t.table),
	onError = t.union(t.callback, t.table)
})

return function(p0)
	-- upvalues: var1 (ref), friendsNetworking (ref), promise (ref)
	return {
		refreshPageData = function(p1)
			-- upvalues: var1 (copy), p0 (ref), friendsNetworking (copy), promise (copy)
			assert(var1(p1))
			local t = {}
			table.insert(t, p0(friendsNetworking.GetFriendRequestsCount.API()))
			
			return promise.all(t):andThen(p1.onResolve):catch(p1.onError)
		end,
		getFriendRequestsCount = function()
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.GetFriendRequestsCount.API())
		end
	}
end