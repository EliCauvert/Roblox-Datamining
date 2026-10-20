return function(Purchase_flow_uuid, Text, Purchase_flow, View_name, Event_metadata)
	local Purchase_flow1: string = Purchase_flow
	
	if Text then
		Purchase_flow1 = Text .. Purchase_flow1
	end
	return {
		purchase_event_type = "ViewShown",
		purchase_flow_uuid = Purchase_flow_uuid,
		purchase_flow = Purchase_flow1,
		view_name = View_name,
		event_metadata = Event_metadata
	}
end