local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local upsellFlowModule = require(purchasePrompt.Enums.UpsellFlow)
local getAppFeaturePolicies = require(purchasePrompt.Parent.UniversalAppPolicy).getAppFeaturePolicies
local getFFlagEnablePalisadesPaymentsPlatformModule = require(purchasePrompt.Flags.GetFFlagEnablePalisadesPaymentsPlatform)

return function(p0) --[[ line: 10 | named "getUpsellFlow" ]]
	-- upvalues: getAppFeaturePolicies (ref), upsellFlowModule (ref), getFFlagEnablePalisadesPaymentsPlatformModule (ref)
	return if getAppFeaturePolicies().getRobuxUpsellFlowMobile() then upsellFlowModule.Mobile elseif p0 == Enum.Platform.Windows or p0 == Enum.Platform.OSX or p0 == Enum.Platform.Linux then upsellFlowModule.Web elseif p0 == Enum.Platform.IOS or p0 == Enum.Platform.Android or p0 == Enum.Platform.UWP then upsellFlowModule.Mobile elseif p0 == Enum.Platform.XBoxOne then upsellFlowModule.Xbox elseif getFFlagEnablePalisadesPaymentsPlatformModule() and (p0 == Enum.Platform.PS4 or p0 == Enum.Platform.PS5) then upsellFlowModule.Mobile else upsellFlowModule.None
end