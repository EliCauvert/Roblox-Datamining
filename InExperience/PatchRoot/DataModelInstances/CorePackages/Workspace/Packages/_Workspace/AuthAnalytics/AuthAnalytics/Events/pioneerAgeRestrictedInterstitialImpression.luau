local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, Source) --[[ Line: 4 ]]
	-- upvalues: CheckAndSendEventModule (copy)
	CheckAndSendEventModule(p1, "pioneerAgeRestrictedInterstitialImpression", { source = Source })
end