local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetFFlagLuaAppLuaBuyRobuxPageModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppLuaBuyRobuxPage)
local GetHasQuestUserAgentModule = require(Modules.LuaApp.Util.getHasQuestUserAgent)
local GetFFlagLuaAppMaquettesDisableProductIdConversionModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppMaquettesDisableProductIdConversion)
local IAPProductModule = {
	new = function()
		return {
			productId = 0,
			mobileProductId = "",
			robuxAmount = 0,
			requiresPremium = false,
			isSubscription = false,
			description = "",
			price = 0,
			currencySymbol = ""
		}
	end
}

function IAPProductModule.mock()
	-- upvalues: IAPProductModule (copy)
	return (IAPProductModule.new())
end

function IAPProductModule.fromJsonData(p1, Platform)
	-- upvalues: IAPProductModule (copy), GetFFlagLuaAppLuaBuyRobuxPageModule (copy), GetFFlagLuaAppMaquettesDisableProductIdConversionModule (copy), GetHasQuestUserAgentModule (copy)
	local NewIAPProduct = IAPProductModule.new()
	
	if GetFFlagLuaAppLuaBuyRobuxPageModule() then
		NewIAPProduct.productId = p1.productId
	end
	NewIAPProduct.mobileProductId = Platform == Enum.Platform.Android and string.lower(p1.mobileProductId) or p1.mobileProductId
	
	if GetFFlagLuaAppMaquettesDisableProductIdConversionModule() and GetHasQuestUserAgentModule() then
		NewIAPProduct.mobileProductId = p1.mobileProductId
	end
	NewIAPProduct.robuxAmount = p1.robuxAmount
	NewIAPProduct.requiresPremium = p1.isSubscriptionOnly
	NewIAPProduct.isSubscription = p1.premiumFeatureTypeName == "Subscription"
	NewIAPProduct.description = p1.description
	NewIAPProduct.price = p1.price.amount
	NewIAPProduct.currencySymbol = p1.price.currency.currencySymbol
	
	return NewIAPProduct
end

return IAPProductModule