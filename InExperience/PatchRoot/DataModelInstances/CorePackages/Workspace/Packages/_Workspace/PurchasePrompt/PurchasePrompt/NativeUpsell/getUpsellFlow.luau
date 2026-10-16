local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local UpsellFlowModule = require(PurchasePrompt.Enums.UpsellFlow)
local GetAppFeaturePoliciesFunction = require(PurchasePrompt.Parent.UniversalAppPolicy).getAppFeaturePolicies
local GetFFlagEnablePalisadesPaymentsPlatformModule = require(PurchasePrompt.Flags.GetFFlagEnablePalisadesPaymentsPlatform)
local FFlagEnablePioneerPaymentsPlatformModule = require(PurchasePrompt.Flags.FFlagEnablePioneerPaymentsPlatform)
local GetIsPioneerBuildModule = require(PurchasePrompt.Utils.getIsPioneerBuild)

return function(Platform) --[[ Line: 12 | Named "getUpsellFlow" ]]
	-- upvalues: GetAppFeaturePoliciesFunction (copy), UpsellFlowModule (copy), FFlagEnablePioneerPaymentsPlatformModule (copy), GetIsPioneerBuildModule (copy), GetFFlagEnablePalisadesPaymentsPlatformModule (copy)
	return if GetAppFeaturePoliciesFunction().getRobuxUpsellFlowMobile() then UpsellFlowModule.Mobile elseif Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX or Platform == Enum.Platform.Linux then if FFlagEnablePioneerPaymentsPlatformModule and GetIsPioneerBuildModule() then UpsellFlowModule.Mobile else UpsellFlowModule.Web elseif Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android or Platform == Enum.Platform.UWP then UpsellFlowModule.Mobile elseif Platform == Enum.Platform.XBoxOne then UpsellFlowModule.Xbox elseif GetFFlagEnablePalisadesPaymentsPlatformModule() and (Platform == Enum.Platform.PS4 or Platform == Enum.Platform.PS5) then UpsellFlowModule.Mobile else UpsellFlowModule.None
end