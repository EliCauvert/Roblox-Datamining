local function _(Vector, Vector1, Callback)
	return if Vector and Vector1 then Vector3.new(Callback(Vector.X, Vector1.X), Callback(Vector.Y, Vector1.Y), Callback(Vector.Z, Vector1.Z)) else Vector or Vector1
end

return function(Vector, Vector1, Vector2, Vector4)
	local MinFunction = math.min
	local _Vector3 = if Vector and Vector2 then Vector3.new(MinFunction(Vector.X, Vector2.X), MinFunction(Vector.Y, Vector2.Y), (MinFunction(Vector.Z, Vector2.Z))) else Vector or Vector2
	local MaxFunction = math.max
	
	if Vector1 and Vector4 then
		return _Vector3, (Vector3.new(MaxFunction(Vector1.X, Vector4.X), MaxFunction(Vector1.Y, Vector4.Y), (MaxFunction(Vector1.Z, Vector4.Z))))
	else
		return _Vector3, Vector1 or Vector4
	end
end