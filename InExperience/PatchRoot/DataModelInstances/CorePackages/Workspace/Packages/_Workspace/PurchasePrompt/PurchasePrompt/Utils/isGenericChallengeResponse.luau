local getFFlagEnablePerformPurchaseGCSHandlingModule = require(script.Parent.Parent.Flags.GetFFlagEnablePerformPurchaseGCSHandling)

function isGenericChallengeResponse(p1)
	-- upvalues: getFFlagEnablePerformPurchaseGCSHandlingModule (ref)
	return type(p1) == "string" and (getFFlagEnablePerformPurchaseGCSHandlingModule() and (p1:match("rblx%-challenge%-response") ~= nil and (p1:match("rblx%-challenge%-id") ~= nil and (p1:match("rblx%-challenge%-metadata") ~= nil and p1:match("rblx%-challenge%-type") ~= nil))))
end

return isGenericChallengeResponse