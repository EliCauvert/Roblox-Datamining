local startAttributionOrchestratorModule = require(script.Parent.StartAttributionOrchestrator)
local getFFlagEnableAdConsentAttributionModule = require(script:FindFirstAncestor("LinkingProtocol").Flags.getFFlagEnableAdConsentAttribution)
local t = {
	toAdConsent = function(p1)
		return p1 == "Enabled" or (if p1 == "Disabled" then false else nil)
	end
}

function t.resolveAndPublish(p1, p2, p3, p4)
	-- upvalues: getFFlagEnableAdConsentAttributionModule (ref), t (ref), startAttributionOrchestratorModule (ref)
	if getFFlagEnableAdConsentAttributionModule() then
		startAttributionOrchestratorModule.resolveAndPublish(p1, p2, t.toAdConsent(p3()), p4)
		
		return
	end
end

return t