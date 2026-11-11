local PaymentPlatformModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.PaymentPlatform)

return {
	paymentPlatformToUpsellPlatform = function(Amazon): string
		-- upvalues: PaymentPlatformModule (copy)
		return if Amazon == PaymentPlatformModule.Web then "Web" elseif Amazon == PaymentPlatformModule.Apple then "AppleAppStore" elseif Amazon == PaymentPlatformModule.Google then "GooglePlayStore" elseif Amazon == PaymentPlatformModule.Amazon then "AmazonStore" elseif Amazon == PaymentPlatformModule.UWP then "WindowsStore" elseif Amazon == PaymentPlatformModule.Xbox then "XboxStore" elseif Amazon == PaymentPlatformModule.Maquettes then "MaquettesStore" elseif Amazon == PaymentPlatformModule.Palisades then "PalisadesStore" elseif Amazon == PaymentPlatformModule.Microsoft then "MicrosoftStore" elseif Amazon == PaymentPlatformModule.MilkyWay then "MilkyWayStore" else "None"
	end
}