local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, p2)
	-- upvalues: checkAndSendEventModule (ref)
	checkAndSendEventModule(p1, "pioneerAgeRestrictedInterstitialImpression", { source = p2 })
end