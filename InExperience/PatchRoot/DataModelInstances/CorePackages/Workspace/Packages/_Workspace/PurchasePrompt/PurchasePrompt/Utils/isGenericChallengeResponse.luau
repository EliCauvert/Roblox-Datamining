local GetFFlagEnablePerformPurchaseGCSHandlingModule = require(script.Parent.Parent.Flags.GetFFlagEnablePerformPurchaseGCSHandling)

function isGenericChallengeResponse(p1): boolean --[[ Line: 5 ]]
	-- upvalues: GetFFlagEnablePerformPurchaseGCSHandlingModule (copy)
	return type(p1) == "string" and (GetFFlagEnablePerformPurchaseGCSHandlingModule() and (p1:match("rblx%-challenge%-response") ~= nil and (p1:match("rblx%-challenge%-id") ~= nil and (p1:match("rblx%-challenge%-metadata") ~= nil and p1:match("rblx%-challenge%-type") ~= nil))))
end

return isGenericChallengeResponse