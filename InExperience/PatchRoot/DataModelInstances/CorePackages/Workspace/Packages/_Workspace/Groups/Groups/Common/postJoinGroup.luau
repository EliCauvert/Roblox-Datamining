local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("Groups").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url

return function(Callback, p1)
	-- upvalues: UrlBuilder (copy), Url (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString(Url.GROUPS_URL .. "v1/groups/{id}/users")({ id = tostring(p1) }), "POST", { postBody = HttpService:JSONEncode({}) }):andThen(function(Result)
		return Result.responseBody
	end)
end