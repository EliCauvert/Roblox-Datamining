local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local HttpModule = require(Parent.Http)
local _ = require(script.Parent.Parent.FollowingStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(p1, Network) --[[ Line: 16 ]]
	-- upvalues: FetchFunction (copy), HttpModule (copy), AsPromiseFunction (copy)
	return AsPromiseFunction((FetchFunction({
		method = "POST",
		analyticsKey = "friends.follow-user",
		legacy = true,
		url = `{HttpModule.Url.FRIEND_URL}/users/{p1}/follow`,
		body = {},
		network = Network,
		decode = function() --[[ Line: 25 ]]
			return nil
		end
	})))
end