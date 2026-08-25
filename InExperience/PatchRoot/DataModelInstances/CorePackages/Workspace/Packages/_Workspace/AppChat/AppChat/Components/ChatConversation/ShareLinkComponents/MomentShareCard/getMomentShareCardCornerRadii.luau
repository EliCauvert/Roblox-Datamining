local getCornerRadiiModule = require(script.Parent.Parent.getCornerRadii)

return function(p0, p1, p2)
	-- upvalues: getCornerRadiiModule (ref)
	return getCornerRadiiModule({
		topLeft = not (not p0 and p1),
		topRight = not (not p0 and not p1)
	}, p2)
end