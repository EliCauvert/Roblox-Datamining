local parent = script:FindFirstAncestor("AuthCommon").Parent
local url = require(parent.Http).Url
local _ = require(parent.Http)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder

return function(p1, p2)
	-- upvalues: urlBuilder (ref), url (ref)
	return p1(urlBuilder.new({ base = url.USERS_URL, path = `users/{p2}` })(), "GET")
end