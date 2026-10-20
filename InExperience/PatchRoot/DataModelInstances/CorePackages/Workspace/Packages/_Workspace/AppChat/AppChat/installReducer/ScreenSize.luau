return function(p1, p2)
	local P0 = p1 or Vector2.new(0, 0)
	assert(P0, "")
	
	return if p2 and p2.screenSize then p2.screenSize else P0
end