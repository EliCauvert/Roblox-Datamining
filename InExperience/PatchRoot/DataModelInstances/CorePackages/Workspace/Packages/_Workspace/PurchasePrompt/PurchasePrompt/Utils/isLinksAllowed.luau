local parent = script.Parent.Parent
local parent_1 = parent.Parent
local userInputService = game:GetService("UserInputService")
local upsellFlowModule = require(parent.Enums.UpsellFlow)
local getUpsellFlowModule = require(parent.NativeUpsell.getUpsellFlow)
local getAppFeaturePolicies = require(parent_1.UniversalAppPolicy).getAppFeaturePolicies
local fFlagEnableUnifiedProductPurchaseFlow = require(parent_1.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow

return function() --[[ line: 12 ]]
	-- upvalues: userInputService (ref), getUpsellFlowModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), getAppFeaturePolicies (ref), upsellFlowModule (ref)
	return if fFlagEnableUnifiedProductPurchaseFlow and getAppFeaturePolicies().getShouldUseDMCCALegalDisclosureInApp() then true else getUpsellFlowModule(userInputService:GetPlatform()) == upsellFlowModule.Web
end