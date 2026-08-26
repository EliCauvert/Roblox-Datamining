return function(p1, p2, p3, p4, p5)
	return if p1 then false elseif p5 then p2 == nil or p2 <= p3 or p4 <= p3 else false
end