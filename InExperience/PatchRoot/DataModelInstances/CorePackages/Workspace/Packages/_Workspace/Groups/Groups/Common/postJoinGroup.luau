local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("Groups").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url

return function(p1, p2)
	-- upvalues: urlBuilder (ref), url (ref), httpService (ref)
	return p1(urlBuilder.fromString(url.GROUPS_URL .. "v1/groups/{id}/users")({ id = tostring(p2) }), "POST", { postBody = httpService:JSONEncode({}) }):andThen(function(p3)
		return p3.responseBody
	end)
end