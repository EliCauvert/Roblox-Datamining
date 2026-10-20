local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local HttpModule = require(Parent.Http)
local _ = require(script.Parent.Parent.FriendsRequestsStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function()
	-- upvalues: FetchFunction (copy), HttpModule (copy), AsPromiseFunction (copy)
	return AsPromiseFunction((FetchFunction({
		method = "POST",
		analyticsKey = "friends.decline-all-friend-requests",
		url = `{HttpModule.Url.FRIEND_URL}/user/friend-requests/decline-all`,
		body = {},
		decode = function(p1)
			return p1
		end
	})))
end