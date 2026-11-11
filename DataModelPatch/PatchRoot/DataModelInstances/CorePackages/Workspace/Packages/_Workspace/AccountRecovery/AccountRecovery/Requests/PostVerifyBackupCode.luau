local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local HttpService = game:GetService("HttpService")
local Url = require(Parent.Http).Url
local _ = require(Parent.Http)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)

function getVerifyBackupCodeUrl(): string
	-- upvalues: Url (copy)
	return string.format("%saccount-recovery-service/v1/verify-backup-code", Url.APIS_URL)
end

return function(Callback, Input)
	-- upvalues: HttpService (copy)
	return Callback(getVerifyBackupCodeUrl(), "POST", { postBody = HttpService:JSONEncode(Input) })
end