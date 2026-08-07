local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p0, _) --[[ line: 9 ]]
	-- upvalues: url (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/users/%s/create-trusted-friend-link", url.FRIEND_URL, tostring(p0)), "POST", { postBody = {} })
end