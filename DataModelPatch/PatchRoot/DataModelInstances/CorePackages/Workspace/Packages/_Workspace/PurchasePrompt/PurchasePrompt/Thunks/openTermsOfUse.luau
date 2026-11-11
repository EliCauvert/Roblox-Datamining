local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local UpsellFlowModule = require(Parent.Enums.UpsellFlow)
local GetUpsellFlowModule = require(Parent.NativeUpsell.getUpsellFlow)
local ExternalSettingsModule = require(Parent.Services.ExternalSettings)
local PlatformInterfaceModule = require(Parent.Services.PlatformInterface)
local ThunkModule = require(Parent.Thunk)
local AppPage = require(Parent1.RobloxAppEnums).AppPage
local TermsOfUse = require(Parent.Misc.Constants).TermsOfUse
local AppContextModule = require(Parent.Utils.AppContext)
local FFlagEnableUnifiedProductPurchaseFlow = require(Parent1.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local GetAppFeaturePoliciesFunction = require(Parent1.UniversalAppPolicy).getAppFeaturePolicies
local list = { ExternalSettingsModule, PlatformInterfaceModule }

return function(p1)
	-- upvalues: ThunkModule (copy), list (copy), ExternalSettingsModule (copy), PlatformInterfaceModule (copy), GetUpsellFlowModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), GetAppFeaturePoliciesFunction (copy), AppContextModule (copy), AppPage (copy), TermsOfUse (copy), UpsellFlowModule (copy)
	return ThunkModule.new(script.Name, list, function(_, p2)
		-- upvalues: ExternalSettingsModule (upval), PlatformInterfaceModule (upval), GetUpsellFlowModule (upval), FFlagEnableUnifiedProductPurchaseFlow (upval), GetAppFeaturePoliciesFunction (upval), AppContextModule (upval), p1 (copy), AppPage (upval), TermsOfUse (upval), UpsellFlowModule (upval)
		local v1 = p2[PlatformInterfaceModule]
		local UpsellFlowModule1 = GetUpsellFlowModule(p2[ExternalSettingsModule].getPlatform())
		
		if FFlagEnableUnifiedProductPurchaseFlow and GetAppFeaturePoliciesFunction().getShouldUseDMCCALegalDisclosureInApp() then
			if AppContextModule.get() == AppContextModule.Enum.IN_APP then
				p1.navigate(AppPage.GenericWebPage, {
					detail = TermsOfUse.DMCCAUrl,
					extraProps = { title = "" }
				})
				
				return
			else
				v1.openTermsOfUseDMCCA()
				
				return
			end
		elseif UpsellFlowModule1 == UpsellFlowModule.Web then
			v1.openTermsOfUse()
		end
	end)
end