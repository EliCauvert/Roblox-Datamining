local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.TrustedConnections.Networking.myHttpRequest)

return function(p0, p1) --[[ line: 10 ]]
	-- upvalues: httpService (ref), url (ref), myHttpRequestModule (ref)
	local t = {}
	
	if p0 ~= nil then
		table.insert(t, string.format("cursor=%s", httpService:UrlEncode(p0)))
	end
	if p1 ~= nil then
		table.insert(t, string.format("limit=%d", p1))
	end
	local formattedText = string.format("%s/my/trusted-friends/requests", url.FRIEND_URL)
	
	if #t > 0 then
		formattedText = string.format("%s?%s", formattedText, table.concat(t, "&"))
	end
	return myHttpRequestModule(formattedText, "GET"):andThen(function(p2) --[[ line: 24 ]]
		return p2 and p2.responseBody
	end)
end