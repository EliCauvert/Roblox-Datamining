local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.TrustedConnections.Networking.myHttpRequest)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId

return function(List)
	-- upvalues: GetLocalPlayerUserIdFunction (copy), HttpService (copy), Url (copy), MyHttpRequestModule (copy)
	return MyHttpRequestModule(string.format("%s/user/%s/multiget-are-trusted-friends?userids=%s", Url.FRIEND_URL, tostring((GetLocalPlayerUserIdFunction())), (HttpService:UrlEncode(table.concat(List, ",")))), "GET"):andThen(function(Result)
		return Result and (Result.responseBody and Result.responseBody.trustedFriendsId)
	end)
end