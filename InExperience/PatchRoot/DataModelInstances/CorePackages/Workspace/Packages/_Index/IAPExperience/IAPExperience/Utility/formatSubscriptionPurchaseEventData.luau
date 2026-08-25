return function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	local var0 = nil
	local upperText = nil
	
	for i, v in string.gmatch(p5, "(%w+)-(%w+)") do
		upperText = string.upper(i)
		var0 = v
	end
	return {
		purchase_flow_uuid = p0,
		purchase_flow_event_type = p1,
		view_name = p2,
		input_type = p3,
		subscription_provider_id = p4,
		subscription_product_type_prefix = upperText,
		subscription_id = var0,
		localized_subscription_name = p6,
		localized_subscription_description = p7,
		subscription_period = p8,
		price_in_cents_usd = p9,
		display_price = p10
	}
end