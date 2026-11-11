local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local HttpService = game:GetService("HttpService")
local Url = require(Parent.Http).Url
local _ = require(Parent.Http)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)

function getResendCodeUrl(): string
	-- upvalues: Url (copy)
	return string.format("%saccount-recovery-service/v1/resend-code", Url.APIS_URL)
end

return function(Callback, Input)
	-- upvalues: HttpService (copy)
	return Callback(getResendCodeUrl(), "POST", { postBody = HttpService:JSONEncode(Input) })
end