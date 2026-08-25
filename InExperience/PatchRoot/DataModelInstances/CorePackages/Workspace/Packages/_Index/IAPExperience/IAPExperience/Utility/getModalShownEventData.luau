return function(p0, p1, p2, p3, p4)
	local var0 = p2
	
	if p1 then
		var0 = p1 .. var0
	end
	return {
		purchase_event_type = "ViewShown",
		purchase_flow_uuid = p0,
		purchase_flow = var0,
		view_name = p3,
		event_metadata = p4
	}
end