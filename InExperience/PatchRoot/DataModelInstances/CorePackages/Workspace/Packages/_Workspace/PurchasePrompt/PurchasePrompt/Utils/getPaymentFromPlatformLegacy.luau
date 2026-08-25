local parent = script.Parent.Parent
local paymentPlatformModule = require(parent.Enums.PaymentPlatform)
local fFlagEnablePioneerPaymentsPlatformModule = require(parent.Flags.FFlagEnablePioneerPaymentsPlatform)
local getIsPioneerBuildModule = require(parent.Utils.getIsPioneerBuild)

return function(p0, p1, p2)
	-- upvalues: paymentPlatformModule (ref), fFlagEnablePioneerPaymentsPlatformModule (ref), getIsPioneerBuildModule (ref)
	return if p0 == Enum.Platform.XBoxOne then paymentPlatformModule.Xbox elseif p0 == Enum.Platform.IOS then if p1 then paymentPlatformModule.Midas else paymentPlatformModule.Apple elseif p0 == Enum.Platform.Windows or p0 == Enum.Platform.OSX or p0 == Enum.Platform.Linux then if fFlagEnablePioneerPaymentsPlatformModule and getIsPioneerBuildModule() then paymentPlatformModule.Pioneer else paymentPlatformModule.Web elseif p0 == Enum.Platform.Android then if p1 then paymentPlatformModule.Midas elseif p2 then paymentPlatformModule.Amazon else paymentPlatformModule.Google elseif p0 == Enum.Platform.UWP then paymentPlatformModule.UWP else paymentPlatformModule.None
end