local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("Groups").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: urlBuilder (ref), url (ref), httpService (ref)
	return p0(urlBuilder.fromString(url.GROUPS_URL .. "v1/groups/{id}/users")({ id = tostring(p1) }), "POST", { postBody = httpService:JSONEncode({}) }):andThen(function(p2) --[[ line: 16 ]]
		return p2.responseBody
	end)
end