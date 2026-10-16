local FloatEqualsModule = require(script.Parent.Parent.util.floatEquals)

return function(Vector): boolean --[[ Line: 9 | Named "canBeNormalized" ]]
	-- upvalues: FloatEqualsModule (copy)
	return not FloatEqualsModule(Vector.X, 0) or (not FloatEqualsModule(Vector.Y, 0) or not FloatEqualsModule(Vector.Z, 0))
end