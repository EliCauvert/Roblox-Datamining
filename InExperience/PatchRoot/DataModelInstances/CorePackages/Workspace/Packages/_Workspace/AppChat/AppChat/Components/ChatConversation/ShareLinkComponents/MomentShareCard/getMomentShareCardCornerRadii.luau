local GetCornerRadiiModule = require(script.Parent.Parent.getCornerRadii)

return function(p1, p2, p3) --[[ Line: 4 | Named "getMomentShareCardCornerRadii" ]]
	-- upvalues: GetCornerRadiiModule (copy)
	return GetCornerRadiiModule({
		topLeft = not (not p1 and p2),
		topRight = not (not p1 and not p2)
	}, p3)
end