local TModule = require(script.Parent.Parent.Parent.t)

return (TModule.intersection(TModule.Vector2, function(Vector)
	if Vector.X < 0 or Vector.Y < 0 then
		return false, ("each component of the Vector2 must be >= 0; component values are: %d, %d"):format(Vector.X, Vector.Y)
	else
		return true
	end
end))