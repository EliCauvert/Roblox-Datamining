local Url = require(script:FindFirstAncestor("LoginV2").Parent.Http).Url

function getStartAuthenticationUrl(): string
	-- upvalues: Url (copy)
	return string.format("%sv1/passkey/StartAuthentication", Url.AUTH_URL)
end

return function(Callback)
	return Callback(getStartAuthenticationUrl(), "POST")
end