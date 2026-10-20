return function(p1, p2): string
	return if p1 then "loading" elseif p2 then "error" else "ready"
end