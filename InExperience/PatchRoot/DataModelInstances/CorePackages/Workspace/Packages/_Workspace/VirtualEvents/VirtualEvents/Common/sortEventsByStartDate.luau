local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer)

return function(Tbl) --[[ Line: 7 | Named "sortEventsByStartDate" ]]
	local Copy = table.clone(Tbl)
	table.sort(Copy, function(A, B): boolean --[[ Line: 9 ]]
		return not A.eventTime or not A.eventTime.startUtc or not B.eventTime or not B.eventTime.startUtc or (DateTime.fromIsoDate(A.eventTime.startUtc) or DateTime.now()).UnixTimestamp < (DateTime.fromIsoDate(B.eventTime.startUtc) or DateTime.now()).UnixTimestamp
	end)
	
	return Copy
end