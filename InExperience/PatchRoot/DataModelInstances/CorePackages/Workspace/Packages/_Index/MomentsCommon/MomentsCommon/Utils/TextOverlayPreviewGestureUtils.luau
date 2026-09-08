return {
	getTouchLineAngleDegrees = function(vectorA)
		if #vectorA < 2 then
			return nil
		end
		local var1 = vectorA[2] - vectorA[1]
		
		return math.deg(math.atan2(var1.Y, var1.X))
	end,
	getTouchRotationStepDegrees = function(p1, p2)
		return (p2 - p1 + 90) % 180 - 90
	end,
	touchGestureStartsOnOverlay = function(p1, p2, p3)
		if #p1 < 2 then
			return false
		end
		local var1 = (p1[1] + p1[2]) / 2
		
		return p2.X - 64 <= var1.X and (var1.X <= p2.X + p3.X + 64 and (p2.Y - 64 <= var1.Y and var1.Y <= p2.Y + p3.Y + 64))
	end
}