local floatEqualsModule = require(script.Parent.Parent.util.floatEquals)

return function(p0)
	-- upvalues: floatEqualsModule (ref)
	return not floatEqualsModule(p0.X, 0) or (not floatEqualsModule(p0.Y, 0) or not floatEqualsModule(p0.Z, 0))
end