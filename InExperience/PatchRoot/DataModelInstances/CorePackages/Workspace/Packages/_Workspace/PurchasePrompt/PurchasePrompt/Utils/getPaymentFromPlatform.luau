local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local PaymentPlatformModule = require(PurchasePrompt.Enums.PaymentPlatform)
local GetFFlagEnablePalisadesPaymentsPlatformModule = require(PurchasePrompt.Flags.GetFFlagEnablePalisadesPaymentsPlatform)
local FFlagEnablePioneerPaymentsPlatformModule = require(PurchasePrompt.Flags.FFlagEnablePioneerPaymentsPlatform)
local GetIsPioneerBuildModule = require(PurchasePrompt.Utils.getIsPioneerBuild)
local FFlagEnableMicrosoftStorePaymentsPlatform = require(Parent.SharedFlags).FFlagEnableMicrosoftStorePaymentsPlatform
local FFlagEnableMilkyWayPaymentsPlatformV2 = require(Parent.SharedFlags).FFlagEnableMilkyWayPaymentsPlatformV2
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies

return function(Platform, p1, p2, p3) --[[ Line: 19 ]]
	-- upvalues: PaymentPlatformModule (copy), FFlagEnablePioneerPaymentsPlatformModule (copy), GetIsPioneerBuildModule (copy), FFlagEnableMicrosoftStorePaymentsPlatform (copy), GetAppFeaturePoliciesFunction (copy), FFlagEnableMilkyWayPaymentsPlatformV2 (copy), GetFFlagEnablePalisadesPaymentsPlatformModule (copy)
	return if Platform == Enum.Platform.XBoxOne then PaymentPlatformModule.Xbox elseif Platform == Enum.Platform.IOS then if p1 then PaymentPlatformModule.Midas else PaymentPlatformModule.Apple elseif Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX or Platform == Enum.Platform.Linux then if FFlagEnablePioneerPaymentsPlatformModule and GetIsPioneerBuildModule() then PaymentPlatformModule.Pioneer elseif FFlagEnableMicrosoftStorePaymentsPlatform and GetAppFeaturePoliciesFunction().getUsePaymentPlatformMicrosoftStore() then PaymentPlatformModule.Microsoft else PaymentPlatformModule.Web elseif Platform == Enum.Platform.Android then if p1 then PaymentPlatformModule.Midas elseif p2 then PaymentPlatformModule.Amazon elseif p3 then PaymentPlatformModule.Maquettes elseif FFlagEnableMilkyWayPaymentsPlatformV2 and GetAppFeaturePoliciesFunction().getUsePaymentPlatformMilkyWayStore() then PaymentPlatformModule.MilkyWay else PaymentPlatformModule.Google elseif Platform == Enum.Platform.UWP then PaymentPlatformModule.UWP elseif GetFFlagEnablePalisadesPaymentsPlatformModule() and (Platform == Enum.Platform.PS4 or Platform == Enum.Platform.PS5) then PaymentPlatformModule.Palisades else PaymentPlatformModule.None
end