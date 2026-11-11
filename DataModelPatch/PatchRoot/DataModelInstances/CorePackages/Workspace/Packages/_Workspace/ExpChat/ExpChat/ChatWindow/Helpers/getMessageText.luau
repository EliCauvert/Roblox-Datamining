return function(p1, p2, p3)
	return (if p2 == nil or p2 == "" then p3 elseif p1 then p2 else p3) or ""
end