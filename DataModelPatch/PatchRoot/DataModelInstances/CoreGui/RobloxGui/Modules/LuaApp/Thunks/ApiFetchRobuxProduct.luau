local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local PostGetUpsellProductModule = require(Modules.LuaApp.Http.Requests.PaymentsGatewayApi.PostGetUpsellProduct)
local PaymentPlatformModule = require(Modules.LuaApp.Enum.PaymentPlatform)
local GetPaymentPlatformModule = require(Modules.LuaApp.Util.getPaymentPlatform)
local _ = require(game:GetService("CorePackages").Workspace.Packages.Http)

local function paymentPlatformToUpsellPlatform(Amazon): string
	-- upvalues: PaymentPlatformModule (copy)
	return if Amazon == PaymentPlatformModule.Web then "Web" elseif Amazon == PaymentPlatformModule.Apple then "AppleAppStore" elseif Amazon == PaymentPlatformModule.Google then "GooglePlayStore" elseif Amazon == PaymentPlatformModule.Amazon then "AmazonStore" elseif Amazon == PaymentPlatformModule.UWP then "WindowsStore" elseif Amazon == PaymentPlatformModule.Xbox then "XboxStore" elseif Amazon == PaymentPlatformModule.Maquettes then "MaquettesStore" elseif Amazon == PaymentPlatformModule.Palisades then "PalisadesStore" elseif Amazon == PaymentPlatformModule.Microsoft then "MicrosoftStore" elseif Amazon == PaymentPlatformModule.MilkyWay then "MilkyWayStore" else "None"
end

return function(p1, p2, p3)
	-- upvalues: paymentPlatformToUpsellPlatform (copy), GetPaymentPlatformModule (copy), PostGetUpsellProductModule (copy), PromiseModule (copy)
	return function(_)
		-- upvalues: paymentPlatformToUpsellPlatform (upval), GetPaymentPlatformModule (upval), PostGetUpsellProductModule (upval), p1 (copy), p2 (copy), p3 (copy), PromiseModule (upval)
		return PostGetUpsellProductModule(p1, paymentPlatformToUpsellPlatform(GetPaymentPlatformModule()), p2, p3):andThen(function(Entry)
			-- upvalues: PromiseModule (upval)
			if Entry == nil or Entry[1] == nil then
				return PromiseModule.reject()
			else
				local Entry1 = Entry[1]
				
				return PromiseModule.resolve({
					productId = Entry1.roblox_product_id,
					providerId = Entry1.provider_product_id,
					productName = Entry1.roblox_product_name,
					robuxAmount = Entry1.robux_amount,
					robuxAmountBeforeBonus = Entry1.robux_amount_before_bonus
				})
			end
		end)
	end
end