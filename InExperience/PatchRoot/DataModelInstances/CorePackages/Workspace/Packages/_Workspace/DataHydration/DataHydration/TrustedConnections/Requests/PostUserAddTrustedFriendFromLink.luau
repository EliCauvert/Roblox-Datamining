local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p1, p2)
	-- upvalues: url (ref), myHttpRequestModule (ref), httpService (ref)
	return myHttpRequestModule(string.format("%s/users/%s/add-trusted-friend-from-link", url.FRIEND_URL, tostring(p1)), "POST", { postBody = httpService:JSONEncode({ Tokens = p2 }) })
end