local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local Url = require(Parent.Http).Url
local AddSystemInfoToArgsFunction = require(Parent.DiscoveryUtils).AddSystemInfoToArgs

return function(Callback, p1)
	-- upvalues: HttpService (copy), Url (copy), AddSystemInfoToArgsFunction (copy)
	if p1 and p1.searchQuery then
		p1.searchQuery = HttpService:UrlEncode(p1.searchQuery)
	elseif p1 and p1.SearchQuery then
		p1.SearchQuery = HttpService:UrlEncode(p1.SearchQuery)
	end
	local APISURL = Url.APIS_URL
	AddSystemInfoToArgsFunction(p1)
	
	return Callback(string.format("%ssearch-api/omni-search?%s", APISURL, (Url:makeQueryString(p1))), "GET")
end