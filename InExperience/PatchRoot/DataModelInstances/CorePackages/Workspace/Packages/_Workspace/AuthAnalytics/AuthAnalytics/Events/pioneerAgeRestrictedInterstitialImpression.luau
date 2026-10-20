local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, Source)
	-- upvalues: CheckAndSendEventModule (copy)
	CheckAndSendEventModule(p1, "pioneerAgeRestrictedInterstitialImpression", { source = Source })
end