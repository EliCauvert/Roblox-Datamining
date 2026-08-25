local function createLiteralKind(p0)
	return { type = "literal", value = p0 }
end

local function createBindingPathKind(p1)
	return { type = "binding_path", value = p1 }
end

local _ = nil

local function createStructValue(p2)
	-- upvalues: createStructValue (write)
	local var3 = typeof(p2)
	
	if p2 == nil then
		return { kind = { type = "null_value", value = 0 } }
	elseif var3 == "string" then
		return { kind = { type = "string_value", value = p2 } }
	elseif var3 == "number" then
		return { kind = { type = "number_value", value = p2 } }
	elseif var3 == "boolean" then
		return { kind = { type = "bool_value", value = p2 } }
	elseif var3 ~= "table" then
		error(`createStructValue cannot represent a {var3}`)
	end
	if next(p2) == nil or p2[1] ~= nil then
		local t = {}
		
		for i, v in p2 do
			t[i] = createStructValue(v)
		end
		return { kind = { type = "list_value", value = { values = t } } }
	else
		local t = {}
		
		for i, v in p2 do
			t[i] = createStructValue(v)
		end
		return { kind = { type = "struct_value", value = { fields = t } } }
	end
end

return {
	createLiteralKind = createLiteralKind,
	createBindingPathKind = createBindingPathKind,
	createStructValue = createStructValue,
	createMockStruct = function(p3)
		-- upvalues: createStructValue (write)
		local t = {}
		
		for i, v in p3 do
			t[i] = createStructValue(v)
		end
		return { fields = t }
	end,
	createLiteralProp = function(p4, p5)
		return {
			kind = { type = "literal", value = p4 },
			descriptor = { name = p5, fullName = p5 }
		}
	end,
	createBindingPathProp = function(p6, p7)
		return {
			kind = { type = "binding_path", value = p6 },
			descriptor = { name = p7, fullName = p7 }
		}
	end,
	createTokenProp = function(p8, p9)
		return {
			kind = { type = "token", value = p8 },
			descriptor = { name = p9, fullName = p9 }
		}
	end,
	createMockInlineComponent = function(p10, p11)
		return {
			kind = {
				value = { props = p11, shared = { component_type = p10 } }
			}
		}
	end,
	createMockInputForNestedComponent = function(p12, p13)
		return if p12 == "literal" then {
			kind = { type = "literal", value = { kind = { value = p13 } } }
		} elseif p12 == "translation" then { kind = { type = "translation", value = p13 } } else { kind = { type = "binding_path", value = p13 } }
	end,
	createMockConditionalPropValue = function(p14, p15)
		return {
			kind = { type = "conditional", value = { options = p14 } },
			descriptor = { fullName = p15, name = p15 }
		}
	end,
	createMockConditionalOptions = function(p16)
		return { options = p16 }
	end,
	createMockComparisonConditionOption = function(p17, p18, p19, p20)
		return {
			condition = {
				kind = {
					type = "comparison",
					value = { op = p17, field = p18, kind = { value = p19 } }
				}
			},
			kind = p20
		}
	end,
	createMockIsNullConditionOption = function(p21, p22)
		return {
			condition = { kind = { type = "is_null", value = { field = p21 } } },
			kind = p22
		}
	end,
	createMockIsNotNullConditionOption = function(p23, p24)
		return {
			condition = { kind = { type = "is_not_null", value = { field = p23 } } },
			kind = p24
		}
	end,
	createMockIsEmptyConditionOption = function(p25, p26)
		return {
			condition = { kind = { type = "is_empty", value = { field = p25 } } },
			kind = p26
		}
	end,
	createMockIsNotEmptyConditionOption = function(p27, p28)
		return {
			condition = {
				kind = { type = "is_not_empty", value = { field = p27 } }
			},
			kind = p28
		}
	end,
	createMockAndConditionOption = function(p29, p30)
		return {
			condition = {
				kind = { type = "and_condition", value = { conditions = p29 } }
			},
			kind = p30
		}
	end,
	createMockOrConditionOption = function(p31, p32)
		return {
			condition = {
				kind = { type = "or_condition", value = { conditions = p31 } }
			},
			kind = p32
		}
	end,
	createMockNestedComponentConditionalOption = function(p33, p34, p35)
		return {
			condition = p33,
			kind = {
				type = "literal",
				value = { roblox_component = p34, inputs = p35 }
			}
		}
	end
}