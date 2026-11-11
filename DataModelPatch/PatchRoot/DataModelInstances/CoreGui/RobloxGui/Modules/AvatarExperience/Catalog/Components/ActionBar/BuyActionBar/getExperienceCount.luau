return function(p1): number
	return #(if p1 then p1.experiences or {} else {})
end