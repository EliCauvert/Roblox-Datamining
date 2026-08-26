local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer)

return function(p1)
	local cloned = table.clone(p1)
	table.sort(cloned, function(p2, p3)
		return if p2.eventTime and p2.eventTime.startUtc and (p3.eventTime and p3.eventTime.startUtc) then (DateTime.fromIsoDate(p2.eventTime.startUtc) or DateTime.now()).UnixTimestamp < (DateTime.fromIsoDate(p3.eventTime.startUtc) or DateTime.now()).UnixTimestamp else true
	end)
	
	return cloned
end