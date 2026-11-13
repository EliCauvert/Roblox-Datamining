local _ = require("./types")

return function()
	return {
		UDim = UDim,
		UDim2 = UDim2,
		Vector2 = Vector2,
		Vector3 = Vector3,
		Color3 = Color3,
		CFrame = CFrame,
		RaycastParams = RaycastParams,
		Enum = Enum,
		Font = Font,
		Rect = Rect,
		ColorSequence = ColorSequence,
		ColorSequenceKeypoint = ColorSequenceKeypoint,
		NumberSequence = NumberSequence,
		NumberSequenceKeypoint = NumberSequenceKeypoint,
		NumberRange = NumberRange,
		Path2DControlPoint = Path2DControlPoint,
		FloatCurveKey = FloatCurveKey,
		TweenInfo = TweenInfo,
		BrickColor = BrickColor
	}
end