local Parent = script.Parent.Parent
local UserInputService = game:GetService("UserInputService")
local UpsellFlowModule = require(Parent.Enums.UpsellFlow)
local GetUpsellFlowModule = require(Parent.NativeUpsell.getUpsellFlow)
local GetAppFeaturePoliciesFunction = require(Parent.Parent.UniversalAppPolicy).getAppFeaturePolicies

return function(): boolean --[[ Line: 11 ]]
	-- upvalues: UserInputService (copy), GetUpsellFlowModule (copy), GetAppFeaturePoliciesFunction (copy), UpsellFlowModule (copy)
	local UpsellFlowModule1 = GetUpsellFlowModule((UserInputService:GetPlatform()))
	
	return if GetAppFeaturePoliciesFunction().getShouldUseDMCCALegalDisclosureInApp() then true else UpsellFlowModule1 == UpsellFlowModule.Web
end