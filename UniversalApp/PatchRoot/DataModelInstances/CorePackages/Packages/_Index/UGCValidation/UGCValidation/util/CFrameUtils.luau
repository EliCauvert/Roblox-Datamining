local valueToStringModule = require(script.Parent.valueToString)
local floatEqualsModule = require(script.Parent.Parent.util.floatEquals)

return {
	fuzzyEq = function(p0, p1, p2)
		-- upvalues: floatEqualsModule (ref)
		local components, components_1, components_2, components_3, components_4, components_5, components_6, components_7, components_8, components_9, components_10, components_11 = p0:GetComponents()
		local components_12, components_13, components_14, components_15, components_16, components_17, components_18, components_19, components_20, components_21, components_22, components_23 = p1:GetComponents()
		
		return floatEqualsModule(components, components_12, p2) and (floatEqualsModule(components_1, components_13, p2) and (floatEqualsModule(components_2, components_14, p2) and (floatEqualsModule(components_3, components_15, p2) and (floatEqualsModule(components_4, components_16, p2) and (floatEqualsModule(components_5, components_17, p2) and (floatEqualsModule(components_6, components_18, p2) and (floatEqualsModule(components_7, components_19, p2) and (floatEqualsModule(components_8, components_20, p2) and (floatEqualsModule(components_9, components_21, p2) and (floatEqualsModule(components_10, components_22, p2) and floatEqualsModule(components_11, components_23, p2)))))))))))
	end,
	getRotationString = function(p3)
		-- upvalues: valueToStringModule (ref)
		local vector3 = Vector3.new(p3:ToOrientation())
		
		return valueToStringModule(Vector3.new(math.deg(vector3.X), math.deg(vector3.Y), math.deg(vector3.Z)))
	end
}