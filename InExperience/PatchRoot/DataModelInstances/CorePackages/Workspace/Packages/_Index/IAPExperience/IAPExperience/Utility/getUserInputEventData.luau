return function(p0, p1, p2, p3, p4, p5) --[[ line: 1 ]]
	local var0 = p2
	
	if p1 then
		var0 = p1 .. var0
	end
	return {
		purchase_event_type = "UserInput",
		purchase_flow_uuid = p0,
		purchase_flow = var0,
		view_name = p3,
		input_type = p4,
		event_metadata = p5
	}
end