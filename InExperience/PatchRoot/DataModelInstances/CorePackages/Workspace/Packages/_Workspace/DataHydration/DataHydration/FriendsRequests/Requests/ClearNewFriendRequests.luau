local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local HttpModule = require(Parent.Http)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function() --[[ Line: 13 ]]
	-- upvalues: FetchFunction (copy), HttpModule (copy), AsPromiseFunction (copy)
	return AsPromiseFunction((FetchFunction({
		method = "DELETE",
		analyticsKey = "friends.clear-new-friend-requests",
		url = `{HttpModule.Url.FRIEND_URL}/my/new-friend-requests`,
		decode = function(_) --[[ Line: 18 ]]
			return nil
		end
	})))
end