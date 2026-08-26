local paymentPlatformModule = require(script.Parent.Parent.Enums.PaymentPlatform)

return function(p1)
	-- upvalues: paymentPlatformModule (ref)
	return if p1 == paymentPlatformModule.Web then "Web" elseif p1 == paymentPlatformModule.Apple then "AppleAppStore" elseif p1 == paymentPlatformModule.Google then "GooglePlayStore" elseif p1 == paymentPlatformModule.Amazon then "AmazonStore" elseif p1 == paymentPlatformModule.UWP then "WindowsStore" elseif p1 == paymentPlatformModule.Xbox then "XboxStore" elseif p1 == paymentPlatformModule.Maquettes then "MaquettesStore" elseif p1 == paymentPlatformModule.Palisades then "PalisadesStore" elseif p1 == paymentPlatformModule.Microsoft then "MicrosoftStore" elseif p1 == paymentPlatformModule.MilkyWay then "MilkyWayStore" elseif p1 == paymentPlatformModule.Pioneer then "PioneerStore" else "None"
end