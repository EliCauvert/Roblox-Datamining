return {
	isPointInsideBounds = function(p1, p2, p3)
		return p2.X <= p1.X and (p1.X <= p2.X + p3.X and (p2.Y <= p1.Y and p1.Y <= p2.Y + p3.Y))
	end,
	getInputPosition = function(p1)
		return Vector2.new(p1.Position.X, p1.Position.Y)
	end,
	isPressInput = function(p1)
		return if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then p1.UserInputType == Enum.UserInputType.Touch else true
	end
}