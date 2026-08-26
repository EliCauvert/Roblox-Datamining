return function(p1, p2, p3, p4, p5)
	local var1 = p3
	
	if p2 then
		var1 = p2 .. var0
	end
	return {
		purchase_event_type = "ViewShown",
		purchase_flow_uuid = p1,
		purchase_flow = var1,
		view_name = p4,
		event_metadata = p5
	}
end