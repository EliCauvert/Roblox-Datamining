local tModule = require(script.Parent.Parent.Parent.t)

return tModule.intersection(tModule.Vector2, function(p1)
	if p1.X < 0 or p1.Y < 0 then
		return false, ("each component of the Vector2 must be >= 0; component values are: %d, %d"):format(p1.X, p1.Y)
	end
	return true
end)