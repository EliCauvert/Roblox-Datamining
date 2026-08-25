return {
	isPointInsideBounds = function(p0, p1, p2)
		return p1.X <= p0.X and (p0.X <= p1.X + p2.X and (p1.Y <= p0.Y and p0.Y <= p1.Y + p2.Y))
	end,
	getInputPosition = function(p3)
		return Vector2.new(p3.Position.X, p3.Position.Y)
	end,
	isPressInput = function(p4)
		return if p4.UserInputType ~= Enum.UserInputType.MouseButton1 then p4.UserInputType == Enum.UserInputType.Touch else true
	end
}