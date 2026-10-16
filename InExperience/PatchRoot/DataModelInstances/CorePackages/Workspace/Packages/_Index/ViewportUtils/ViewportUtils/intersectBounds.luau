local Frozen = table.freeze({ min = Vector2.zero, max = Vector2.zero })

return function(p1, p2) --[[ Line: 8 | Named "intersectBounds" ]]
	-- upvalues: Frozen (copy)
	local config = {
		min = Vector2.new(math.max(p1.min.X, p2.min.X), (math.max(p1.min.Y, p2.min.Y))),
		max = Vector2.new(math.min(p1.max.X, p2.max.X), (math.min(p1.max.Y, p2.max.Y)))
	}
	
	return if config.max.X <= config.min.X then Frozen elseif config.max.Y <= config.min.Y then Frozen else config
end