local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local HttpModule = require(Parent.Http)
local _ = require(script.Parent.Parent.FollowingStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(TargetUserIds)
	-- upvalues: FetchFunction (copy), HttpModule (copy), AsPromiseFunction (copy)
	return AsPromiseFunction((FetchFunction({
		method = "POST",
		analyticsKey = "friends.get-following-exists",
		url = `{HttpModule.Url.FRIEND_URL}/user/following-exists`,
		body = { targetUserIds = TargetUserIds },
		decode = function(p1)
			return p1
		end
	})))
end