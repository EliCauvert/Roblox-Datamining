local parent = script.Parent.Parent
local parent_1 = parent.Parent
local userInputService = game:GetService("UserInputService")
local upsellFlowModule = require(parent.Enums.UpsellFlow)
local getUpsellFlowModule = require(parent.NativeUpsell.getUpsellFlow)
local getAppFeaturePolicies = require(parent_1.UniversalAppPolicy).getAppFeaturePolicies

return function()
	-- upvalues: userInputService (ref), getUpsellFlowModule (ref), getAppFeaturePolicies (ref), upsellFlowModule (ref)
	return if getAppFeaturePolicies().getShouldUseDMCCALegalDisclosureInApp() then true else getUpsellFlowModule(userInputService:GetPlatform()) == upsellFlowModule.Web
end