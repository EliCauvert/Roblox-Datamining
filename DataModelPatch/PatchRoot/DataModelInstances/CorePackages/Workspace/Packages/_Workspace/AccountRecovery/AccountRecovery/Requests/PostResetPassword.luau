local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local HttpService = game:GetService("HttpService")
local Url = require(Parent.Http).Url
local _ = require(Parent.Http)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)

function getResetPasswordUrl(): string
	-- upvalues: Url (copy)
	return string.format("%sv2/passwords/reset", Url.AUTH_URL)
end

return function(Callback, Input)
	-- upvalues: HttpService (copy)
	return Callback(getResetPasswordUrl(), "POST", { postBody = HttpService:JSONEncode(Input) })
end