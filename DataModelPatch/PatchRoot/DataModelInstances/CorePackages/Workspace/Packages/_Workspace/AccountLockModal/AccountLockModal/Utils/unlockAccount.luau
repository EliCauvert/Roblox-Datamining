local Url = require(script:FindFirstAncestor("AccountLockModal").Parent.Http).Url
local HttpService = game:GetService("HttpService")

return function(Callback)
	-- upvalues: Url (copy), HttpService (copy)
	return Callback(Url.APIS_URL .. "account-unlock-api/v1/unlock", "POST", { postBody = HttpService:JSONEncode({}) })
end