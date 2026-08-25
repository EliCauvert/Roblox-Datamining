local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local paymentPlatformModule = require(purchasePrompt.Enums.PaymentPlatform)
local getFFlagEnablePalisadesPaymentsPlatformModule = require(purchasePrompt.Flags.GetFFlagEnablePalisadesPaymentsPlatform)
local fFlagEnablePioneerPaymentsPlatformModule = require(purchasePrompt.Flags.FFlagEnablePioneerPaymentsPlatform)
local getIsPioneerBuildModule = require(purchasePrompt.Utils.getIsPioneerBuild)
local fFlagEnableMicrosoftStorePaymentsPlatform = require(parent.SharedFlags).FFlagEnableMicrosoftStorePaymentsPlatform
local fFlagEnableMilkyWayPaymentsPlatformV2 = require(parent.SharedFlags).FFlagEnableMilkyWayPaymentsPlatformV2
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies

return function(p0, p1, p2, p3)
	-- upvalues: paymentPlatformModule (ref), fFlagEnablePioneerPaymentsPlatformModule (ref), getIsPioneerBuildModule (ref), fFlagEnableMicrosoftStorePaymentsPlatform (ref), getAppFeaturePolicies (ref), fFlagEnableMilkyWayPaymentsPlatformV2 (ref), getFFlagEnablePalisadesPaymentsPlatformModule (ref)
	return if p0 == Enum.Platform.XBoxOne then paymentPlatformModule.Xbox elseif p0 == Enum.Platform.IOS then if p1 then paymentPlatformModule.Midas else paymentPlatformModule.Apple elseif p0 == Enum.Platform.Windows or p0 == Enum.Platform.OSX or p0 == Enum.Platform.Linux then if fFlagEnablePioneerPaymentsPlatformModule and getIsPioneerBuildModule() then paymentPlatformModule.Pioneer elseif fFlagEnableMicrosoftStorePaymentsPlatform and getAppFeaturePolicies().getUsePaymentPlatformMicrosoftStore() then paymentPlatformModule.Microsoft else paymentPlatformModule.Web elseif p0 == Enum.Platform.Android then if p1 then paymentPlatformModule.Midas elseif p2 then paymentPlatformModule.Amazon elseif p3 then paymentPlatformModule.Maquettes elseif fFlagEnableMilkyWayPaymentsPlatformV2 and getAppFeaturePolicies().getUsePaymentPlatformMilkyWayStore() then paymentPlatformModule.MilkyWay else paymentPlatformModule.Google elseif p0 == Enum.Platform.UWP then paymentPlatformModule.UWP elseif getFFlagEnablePalisadesPaymentsPlatformModule() and (p0 == Enum.Platform.PS4 or p0 == Enum.Platform.PS5) then paymentPlatformModule.Palisades else paymentPlatformModule.None
end