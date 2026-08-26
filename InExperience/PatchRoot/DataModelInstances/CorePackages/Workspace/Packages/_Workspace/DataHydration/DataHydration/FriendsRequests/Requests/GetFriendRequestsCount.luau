local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local httpModule = require(parent.Http)
local _ = require(script.Parent.Parent.FriendsRequestsStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function()
	-- upvalues: fetch (ref), httpModule (ref), asPromise (ref)
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "friends.get-friend-requests-count",
		url = `{httpModule.Url.FRIEND_URL}/user/friend-requests/count`,
		decode = function(p1)
			return p1
		end
	}))
end