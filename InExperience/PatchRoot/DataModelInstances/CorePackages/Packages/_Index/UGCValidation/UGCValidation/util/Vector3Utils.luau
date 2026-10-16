return {
	isInRange = function(Vector, Vector1, Vector2, Enabled): boolean --[[ Line: 3 ]]
		return if Enabled == true then Vector1.X < Vector.X and (Vector.X < Vector2.X and (Vector1.Y < Vector.Y and (Vector.Y < Vector2.Y and Vector1.Z < Vector.Z))) and Vector.Z < Vector2.Z else Vector1.X <= Vector.X and (Vector.X <= Vector2.X and (Vector1.Y <= Vector.Y and (Vector.Y <= Vector2.Y and Vector1.Z <= Vector.Z))) and Vector.Z <= Vector2.Z
	end,
	isFirstLessOrEqual = function(Vector, Vector1): boolean --[[ Line: 10 ]]
		return Vector.X <= Vector1.X and Vector.Y <= Vector1.Y and Vector.Z <= Vector1.Z
	end
}