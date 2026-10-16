local StartAttributionOrchestratorModule = require(script.Parent.StartAttributionOrchestrator)
local GetFFlagEnableAdConsentAttributionModule = require(script:FindFirstAncestor("LinkingProtocol").Flags.getFFlagEnableAdConsentAttribution)
local AdConsentAttributionAdapterModule = {
	toAdConsent = function(p1) --[[ Line: 23 ]]
		return p1 == "Enabled" or p1 ~= "Disabled" and nil
	end
}

function AdConsentAttributionAdapterModule.resolveAndPublish(p1, p2, Callback, p3) --[[ Line: 35 ]]
	-- upvalues: GetFFlagEnableAdConsentAttributionModule (copy), AdConsentAttributionAdapterModule (copy), StartAttributionOrchestratorModule (copy)
	if GetFFlagEnableAdConsentAttributionModule() then
		StartAttributionOrchestratorModule.resolveAndPublish(p1, p2, AdConsentAttributionAdapterModule.toAdConsent(Callback()), p3)
		
		return
	end
end

return AdConsentAttributionAdapterModule