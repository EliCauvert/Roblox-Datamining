local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer)

return function(p1)
	return {
		startDate = (if p1.eventTime and p1.eventTime.startUtc then DateTime.fromIsoDate(p1.eventTime.startUtc) else nil) or DateTime.now(),
		endDate = (if p1.eventTime and p1.eventTime.endUtc then DateTime.fromIsoDate(p1.eventTime.endUtc) else nil) or DateTime.now()
	}
end