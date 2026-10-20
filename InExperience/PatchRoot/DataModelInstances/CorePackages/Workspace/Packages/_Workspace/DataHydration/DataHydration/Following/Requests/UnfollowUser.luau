local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local HttpModule = require(Parent.Http)
local _ = require(script.Parent.Parent.FollowingStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(p1, Network)
	-- upvalues: FetchFunction (copy), HttpModule (copy), AsPromiseFunction (copy)
	return AsPromiseFunction((FetchFunction({
		method = "POST",
		analyticsKey = "friends.unfollow-user",
		legacy = true,
		url = `{HttpModule.Url.FRIEND_URL}/users/{p1}/unfollow`,
		body = {},
		network = Network,
		decode = function()
			return nil
		end
	})))
end