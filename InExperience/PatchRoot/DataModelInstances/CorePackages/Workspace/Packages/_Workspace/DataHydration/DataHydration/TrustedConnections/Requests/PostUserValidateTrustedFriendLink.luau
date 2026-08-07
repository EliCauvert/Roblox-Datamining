local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: url (ref), myHttpRequestModule (ref), httpService (ref)
	return myHttpRequestModule(string.format("%s/users/%s/validate-trusted-friend-link", url.FRIEND_URL, tostring(p0)), "POST", { postBody = httpService:JSONEncode({ Tokens = p1 }) })
end