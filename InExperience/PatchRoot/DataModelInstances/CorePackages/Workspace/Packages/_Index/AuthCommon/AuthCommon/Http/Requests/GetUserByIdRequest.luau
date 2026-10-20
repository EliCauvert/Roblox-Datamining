local Parent = script:FindFirstAncestor("AuthCommon").Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.Http)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder

return function(Callback, p1)
	-- upvalues: UrlBuilder (copy), Url (copy)
	return Callback(UrlBuilder.new({ base = Url.USERS_URL, path = `users/{p1}` })(), "GET")
end