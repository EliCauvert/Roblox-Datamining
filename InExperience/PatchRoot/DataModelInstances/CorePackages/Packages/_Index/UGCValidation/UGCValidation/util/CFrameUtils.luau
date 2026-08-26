local valueToStringModule = require(script.Parent.valueToString)
local floatEqualsModule = require(script.Parent.Parent.util.floatEquals)

return {
	fuzzyEq = function(p1, p2, p3)
		-- upvalues: floatEqualsModule (ref)
		local components, components_1, components_2, components_3, components_4, components_5, components_6, components_7, components_8, components_9, components_10, components_11 = p1:GetComponents()
		local components_12, components_13, components_14, components_15, components_16, components_17, components_18, components_19, components_20, components_21, components_22, components_23 = p2:GetComponents()
		
		return floatEqualsModule(components, components_12, p3) and (floatEqualsModule(components_1, components_13, p3) and (floatEqualsModule(components_2, components_14, p3) and (floatEqualsModule(components_3, components_15, p3) and (floatEqualsModule(components_4, components_16, p3) and (floatEqualsModule(components_5, components_17, p3) and (floatEqualsModule(components_6, components_18, p3) and (floatEqualsModule(components_7, components_19, p3) and (floatEqualsModule(components_8, components_20, p3) and (floatEqualsModule(components_9, components_21, p3) and (floatEqualsModule(components_10, components_22, p3) and floatEqualsModule(components_11, components_23, p3)))))))))))
	end,
	getRotationString = function(p1)
		-- upvalues: valueToStringModule (ref)
		local vector3 = Vector3.new(p1:ToOrientation())
		
		return valueToStringModule(Vector3.new(math.deg(vector3.X), math.deg(vector3.Y), math.deg(vector3.Z)))
	end
}