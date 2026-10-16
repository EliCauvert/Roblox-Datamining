local Url = require(script:FindFirstAncestor("Achievements").Parent.Http).Url

return function(Callback) --[[ Line: 18 ]]
	-- upvalues: Url (copy)
	return Callback(string.format("%sv1/xbox/get-login-consecutive-days", Url.AUTH_URL), "GET")
end