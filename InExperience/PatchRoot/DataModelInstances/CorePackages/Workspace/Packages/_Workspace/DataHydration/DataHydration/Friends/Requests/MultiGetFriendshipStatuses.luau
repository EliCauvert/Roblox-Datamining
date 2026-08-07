local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)

return function(p0, p1) --[[ line: 21 ]]
	-- upvalues: httpService (ref), url (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/users/%s/friends/statuses?userIds=%s", url.FRIEND_URL, tostring(p0), httpService:UrlEncode(table.concat(p1, ","))), "GET"):andThen(function(p2) --[[ line: 25 ]]
		return if p2 then p2.responseBody else nil
	end)
end