local parent = script:FindFirstAncestor("AuthCommon").Parent
local url = require(parent.Http).Url
local _ = require(parent.Http)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder

return function(p0, p1) --[[ line: 33 ]]
	-- upvalues: urlBuilder (ref), url (ref)
	return p0(urlBuilder.new({ base = url.USERS_URL, path = `users/{p1}` })(), "GET")
end