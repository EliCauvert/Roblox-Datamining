local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local upsellFlowModule = require(purchasePrompt.Enums.UpsellFlow)
local getAppFeaturePolicies = require(purchasePrompt.Parent.UniversalAppPolicy).getAppFeaturePolicies
local getFFlagEnablePalisadesPaymentsPlatformModule = require(purchasePrompt.Flags.GetFFlagEnablePalisadesPaymentsPlatform)
local fFlagEnablePioneerPaymentsPlatformModule = require(purchasePrompt.Flags.FFlagEnablePioneerPaymentsPlatform)
local getIsPioneerBuildModule = require(purchasePrompt.Utils.getIsPioneerBuild)

return function(p1)
	-- upvalues: getAppFeaturePolicies (ref), upsellFlowModule (ref), fFlagEnablePioneerPaymentsPlatformModule (ref), getIsPioneerBuildModule (ref), getFFlagEnablePalisadesPaymentsPlatformModule (ref)
	return if getAppFeaturePolicies().getRobuxUpsellFlowMobile() then upsellFlowModule.Mobile elseif p1 == Enum.Platform.Windows or p1 == Enum.Platform.OSX or p1 == Enum.Platform.Linux then if fFlagEnablePioneerPaymentsPlatformModule and getIsPioneerBuildModule() then upsellFlowModule.Mobile else upsellFlowModule.Web elseif p1 == Enum.Platform.IOS or p1 == Enum.Platform.Android or p1 == Enum.Platform.UWP then upsellFlowModule.Mobile elseif p1 == Enum.Platform.XBoxOne then upsellFlowModule.Xbox elseif getFFlagEnablePalisadesPaymentsPlatformModule() and (p1 == Enum.Platform.PS4 or p1 == Enum.Platform.PS5) then upsellFlowModule.Mobile else upsellFlowModule.None
end