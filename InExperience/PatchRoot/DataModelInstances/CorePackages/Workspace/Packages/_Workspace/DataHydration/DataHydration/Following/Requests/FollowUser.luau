local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local httpModule = require(parent.Http)
local _ = require(script.Parent.Parent.FollowingStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p1, p2)
	-- upvalues: fetch (ref), httpModule (ref), asPromise (ref)
	return asPromise(fetch({
		method = "POST",
		analyticsKey = "friends.follow-user",
		legacy = true,
		url = `{httpModule.Url.FRIEND_URL}/users/{p1}/follow`,
		body = {},
		network = p2,
		decode = function()
			return nil
		end
	}))
end