local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)

return function(p1)
	-- upvalues: promiseModule (ref), url (ref), myHttpRequestModule (ref)
	return if p1 == nil or tostring(p1) == "" then promiseModule.reject("GetFriendsCountFromUserId called with nil userId") else myHttpRequestModule(string.format("%s/users/%s/friends/count", url.FRIEND_URL, tostring(p1)), "GET"):andThen(function(p2)
		return if p2 then p2.responseBody else nil
	end)
end