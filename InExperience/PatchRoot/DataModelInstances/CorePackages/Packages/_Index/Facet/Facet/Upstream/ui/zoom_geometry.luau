local _ = require("./zoom_travel_types")

return {
	fit = function(p1, p2, p3, p4): number
		return (math.min(p1 / p3, p2 / p4))
	end,
	axis = function(p1, p2, p3, p4, p5)
		local v1 = p2 * p3
		local Largest = math.max(0, (p1 - v1) / 2)
		
		return math.clamp(p4 * p3 + Largest - p5, 0, (math.max(0, v1 - p1))), Largest
	end,
	point = function(p1, p2, p3, p4)
		return (p4 + p2 - p3) / p1
	end,
	rectangle = function(p1, p2, Vector): number
		assert(Vector.w > 0 and (Vector.h > 0 and Vector.w < 1e999) and Vector.h < 1e999, "ZoomView rectangle must have positive finite dimensions")
		assert(Vector.x == Vector.x and (Vector.y == Vector.y and math.abs(Vector.x) < 1e999) and math.abs(Vector.y) < 1e999, "ZoomView rectangle must have finite coordinates")
		
		return (math.min(p1 / Vector.w, p2 / Vector.h))
	end
}