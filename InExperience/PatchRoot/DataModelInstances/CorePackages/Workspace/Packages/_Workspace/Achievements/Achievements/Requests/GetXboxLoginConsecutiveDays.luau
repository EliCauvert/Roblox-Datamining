local url = require(script:FindFirstAncestor("Achievements").Parent.Http).Url

return function(p0)
	-- upvalues: url (ref)
	return p0(string.format("%sv1/xbox/get-login-consecutive-days", url.AUTH_URL), "GET")
end