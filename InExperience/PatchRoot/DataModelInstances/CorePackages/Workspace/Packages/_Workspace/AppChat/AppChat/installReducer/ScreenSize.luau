return function(p1, p2)
	p1 = p1 or Vector2.new(0, 0)
	assert(p1, "")
	
	return if p2 and p2.screenSize then p2.screenSize else p1
end