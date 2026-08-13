local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local upsellFlowModule = require(purchasePrompt.Enums.UpsellFlow)
local getAppFeaturePolicies = require(purchasePrompt.Parent.UniversalAppPolicy).getAppFeaturePolicies
local getFFlagEnablePalisadesPaymentsPlatformModule = require(purchasePrompt.Flags.GetFFlagEnablePalisadesPaymentsPlatform)
local fFlagEnablePioneerPaymentsPlatformModule = require(purchasePrompt.Flags.FFlagEnablePioneerPaymentsPlatform)
local getIsPioneerBuildModule = require(purchasePrompt.Utils.getIsPioneerBuild)

return function(p0) --[[ line: 12 | named "getUpsellFlow" ]]
	-- upvalues: getAppFeaturePolicies (ref), upsellFlowModule (ref), fFlagEnablePioneerPaymentsPlatformModule (ref), getIsPioneerBuildModule (ref), getFFlagEnablePalisadesPaymentsPlatformModule (ref)
	return if getAppFeaturePolicies().getRobuxUpsellFlowMobile() then upsellFlowModule.Mobile elseif p0 == Enum.Platform.Windows or p0 == Enum.Platform.OSX or p0 == Enum.Platform.Linux then if fFlagEnablePioneerPaymentsPlatformModule and getIsPioneerBuildModule() then upsellFlowModule.Mobile else upsellFlowModule.Web elseif p0 == Enum.Platform.IOS or p0 == Enum.Platform.Android or p0 == Enum.Platform.UWP then upsellFlowModule.Mobile elseif p0 == Enum.Platform.XBoxOne then upsellFlowModule.Xbox elseif getFFlagEnablePalisadesPaymentsPlatformModule() and (p0 == Enum.Platform.PS4 or p0 == Enum.Platform.PS5) then upsellFlowModule.Mobile else upsellFlowModule.None
end