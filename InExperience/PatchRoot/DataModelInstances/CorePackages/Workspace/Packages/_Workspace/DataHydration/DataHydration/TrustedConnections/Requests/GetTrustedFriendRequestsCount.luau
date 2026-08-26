local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)

return function()
	-- upvalues: url (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/user/trusted-friend-requests/count", url.FRIEND_URL), "GET"):andThen(function(p1)
		return p1 and p1.responseBody
	end)
end