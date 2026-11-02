local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.Friends.Networking.myHttpRequest)

local function _(Text: string): boolean
	return string.match(Text, "^%d+$") ~= nil
end

return function(p1, List)
	-- upvalues: HttpService (copy), Url (copy), MyHttpRequestModule (copy)
	local List1 = {}
	
	for _, value in List do
		if string.match(value, "^%d+$") ~= nil then
			table.insert(List1, value)
		end
	end
	return MyHttpRequestModule(string.format("%s/users/%s/friends/statuses?userIds=%s", Url.FRIEND_URL, tostring(p1), (HttpService:UrlEncode(table.concat(List1, ",")))), "GET"):andThen(function(Result)
		return if Result then Result.responseBody else nil
	end)
end