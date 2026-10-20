local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local PostGetUpsellProductModule = require(Modules.LuaApp.Http.Requests.PaymentsGatewayApi.PostGetUpsellProduct)
local GetPaymentPlatformModule = require(Modules.LuaApp.Util.getPaymentPlatform)
local _ = require(game:GetService("CorePackages").Workspace.Packages.Http)
local PaymentPlatformUtilsModule = require(Modules.LuaApp.Thunks.Economy.Util.PaymentPlatformUtils)
local _ = require(Modules.LuaApp.Thunks.Economy.Types.EconomyTypes)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: PaymentPlatformUtilsModule (copy), GetPaymentPlatformModule (copy), PostGetUpsellProductModule (copy), PromiseModule (copy)
	return function(_)
		-- upvalues: PaymentPlatformUtilsModule (upval), GetPaymentPlatformModule (upval), PostGetUpsellProductModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), PromiseModule (upval)
		return PostGetUpsellProductModule(p1, PaymentPlatformUtilsModule.paymentPlatformToUpsellPlatform(GetPaymentPlatformModule()), p2, p3, p4, p5, p6):andThen(function(Entry)
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
					robuxAmountBeforeBonus = Entry1.robux_amount_before_bonus,
					price = Entry1.price
				})
			end
		end)
	end
end