local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p1, p2)
	-- upvalues: httpService (ref), url (ref), myHttpRequestModule (ref)
	local t = {}
	
	if p1 ~= nil then
		table.insert(t, string.format("cursor=%s", httpService:UrlEncode(p1)))
	end
	if p2 ~= nil then
		table.insert(t, string.format("limit=%d", p2))
	end
	local formattedText = string.format("%s/my/trusted-friends/requests", url.FRIEND_URL)
	
	if #t > 0 then
		formattedText = string.format("%s?%s", formattedText, table.concat(t, "&"))
	end
	return myHttpRequestModule(formattedText, "GET"):andThen(function(p3)
		return p3 and p3.responseBody
	end)
end