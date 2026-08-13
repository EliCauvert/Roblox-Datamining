local paymentPlatformModule = require(script.Parent.Parent.Enums.PaymentPlatform)

return function(p0) --[[ line: 6 ]]
	-- upvalues: paymentPlatformModule (ref)
	return if p0 == paymentPlatformModule.Web then "Web" elseif p0 == paymentPlatformModule.Apple then "AppleAppStore" elseif p0 == paymentPlatformModule.Google then "GooglePlayStore" elseif p0 == paymentPlatformModule.Amazon then "AmazonStore" elseif p0 == paymentPlatformModule.UWP then "WindowsStore" elseif p0 == paymentPlatformModule.Xbox then "XboxStore" elseif p0 == paymentPlatformModule.Maquettes then "MaquettesStore" elseif p0 == paymentPlatformModule.Palisades then "PalisadesStore" elseif p0 == paymentPlatformModule.Microsoft then "MicrosoftStore" elseif p0 == paymentPlatformModule.MilkyWay then "MilkyWayStore" elseif p0 == paymentPlatformModule.Pioneer then "PioneerStore" else "None"
end