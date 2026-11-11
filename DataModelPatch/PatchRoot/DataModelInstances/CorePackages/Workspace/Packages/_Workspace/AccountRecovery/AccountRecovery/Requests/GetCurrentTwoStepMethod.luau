local Parent = script:FindFirstAncestor("AccountRecovery").Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.Http)

function getCurrentTwoStepMethodUrl(p1): string
	-- upvalues: Url (copy)
	return string.format("%saccount-recovery-service/v1/get-current-two-step-method?recoverySessionId=%s", Url.APIS_URL, p1)
end

return function(Callback, p1)
	return Callback(getCurrentTwoStepMethodUrl(p1), "GET")
end