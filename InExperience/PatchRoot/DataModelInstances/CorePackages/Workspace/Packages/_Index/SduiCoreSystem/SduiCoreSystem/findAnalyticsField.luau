return function(p1, p2, p3) --[[ Line: 2 | Named "findAnalyticsField" ]]
	return if p2 then if p2 and p2[p1] ~= nil then p2[p1] elseif p3 == nil then nil else p3 else nil
end