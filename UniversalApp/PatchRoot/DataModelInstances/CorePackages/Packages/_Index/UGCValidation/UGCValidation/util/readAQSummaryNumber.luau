return function(p1, p2, p3, p4, p5): number
	local Number: number? = tonumber(p1[p2])
	
	if Number == nil or Number ~= Number then
		error(`{p3}: {p2} is not a number: {tostring(p1[p2])}`)
	end
	if p4 ~= nil and Number < p4 or p5 ~= nil and p5 < Number then
		error(`{p3}: {p2} is outside [{p4}, {p5}]: {tostring(p1[p2])}`)
	end
	return Number
end