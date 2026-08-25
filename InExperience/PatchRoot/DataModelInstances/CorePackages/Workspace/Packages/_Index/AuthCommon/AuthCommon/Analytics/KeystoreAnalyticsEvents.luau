local keystoreEventConstantsModule = require(script.Parent.KeystoreEventConstants)
local var1 = require(script:FindFirstAncestor("AuthCommon").dependencies).Analytics.AnalyticsReporters.EventIngest.new(game:GetService("EventIngestService"))

return {
	sendPageLoadEvent = function(p0, p1)
		-- upvalues: var1 (ref), keystoreEventConstantsModule (ref)
		var1:sendEventDeferred(keystoreEventConstantsModule.ctx.keystoreLogin, keystoreEventConstantsModule.eventNames.pageLoad, { origin = p0, state = p1 or "" })
	end
}