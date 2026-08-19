local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)

return function(p0) --[[ line: 20 ]]
	-- upvalues: promiseModule (ref), url (ref), myHttpRequestModule (ref)
	return if p0 == nil or tostring(p0) == "" then promiseModule.reject("GetFriendsCountFromUserId called with nil userId") else myHttpRequestModule(string.format("%s/users/%s/friends/count", url.FRIEND_URL, tostring(p0)), "GET"):andThen(function(p1) --[[ line: 27 ]]
		return if p1 then p1.responseBody else nil
	end)
end