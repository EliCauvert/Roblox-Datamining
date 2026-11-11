local Url = require(script:FindFirstAncestor("GameDetailRodux").Parent.Http).Url

return function(Callback)
	-- upvalues: Url (copy)
	return Callback(`{Url.APIS_URL}user-settings-api/v1/user-settings/settings-and-options`, "GET")
end