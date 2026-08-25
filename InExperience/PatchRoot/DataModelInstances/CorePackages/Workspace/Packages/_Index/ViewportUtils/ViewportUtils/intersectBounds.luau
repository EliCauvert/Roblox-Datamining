local frozen = table.freeze({ min = Vector2.zero, max = Vector2.zero })

return function(p0, p1)
	-- upvalues: frozen (ref)
	local t = {
		min = Vector2.new(math.max(p0.min.X, p1.min.X), math.max(p0.min.Y, p1.min.Y)),
		max = Vector2.new(math.min(p0.max.X, p1.max.X), math.min(p0.max.Y, p1.max.Y))
	}
	
	return if t.max.X <= t.min.X then frozen elseif t.max.Y <= t.min.Y then frozen else t
end