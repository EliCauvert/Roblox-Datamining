local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local UserInputService = game:GetService("UserInputService")
local UpsellFlowModule = require(Parent.Enums.UpsellFlow)
local GetUpsellFlowModule = require(Parent.NativeUpsell.getUpsellFlow)
local GetAppFeaturePoliciesFunction = require(Parent1.UniversalAppPolicy).getAppFeaturePolicies
local FFlagEnableUnifiedProductPurchaseFlow = require(Parent1.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow

return function(): boolean
	-- upvalues: UserInputService (copy), GetUpsellFlowModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), GetAppFeaturePoliciesFunction (copy), UpsellFlowModule (copy)
	local UpsellFlowModule1 = GetUpsellFlowModule((UserInputService:GetPlatform()))
	
	return if FFlagEnableUnifiedProductPurchaseFlow and GetAppFeaturePoliciesFunction().getShouldUseDMCCALegalDisclosureInApp() then true else UpsellFlowModule1 == UpsellFlowModule.Web
end