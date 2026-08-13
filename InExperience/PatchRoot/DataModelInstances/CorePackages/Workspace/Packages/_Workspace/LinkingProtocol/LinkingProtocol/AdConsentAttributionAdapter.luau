local startAttributionOrchestratorModule = require(script.Parent.StartAttributionOrchestrator)
local getFFlagEnableAdConsentAttributionModule = require(script:FindFirstAncestor("LinkingProtocol").Flags.getFFlagEnableAdConsentAttribution)
local t = {
	toAdConsent = function(p0) --[[ line: 23 ]]
		return p0 == "Enabled" or (if p0 == "Disabled" then false else nil)
	end
}

function t.resolveAndPublish(p1, p2, p3, p4) --[[ line: 35 ]]
	-- upvalues: getFFlagEnableAdConsentAttributionModule (ref), t (ref), startAttributionOrchestratorModule (ref)
	if getFFlagEnableAdConsentAttributionModule() then
		startAttributionOrchestratorModule.resolveAndPublish(p1, p2, t.toAdConsent(p3()), p4)
		
		return
	end
end

return t