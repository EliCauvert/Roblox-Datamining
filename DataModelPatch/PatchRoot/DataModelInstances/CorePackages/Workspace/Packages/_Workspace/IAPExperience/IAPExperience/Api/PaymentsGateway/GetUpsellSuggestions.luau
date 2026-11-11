local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local IXPServiceWrapper = require(Parent1.IXPServiceWrapper).IXPServiceWrapper
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local LoggerModule = require(Parent.Utility.logger)
local _ = require(Parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local FStringIXPLayerMobileUpsellModule = require(Parent.Flags.FStringIXPLayerMobileUpsell)
local Text = require(Parent1.Http).Url.APIS_URL .. "payments-gateway/v1/products/get-upsell-suggestions"
local EnableUpsellVirtualItemBadge = game:DefineFastFlag("EnableUpsellVirtualItemBadge", false)

return function(Upsell_platform, User_robux_balance, Attempt_robux_amount, Max_packages, Item_product_id, Item_name, Universe_id, Analytic_id)
	-- upvalues: EnableUpsellVirtualItemBadge (copy), LoggerModule (copy), IXPServiceWrapper (copy), FStringIXPLayerMobileUpsellModule (copy), Text (copy), HttpRbxApiService (copy), HttpService (copy)
	local BadgingV2Variant = nil
	
	if EnableUpsellVirtualItemBadge then
		LoggerModule.debug({ message = "Virtual item flag is on" })
		local LayerData = IXPServiceWrapper:GetLayerData(FStringIXPLayerMobileUpsellModule)
		LoggerModule.debug({ message = "Layer data", layerData = LayerData })
		
		if LayerData and LayerData.badgingV2Variant then
			BadgingV2Variant = LayerData.badgingV2Variant
			IXPServiceWrapper:LogUserLayerExposure(FStringIXPLayerMobileUpsellModule)
		end
	end
	local Data = {
		upsell_platform = Upsell_platform,
		user_robux_balance = User_robux_balance,
		attempt_robux_amount = Attempt_robux_amount,
		max_packages = Max_packages,
		virtual_item_badge_variant = BadgingV2Variant
	}
	
	if Item_product_id ~= nil then
		Data.item_product_id = Item_product_id
	end
	if Item_name ~= nil then
		Data.item_name = Item_name
	end
	if Universe_id ~= nil then
		Data.universe_id = Universe_id
	end
	if Analytic_id ~= nil then
		Data.analytic_id = Analytic_id
	end
	LoggerModule.debug({
		message = "Making GetUpsellSuggestions API Call",
		url = Text,
		data = Data
	})
	local Success, Result = pcall(function()
		-- upvalues: HttpRbxApiService (upval), Text (upval), HttpService (upval), Data (copy)
		return HttpRbxApiService:PostAsyncFullUrl(Text, HttpService:JSONEncode(Data))
	end)
	LoggerModule.debug({
		message = "GetUpsellSuggestions API Response",
		response = Result,
		success = Success
	})
	
	if not Success then
		return false, nil
	end
	local Data1 = HttpService:JSONDecode(Result)
	local config = {
		products = {},
		virtualItemBadgeType = Data1.virtual_item_badge_type
	}
	
	for i, product in ipairs(Data1.products) do
		config.products[i] = {
			productId = product.roblox_product_id,
			providerId = product.provider_product_id,
			productName = product.roblox_product_name,
			robuxAmount = product.robux_amount,
			robuxAmountBeforeBonus = product.robux_amount_before_bonus,
			price = product.price,
			badgeType = product.badge_type
		}
	end
	return true, config
end