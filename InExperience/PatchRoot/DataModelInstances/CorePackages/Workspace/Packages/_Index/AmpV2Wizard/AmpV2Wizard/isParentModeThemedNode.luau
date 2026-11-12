local config = {
	UserAgreement = true,
	AgreementConsents = true,
	PinEntry = true,
	VerificationMethodSelection = true,
	OdpAgeEstimation = true,
	OdpGovernmentId = true,
	SessionPolling = true,
	Redirect = true
}
local config1 = { NeedToReverify = true, ReverificationNotice = true }

return function(p1, p2): boolean
	-- upvalues: config (copy), config1 (copy)
	return if config[p1] then true else p1 == "TextScreen" and p2 ~= nil and config1[p2] == true
end