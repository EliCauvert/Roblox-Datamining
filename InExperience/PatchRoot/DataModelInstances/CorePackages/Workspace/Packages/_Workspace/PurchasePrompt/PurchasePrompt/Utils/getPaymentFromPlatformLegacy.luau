local paymentPlatformModule = require(script.Parent.Parent.Enums.PaymentPlatform)

return function(p0, p1, p2) --[[ line: 5 ]]
	-- upvalues: paymentPlatformModule (ref)
	return if p0 == Enum.Platform.XBoxOne then paymentPlatformModule.Xbox elseif p0 == Enum.Platform.IOS then if p1 then paymentPlatformModule.Midas else paymentPlatformModule.Apple elseif p0 == Enum.Platform.Windows or p0 == Enum.Platform.OSX or p0 == Enum.Platform.Linux then paymentPlatformModule.Web elseif p0 == Enum.Platform.Android then if p1 then paymentPlatformModule.Midas elseif p2 then paymentPlatformModule.Amazon else paymentPlatformModule.Google elseif p0 == Enum.Platform.UWP then paymentPlatformModule.UWP else paymentPlatformModule.None
end