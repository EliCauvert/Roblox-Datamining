local PropertiesModule = require(script.Parent.Parent.Properties)

return function(Vector): Vector2
	-- upvalues: PropertiesModule (copy)
	local X = 0
	local ScaledLargest = 0
	
	if PropertiesModule.ThumbstickDeadzone <= Vector.Magnitude then
		local Angle = math.atan2(Vector.Y, Vector.X)
		local Magnitude = math.abs(math.cos(Angle) * PropertiesModule.ThumbstickDeadzone)
		local Magnitude1 = math.abs(math.sin(Angle) * PropertiesModule.ThumbstickDeadzone)
		X = math.max(math.abs(Vector.X) - Magnitude, 0) / (1 - Magnitude) * math.sign(Vector.X)
		ScaledLargest = math.max(math.abs(Vector.Y) - Magnitude1, 0) / (1 - Magnitude1) * math.sign(Vector.Y)
	end
	return Vector2.new(X, -ScaledLargest)
end