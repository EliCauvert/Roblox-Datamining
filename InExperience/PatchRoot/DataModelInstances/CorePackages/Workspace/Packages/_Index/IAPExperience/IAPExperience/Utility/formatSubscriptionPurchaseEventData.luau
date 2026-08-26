return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	local var1 = nil
	local upperText = nil
	
	for i, v in string.gmatch(p6, "(%w+)-(%w+)") do
		upperText = string.upper(i)
		var1 = v
	end
	return {
		purchase_flow_uuid = p1,
		purchase_flow_event_type = p2,
		view_name = p3,
		input_type = p4,
		subscription_provider_id = p5,
		subscription_product_type_prefix = upperText,
		subscription_id = var1,
		localized_subscription_name = p7,
		localized_subscription_description = p8,
		subscription_period = p9,
		price_in_cents_usd = p10,
		display_price = p11
	}
end