return {
	isPointInsideBounds = function(Vector, Vector1, Vector3): boolean --[[ Line: 1 ]]
		return Vector1.X <= Vector.X and (Vector.X <= Vector1.X + Vector3.X and Vector1.Y <= Vector.Y) and Vector.Y <= Vector1.Y + Vector3.Y
	end,
	getInputPosition = function(p1): Vector2 --[[ Line: 8 ]]
		return Vector2.new(p1.Position.X, p1.Position.Y)
	end,
	isPressInput = function(Input): boolean --[[ Line: 12 ]]
		return Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch
	end
}