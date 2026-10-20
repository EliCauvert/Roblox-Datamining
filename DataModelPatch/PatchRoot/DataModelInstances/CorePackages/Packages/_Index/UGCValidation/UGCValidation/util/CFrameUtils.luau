local ValueToStringModule = require(script.Parent.valueToString)
local FloatEqualsModule = require(script.Parent.Parent.util.floatEquals)

return {
	fuzzyEq = function(CF, CF1, p1)
		-- upvalues: FloatEqualsModule (copy)
		local Components, Components2, Components3, Components4, Components5, Components6, Components7, Components8, Components9, Components10, Components11, Components12 = CF:GetComponents()
		local Components1, Components2_1, Components3_1, Components4_1, Components5_1, Components6_1, Components7_1, Components8_1, Components9_1, Components10_1, Components11_1, Components12_1 = CF1:GetComponents()
		
		return FloatEqualsModule(Components, Components1, p1) and (FloatEqualsModule(Components2, Components2_1, p1) and (FloatEqualsModule(Components3, Components3_1, p1) and (FloatEqualsModule(Components4, Components4_1, p1) and (FloatEqualsModule(Components5, Components5_1, p1) and (FloatEqualsModule(Components6, Components6_1, p1) and (FloatEqualsModule(Components7, Components7_1, p1) and (FloatEqualsModule(Components8, Components8_1, p1) and (FloatEqualsModule(Components9, Components9_1, p1) and (FloatEqualsModule(Components10, Components10_1, p1) and (FloatEqualsModule(Components11, Components11_1, p1) and FloatEqualsModule(Components12, Components12_1, p1)))))))))))
	end,
	getRotationString = function(CF)
		-- upvalues: ValueToStringModule (copy)
		local _Vector3 = Vector3.new(CF:ToOrientation())
		
		return ValueToStringModule((Vector3.new(math.deg(_Vector3.X), math.deg(_Vector3.Y), (math.deg(_Vector3.Z)))))
	end
}