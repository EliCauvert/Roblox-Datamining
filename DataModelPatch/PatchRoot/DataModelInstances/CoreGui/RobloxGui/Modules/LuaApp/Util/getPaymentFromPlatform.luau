local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local PaymentPlatformModule = require(Modules.LuaApp.Enum.PaymentPlatform)
local GetFFlagEnablePalisadesPaymentsPlatformModule = require(Modules.LuaApp.Flags.GetFFlagEnablePalisadesPaymentsPlatform)
local FFlagEnableMicrosoftStorePaymentsPlatform = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMicrosoftStorePaymentsPlatform
local FFlagEnableMilkyWayPaymentsPlatformV2 = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMilkyWayPaymentsPlatformV2
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies

return function(Platform, p1, p2)
	-- upvalues: PaymentPlatformModule (copy), FFlagEnableMicrosoftStorePaymentsPlatform (copy), GetAppFeaturePoliciesFunction (copy), FFlagEnableMilkyWayPaymentsPlatformV2 (copy), GetFFlagEnablePalisadesPaymentsPlatformModule (copy)
	return if Platform == Enum.Platform.XBoxOne then PaymentPlatformModule.Xbox elseif Platform == Enum.Platform.IOS then PaymentPlatformModule.Apple elseif Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX or Platform == Enum.Platform.Linux then if FFlagEnableMicrosoftStorePaymentsPlatform and GetAppFeaturePoliciesFunction().getUsePaymentPlatformMicrosoftStore() then PaymentPlatformModule.Microsoft else PaymentPlatformModule.Web elseif Platform == Enum.Platform.Android then if p1 then PaymentPlatformModule.Amazon elseif p2 then PaymentPlatformModule.Maquettes elseif FFlagEnableMilkyWayPaymentsPlatformV2 and GetAppFeaturePoliciesFunction().getUsePaymentPlatformMilkyWayStore() then PaymentPlatformModule.MilkyWay else PaymentPlatformModule.Google elseif Platform == Enum.Platform.UWP then PaymentPlatformModule.UWP elseif GetFFlagEnablePalisadesPaymentsPlatformModule() and (Platform == Enum.Platform.PS4 or Platform == Enum.Platform.PS5) then PaymentPlatformModule.Palisades else PaymentPlatformModule.None
end