local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer)

return function(p0)
	local cloned = table.clone(p0)
	table.sort(cloned, function(p1, p2)
		return if p1.eventTime and p1.eventTime.startUtc and (p2.eventTime and p2.eventTime.startUtc) then (DateTime.fromIsoDate(p1.eventTime.startUtc) or DateTime.now()).UnixTimestamp < (DateTime.fromIsoDate(p2.eventTime.startUtc) or DateTime.now()).UnixTimestamp else true
	end)
	
	return cloned
end