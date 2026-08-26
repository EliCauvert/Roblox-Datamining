local function createLiteralKind(p1)
	return { type = "literal", value = p1 }
end

local function createBindingPathKind(p1)
	return { type = "binding_path", value = p1 }
end

local _ = nil

local function createStructValue(p1)
	-- upvalues: createStructValue (write)
	local var1 = typeof(p1)
	
	if p1 == nil then
		return { kind = { type = "null_value", value = 0 } }
	elseif var1 == "string" then
		return { kind = { type = "string_value", value = p1 } }
	elseif var1 == "number" then
		return { kind = { type = "number_value", value = p1 } }
	elseif var1 == "boolean" then
		return { kind = { type = "bool_value", value = p1 } }
	elseif var1 ~= "table" then
		error(`createStructValue cannot represent a {var1}`)
	end
	if next(p1) == nil or p1[1] ~= nil then
		local t = {}
		
		for i, v in p1 do
			t[i] = createStructValue(v)
		end
		return { kind = { type = "list_value", value = { values = t } } }
	else
		local t = {}
		
		for i, v in p1 do
			t[i] = createStructValue(v)
		end
		return { kind = { type = "struct_value", value = { fields = t } } }
	end
end

return {
	createLiteralKind = createLiteralKind,
	createBindingPathKind = createBindingPathKind,
	createStructValue = createStructValue,
	createMockStruct = function(p2)
		-- upvalues: createStructValue (write)
		local t = {}
		
		for i, v in p2 do
			t[i] = createStructValue(v)
		end
		return { fields = t }
	end,
	createLiteralProp = function(p3, p4)
		return {
			kind = { type = "literal", value = p3 },
			descriptor = { name = p4, fullName = p4 }
		}
	end,
	createBindingPathProp = function(p3, p4)
		return {
			kind = { type = "binding_path", value = p3 },
			descriptor = { name = p4, fullName = p4 }
		}
	end,
	createTokenProp = function(p3, p4)
		return {
			kind = { type = "token", value = p3 },
			descriptor = { name = p4, fullName = p4 }
		}
	end,
	createMockInlineComponent = function(p3, p4)
		return {
			kind = {
				value = { props = p4, shared = { component_type = p3 } }
			}
		}
	end,
	createMockInputForNestedComponent = function(p3, p4)
		return if p3 == "literal" then {
			kind = { type = "literal", value = { kind = { value = p4 } } }
		} elseif p3 == "translation" then { kind = { type = "translation", value = p4 } } else { kind = { type = "binding_path", value = p4 } }
	end,
	createMockConditionalPropValue = function(p3, p4)
		return {
			kind = { type = "conditional", value = { options = p3 } },
			descriptor = { fullName = p4, name = p4 }
		}
	end,
	createMockConditionalOptions = function(p3)
		return { options = p3 }
	end,
	createMockComparisonConditionOption = function(p3, p4, p5, p6)
		return {
			condition = {
				kind = {
					type = "comparison",
					value = { op = p3, field = p4, kind = { value = p5 } }
				}
			},
			kind = p6
		}
	end,
	createMockIsNullConditionOption = function(p3, p4)
		return {
			condition = { kind = { type = "is_null", value = { field = p3 } } },
			kind = p4
		}
	end,
	createMockIsNotNullConditionOption = function(p3, p4)
		return {
			condition = { kind = { type = "is_not_null", value = { field = p3 } } },
			kind = p4
		}
	end,
	createMockIsEmptyConditionOption = function(p3, p4)
		return {
			condition = { kind = { type = "is_empty", value = { field = p3 } } },
			kind = p4
		}
	end,
	createMockIsNotEmptyConditionOption = function(p3, p4)
		return {
			condition = {
				kind = { type = "is_not_empty", value = { field = p3 } }
			},
			kind = p4
		}
	end,
	createMockAndConditionOption = function(p3, p4)
		return {
			condition = {
				kind = { type = "and_condition", value = { conditions = p3 } }
			},
			kind = p4
		}
	end,
	createMockOrConditionOption = function(p3, p4)
		return {
			condition = {
				kind = { type = "or_condition", value = { conditions = p3 } }
			},
			kind = p4
		}
	end,
	createMockNestedComponentConditionalOption = function(p3, p4, p5)
		return {
			condition = p3,
			kind = {
				type = "literal",
				value = { roblox_component = p4, inputs = p5 }
			}
		}
	end
}