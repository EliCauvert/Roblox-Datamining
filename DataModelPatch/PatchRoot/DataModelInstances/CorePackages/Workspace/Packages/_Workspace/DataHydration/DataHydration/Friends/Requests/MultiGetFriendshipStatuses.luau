local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.Friends.Networking.myHttpRequest)

return function(p1, List)
	-- upvalues: HttpService (copy), Url (copy), MyHttpRequestModule (copy)
	return MyHttpRequestModule(string.format("%s/users/%s/friends/statuses?userIds=%s", Url.FRIEND_URL, tostring(p1), (HttpService:UrlEncode(table.concat(List, ",")))), "GET"):andThen(function(Result)
		return if Result then Result.responseBody else nil
	end)
end