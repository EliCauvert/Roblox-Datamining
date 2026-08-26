local url = require(script:FindFirstAncestor("AuthCommon").Parent.Http).Url

return function(p1)
	-- upvalues: url (ref)
	return p1(string.format("%sv2/metadata", url.AUTH_URL), "GET")
end