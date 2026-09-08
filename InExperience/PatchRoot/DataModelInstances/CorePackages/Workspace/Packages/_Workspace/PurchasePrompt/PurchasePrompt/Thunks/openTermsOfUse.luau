local parent = script.Parent.Parent
local parent_1 = parent.Parent
local upsellFlowModule = require(parent.Enums.UpsellFlow)
local getUpsellFlowModule = require(parent.NativeUpsell.getUpsellFlow)
local externalSettingsModule = require(parent.Services.ExternalSettings)
local platformInterfaceModule = require(parent.Services.PlatformInterface)
local thunkModule = require(parent.Thunk)
local appPage = require(parent_1.RobloxAppEnums).AppPage
local termsOfUse = require(parent.Misc.Constants).TermsOfUse
local appContextModule = require(parent.Utils.AppContext)
local getAppFeaturePolicies = require(parent_1.UniversalAppPolicy).getAppFeaturePolicies
local list = { externalSettingsModule, platformInterfaceModule }

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), externalSettingsModule (ref), platformInterfaceModule (ref), getUpsellFlowModule (ref), getAppFeaturePolicies (ref), appContextModule (ref), appPage (ref), termsOfUse (ref), upsellFlowModule (ref)
	return thunkModule.new(script.Name, list, function(_, p2)
		-- upvalues: externalSettingsModule (copy), platformInterfaceModule (copy), getUpsellFlowModule (copy), getAppFeaturePolicies (copy), appContextModule (copy), p1 (ref), appPage (copy), termsOfUse (copy), upsellFlowModule (copy)
		local var1 = p2[platformInterfaceModule]
		local var2 = getUpsellFlowModule(p2[externalSettingsModule].getPlatform())
		
		if getAppFeaturePolicies().getShouldUseDMCCALegalDisclosureInApp() then
			if appContextModule.get() == appContextModule.Enum.IN_APP then
				p1.navigate(appPage.GenericWebPage, {
					detail = termsOfUse.DMCCAUrl,
					extraProps = { title = "" }
				})
				
				return
			end
			var1.openTermsOfUseDMCCA()
			
			return
		elseif var2 == upsellFlowModule.Web then
			var1.openTermsOfUse()
		end
	end)
end