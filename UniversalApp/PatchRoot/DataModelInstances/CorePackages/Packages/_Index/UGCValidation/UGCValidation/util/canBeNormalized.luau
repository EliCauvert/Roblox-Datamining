local floatEqualsModule = require(script.Parent.Parent.util.floatEquals)

return function(p1)
	-- upvalues: floatEqualsModule (ref)
	return not floatEqualsModule(p1.X, 0) or (not floatEqualsModule(p1.Y, 0) or not floatEqualsModule(p1.Z, 0))
end