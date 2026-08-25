local getFFlagEnablePerformPurchaseGCSHandlingModule = require(script.Parent.Parent.Flags.GetFFlagEnablePerformPurchaseGCSHandling)

function isGenericChallengeResponse(p0)
	-- upvalues: getFFlagEnablePerformPurchaseGCSHandlingModule (ref)
	return type(p0) == "string" and (getFFlagEnablePerformPurchaseGCSHandlingModule() and (p0:match("rblx%-challenge%-response") ~= nil and (p0:match("rblx%-challenge%-id") ~= nil and (p0:match("rblx%-challenge%-metadata") ~= nil and p0:match("rblx%-challenge%-type") ~= nil))))
end

return isGenericChallengeResponse