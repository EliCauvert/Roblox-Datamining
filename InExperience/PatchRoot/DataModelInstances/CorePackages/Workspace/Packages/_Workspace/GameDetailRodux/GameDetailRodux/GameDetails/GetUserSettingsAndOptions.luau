local url = require(script:FindFirstAncestor("GameDetailRodux").Parent.Http).Url

return function(p1)
	-- upvalues: url (ref)
	return p1(`{url.APIS_URL}user-settings-api/v1/user-settings/settings-and-options`, "GET")
end