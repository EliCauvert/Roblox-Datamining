local PaymentPlatformModule = require(script.Parent.Parent.Enums.PaymentPlatform)

return function(Platform, p1, p2)
	-- upvalues: PaymentPlatformModule (copy)
	return if Platform == Enum.Platform.XBoxOne then PaymentPlatformModule.Xbox elseif Platform == Enum.Platform.IOS then if p1 then PaymentPlatformModule.Midas else PaymentPlatformModule.Apple elseif Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX or Platform == Enum.Platform.Linux then PaymentPlatformModule.Web elseif Platform == Enum.Platform.Android then if p1 then PaymentPlatformModule.Midas elseif p2 then PaymentPlatformModule.Amazon else PaymentPlatformModule.Google elseif Platform == Enum.Platform.UWP then PaymentPlatformModule.UWP else PaymentPlatformModule.None
end