local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local httpModule = require(parent.Http)
local _ = require(script.Parent.Parent.FollowingStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p0)
	-- upvalues: fetch (ref), httpModule (ref), asPromise (ref)
	return asPromise(fetch({
		method = "POST",
		analyticsKey = "friends.get-following-exists",
		url = `{httpModule.Url.FRIEND_URL}/user/following-exists`,
		body = { targetUserIds = p0 },
		decode = function(p1)
			return p1
		end
	}))
end