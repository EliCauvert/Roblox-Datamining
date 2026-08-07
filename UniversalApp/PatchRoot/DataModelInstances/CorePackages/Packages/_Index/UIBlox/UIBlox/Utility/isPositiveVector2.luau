local tModule = require(script.Parent.Parent.Parent.t)

return tModule.intersection(tModule.Vector2, function(p0) --[[ line: 7 ]]
	if p0.X < 0 or p0.Y < 0 then
		return false, ("each component of the Vector2 must be >= 0; component values are: %d, %d"):format(p0.X, p0.Y)
	end
	return true
end)