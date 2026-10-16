local PaymentPlatformModule = require(script.Parent.Parent.Enums.PaymentPlatform)

return function(Amazon): string --[[ Line: 6 ]]
	-- upvalues: PaymentPlatformModule (copy)
	return if Amazon == PaymentPlatformModule.Web then "Web" elseif Amazon == PaymentPlatformModule.Apple then "AppleAppStore" elseif Amazon == PaymentPlatformModule.Google then "GooglePlayStore" elseif Amazon == PaymentPlatformModule.Amazon then "AmazonStore" elseif Amazon == PaymentPlatformModule.UWP then "WindowsStore" elseif Amazon == PaymentPlatformModule.Xbox then "XboxStore" elseif Amazon == PaymentPlatformModule.Maquettes then "MaquettesStore" elseif Amazon == PaymentPlatformModule.Palisades then "PalisadesStore" elseif Amazon == PaymentPlatformModule.Microsoft then "MicrosoftStore" elseif Amazon == PaymentPlatformModule.MilkyWay then "MilkyWayStore" elseif Amazon == PaymentPlatformModule.Pioneer then "PioneerStore" else "None"
end