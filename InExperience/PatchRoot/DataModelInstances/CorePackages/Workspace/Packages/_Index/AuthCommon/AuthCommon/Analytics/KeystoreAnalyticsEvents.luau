local keystoreEventConstantsModule = require(script.Parent.KeystoreEventConstants)
local var1 = require(script:FindFirstAncestor("AuthCommon").dependencies).Analytics.AnalyticsReporters.EventIngest.new(game:GetService("EventIngestService"))

return {
	sendPageLoadEvent = function(p1, p2)
		-- upvalues: var1 (ref), keystoreEventConstantsModule (ref)
		var1:sendEventDeferred(keystoreEventConstantsModule.ctx.keystoreLogin, keystoreEventConstantsModule.eventNames.pageLoad, { origin = p1, state = p2 or "" })
	end
}