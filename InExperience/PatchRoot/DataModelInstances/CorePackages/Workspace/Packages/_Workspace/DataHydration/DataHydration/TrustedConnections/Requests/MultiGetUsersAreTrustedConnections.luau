local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId

return function(p0) --[[ line: 11 ]]
	-- upvalues: getLocalPlayerUserId (ref), httpService (ref), url (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/user/%s/multiget-are-trusted-friends?userids=%s", url.FRIEND_URL, tostring(getLocalPlayerUserId()), httpService:UrlEncode(table.concat(p0, ","))), "GET"):andThen(function(p1) --[[ line: 22 ]]
		return p1 and (p1.responseBody and p1.responseBody.trustedFriendsId)
	end)
end