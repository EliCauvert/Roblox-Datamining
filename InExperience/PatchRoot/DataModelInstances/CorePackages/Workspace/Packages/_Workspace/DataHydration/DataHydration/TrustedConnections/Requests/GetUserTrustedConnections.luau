local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p0) --[[ line: 9 ]]
	-- upvalues: url (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/users/%s/friends/find?&findFriendsType=FindTrustedFriends", url.FRIEND_URL, tostring(p0)), "GET"):andThen(function(p1) --[[ line: 12 ]]
		return p1 and p1.responseBody
	end)
end