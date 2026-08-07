return function(p0, p1, p2) --[[ line: 2 | named "findAnalyticsField" ]]
	return if p1 then if p1 and p1[p0] ~= nil then p1[p0] elseif p2 == nil then nil else p2 else nil
end