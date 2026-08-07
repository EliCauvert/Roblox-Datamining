return function(p0, p1) --[[ line: 3 ]]
	p0 = p0 or Vector2.new(0, 0)
	assert(p0, "")
	
	return if p1 and p1.screenSize then p1.screenSize else p0
end