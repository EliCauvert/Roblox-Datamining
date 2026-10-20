local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.TrustedConnections.Networking.myHttpRequest)

return function(Input, p1)
	-- upvalues: HttpService (copy), Url (copy), MyHttpRequestModule (copy)
	local List = {}
	
	if Input ~= nil then
		table.insert(List, string.format("cursor=%s", HttpService:UrlEncode(Input)))
	end
	if p1 ~= nil then
		table.insert(List, string.format("limit=%d", p1))
	end
	local Formatted = string.format("%s/my/trusted-friends/requests", Url.FRIEND_URL)
	
	if #List > 0 then
		Formatted = string.format("%s?%s", Formatted, table.concat(List, "&"))
	end
	return MyHttpRequestModule(Formatted, "GET"):andThen(function(Result)
		return Result and Result.responseBody
	end)
end