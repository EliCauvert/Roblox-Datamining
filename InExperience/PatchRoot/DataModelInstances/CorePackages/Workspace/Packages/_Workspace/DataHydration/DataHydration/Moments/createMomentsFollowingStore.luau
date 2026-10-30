local HttpClientModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpClient)
local _ = require(script.Parent.MomentsStoreTypes)
local FetchFollowingMomentsModule = require(script.Parent.Requests.fetchFollowingMoments)

return function(p1)
	-- upvalues: HttpClientModule (copy), FetchFollowingMomentsModule (copy)
	local P0 = p1 or {}
	
	return {
		getFollowing = function(p2)
			-- upvalues: HttpClientModule (upval), FetchFollowingMomentsModule (upval), P0 (copy)
			return HttpClientModule.asPromise(FetchFollowingMomentsModule(p2, P0.network))
		end,
		clear = function() end,
		dispose = function() end
	}
end