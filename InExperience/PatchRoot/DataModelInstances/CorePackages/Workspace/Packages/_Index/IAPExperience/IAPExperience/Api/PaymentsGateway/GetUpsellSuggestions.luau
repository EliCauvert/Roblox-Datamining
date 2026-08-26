local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local url = require(parent_1.Http).Url
local IXPServiceWrapper = require(parent_1.IXPServiceWrapper).IXPServiceWrapper
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local loggerModule = require(parent.Utility.logger)
local _ = require(parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local fStringIXPLayerMobileUpsellModule = require(parent.Flags.FStringIXPLayerMobileUpsell)
local text = url.APIS_URL .. "payments-gateway/v1/products/get-upsell-suggestions"
local enableUpsellVirtualItemBadge = game:DefineFastFlag("EnableUpsellVirtualItemBadge", false)

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: enableUpsellVirtualItemBadge (ref), loggerModule (ref), IXPServiceWrapper (ref), fStringIXPLayerMobileUpsellModule (ref), text (ref), httpRbxApiService (ref), httpService (ref)
	local badgingV2Variant = nil
	
	if enableUpsellVirtualItemBadge then
		loggerModule.debug({ message = "Virtual item flag is on" })
		local var1 = IXPServiceWrapper:GetLayerData(fStringIXPLayerMobileUpsellModule)
		loggerModule.debug({ message = "Layer data", layerData = var1 })
		
		if var1 and var1.badgingV2Variant then
			badgingV2Variant = var1.badgingV2Variant
			IXPServiceWrapper:LogUserLayerExposure(fStringIXPLayerMobileUpsellModule)
		end
	end
	local t = {
		upsell_platform = p1,
		user_robux_balance = p2,
		attempt_robux_amount = p3,
		max_packages = p4,
		virtual_item_badge_variant = badgingV2Variant
	}
	
	if p5 ~= nil then
		t.item_product_id = p5
	end
	if p6 ~= nil then
		t.item_name = p6
	end
	if p7 ~= nil then
		t.universe_id = p7
	end
	if p8 ~= nil then
		t.analytic_id = p8
	end
	loggerModule.debug({
		message = "Making GetUpsellSuggestions API Call",
		url = text,
		data = t
	})
	local ok, status = pcall(function()
		-- upvalues: httpRbxApiService (copy), text (copy), httpService (copy), t (ref)
		return httpRbxApiService:PostAsyncFullUrl(text, httpService:JSONEncode(t))
	end)
	loggerModule.debug({
		message = "GetUpsellSuggestions API Response",
		response = status,
		success = ok
	})
	
	if not ok then
		return false, nil
	end
	local var2 = httpService:JSONDecode(status)
	local t_1 = {
		products = {},
		virtualItemBadgeType = var2.virtual_item_badge_type
	}
	
	for i, v in ipairs(var2.products) do
		t_1.products[i] = {
			productId = v.roblox_product_id,
			providerId = v.provider_product_id,
			productName = v.roblox_product_name,
			robuxAmount = v.robux_amount,
			robuxAmountBeforeBonus = v.robux_amount_before_bonus,
			price = v.price,
			badgeType = v.badge_type
		}
	end
	return true, t_1
end