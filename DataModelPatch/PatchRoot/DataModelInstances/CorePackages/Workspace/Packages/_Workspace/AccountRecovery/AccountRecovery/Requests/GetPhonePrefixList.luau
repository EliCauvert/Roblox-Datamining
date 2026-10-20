local Parent = script:FindFirstAncestor("AccountRecovery").Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.Http)

function getRequestRecoveryUrl(): string
	-- upvalues: Url (copy)
	return string.format("%sphone-number-api/v1/phone-prefix-list", Url.APIS_URL)
end

return function(Callback)
	return Callback(getRequestRecoveryUrl(), "GET")
end