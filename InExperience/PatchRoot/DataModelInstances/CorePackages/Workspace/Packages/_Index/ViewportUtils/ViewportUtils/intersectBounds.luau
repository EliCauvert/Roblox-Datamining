local frozen = table.freeze({ min = Vector2.zero, max = Vector2.zero })

return function(p1, p2)
	-- upvalues: frozen (ref)
	local t = {
		min = Vector2.new(math.max(p1.min.X, p2.min.X), math.max(p1.min.Y, p2.min.Y)),
		max = Vector2.new(math.min(p1.max.X, p2.max.X), math.min(p1.max.Y, p2.max.Y))
	}
	
	return if t.max.X <= t.min.X then frozen elseif t.max.Y <= t.min.Y then frozen else t
end