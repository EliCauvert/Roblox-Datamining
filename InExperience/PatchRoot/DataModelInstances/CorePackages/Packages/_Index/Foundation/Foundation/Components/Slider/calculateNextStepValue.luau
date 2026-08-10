return function(p0, p1, p2, p3) --[[ line: 2 | named "calculateNextStepValue" ]]
	return math.clamp(p1 + (if p0 > 0 then 1 elseif p0 < 0 then -1 else 0) * p2, p3.Min, p3.Max)
end