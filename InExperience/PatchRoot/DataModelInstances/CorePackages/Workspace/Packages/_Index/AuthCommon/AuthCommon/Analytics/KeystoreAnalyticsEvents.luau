local KeystoreEventConstantsModule = require(script.Parent.KeystoreEventConstants)
local NewResult = require(script:FindFirstAncestor("AuthCommon").dependencies).Analytics.AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))

return {
	sendPageLoadEvent = function(Origin, p1) --[[ Line: 8 ]]
		-- upvalues: NewResult (copy), KeystoreEventConstantsModule (copy)
		NewResult:sendEventDeferred(KeystoreEventConstantsModule.ctx.keystoreLogin, KeystoreEventConstantsModule.eventNames.pageLoad, { origin = Origin, state = p1 or "" })
	end
}