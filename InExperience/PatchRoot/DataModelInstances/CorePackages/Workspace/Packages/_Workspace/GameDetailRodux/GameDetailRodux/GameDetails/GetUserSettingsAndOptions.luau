local url = require(script:FindFirstAncestor("GameDetailRodux").Parent.Http).Url

return function(p0)
	-- upvalues: url (ref)
	return p0(`{url.APIS_URL}user-settings-api/v1/user-settings/settings-and-options`, "GET")
end