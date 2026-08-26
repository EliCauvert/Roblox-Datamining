local parent = script.Parent.Parent
local paymentPlatformModule = require(parent.Enums.PaymentPlatform)
local fFlagEnablePioneerPaymentsPlatformModule = require(parent.Flags.FFlagEnablePioneerPaymentsPlatform)
local getIsPioneerBuildModule = require(parent.Utils.getIsPioneerBuild)

return function(p1, p2, p3)
	-- upvalues: paymentPlatformModule (ref), fFlagEnablePioneerPaymentsPlatformModule (ref), getIsPioneerBuildModule (ref)
	return if p1 == Enum.Platform.XBoxOne then paymentPlatformModule.Xbox elseif p1 == Enum.Platform.IOS then if p2 then paymentPlatformModule.Midas else paymentPlatformModule.Apple elseif p1 == Enum.Platform.Windows or p1 == Enum.Platform.OSX or p1 == Enum.Platform.Linux then if fFlagEnablePioneerPaymentsPlatformModule and getIsPioneerBuildModule() then paymentPlatformModule.Pioneer else paymentPlatformModule.Web elseif p1 == Enum.Platform.Android then if p2 then paymentPlatformModule.Midas elseif p3 then paymentPlatformModule.Amazon else paymentPlatformModule.Google elseif p1 == Enum.Platform.UWP then paymentPlatformModule.UWP else paymentPlatformModule.None
end