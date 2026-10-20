local Parent = script.Parent.Parent
local PaymentPlatformModule = require(Parent.Enums.PaymentPlatform)
local FFlagEnablePioneerPaymentsPlatformModule = require(Parent.Flags.FFlagEnablePioneerPaymentsPlatform)
local GetIsPioneerBuildModule = require(Parent.Utils.getIsPioneerBuild)

return function(Platform, p1, p2)
	-- upvalues: PaymentPlatformModule (copy), FFlagEnablePioneerPaymentsPlatformModule (copy), GetIsPioneerBuildModule (copy)
	return if Platform == Enum.Platform.XBoxOne then PaymentPlatformModule.Xbox elseif Platform == Enum.Platform.IOS then if p1 then PaymentPlatformModule.Midas else PaymentPlatformModule.Apple elseif Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX or Platform == Enum.Platform.Linux then if FFlagEnablePioneerPaymentsPlatformModule and GetIsPioneerBuildModule() then PaymentPlatformModule.Pioneer else PaymentPlatformModule.Web elseif Platform == Enum.Platform.Android then if p1 then PaymentPlatformModule.Midas elseif p2 then PaymentPlatformModule.Amazon else PaymentPlatformModule.Google elseif Platform == Enum.Platform.UWP then PaymentPlatformModule.UWP else PaymentPlatformModule.None
end