local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local httpModule = require(parent.Http)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function()
	-- upvalues: fetch (ref), httpModule (ref), asPromise (ref)
	return asPromise(fetch({
		method = "POST",
		analyticsKey = "friends.decline-all-friend-requests",
		url = `{httpModule.Url.FRIEND_URL}/user/friend-requests/decline-all`,
		body = {},
		decode = function(_)
			return nil
		end
	}))
end