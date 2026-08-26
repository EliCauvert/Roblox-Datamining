local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p1)
	-- upvalues: url (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/users/%s/accept-trusted-friend-request", url.FRIEND_URL, tostring(p1)), "POST", { postBody = {} })
end