local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer)

return function(p0) --[[ line: 10 | named "getVirtualEventDates" ]]
	return {
		startDate = (if p0.eventTime and p0.eventTime.startUtc then DateTime.fromIsoDate(p0.eventTime.startUtc) else nil) or DateTime.now(),
		endDate = (if p0.eventTime and p0.eventTime.endUtc then DateTime.fromIsoDate(p0.eventTime.endUtc) else nil) or DateTime.now()
	}
end