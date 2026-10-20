return function(Purchase_flow_uuid, Purchase_flow_event_type, View_name, Input_type, Subscription_provider_id, Text: string, Localized_subscription_name, Localized_subscription_description, Subscription_period, Price_in_cents_usd, Display_price)
	local Subscription_id = nil
	local Uppered: string? = nil
	
	for i, value in string.gmatch(Text, "(%w+)-(%w+)") do
		Uppered = string.upper(i)
		Subscription_id = value
	end
	return {
		purchase_flow_uuid = Purchase_flow_uuid,
		purchase_flow_event_type = Purchase_flow_event_type,
		view_name = View_name,
		input_type = Input_type,
		subscription_provider_id = Subscription_provider_id,
		subscription_product_type_prefix = Uppered,
		subscription_id = Subscription_id,
		localized_subscription_name = Localized_subscription_name,
		localized_subscription_description = Localized_subscription_description,
		subscription_period = Subscription_period,
		price_in_cents_usd = Price_in_cents_usd,
		display_price = Display_price
	}
end