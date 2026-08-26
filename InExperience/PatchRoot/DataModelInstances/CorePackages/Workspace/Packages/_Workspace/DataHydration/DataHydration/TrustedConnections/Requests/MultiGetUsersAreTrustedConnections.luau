local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId

return function(p1)
	-- upvalues: getLocalPlayerUserId (ref), httpService (ref), url (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/user/%s/multiget-are-trusted-friends?userids=%s", url.FRIEND_URL, tostring(getLocalPlayerUserId()), httpService:UrlEncode(table.concat(p1, ","))), "GET"):andThen(function(p2)
		return p2 and (p2.responseBody and p2.responseBody.trustedFriendsId)
	end)
end