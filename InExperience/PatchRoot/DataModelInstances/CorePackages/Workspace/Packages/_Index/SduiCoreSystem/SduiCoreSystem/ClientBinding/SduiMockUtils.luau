return {
	createLiteralKind = function(p0) --[[ line: 16 ]]
		return { type = "literal", value = p0 }
	end,
	createBindingPathKind = function(p1) --[[ line: 26 ]]
		return { type = "binding_path", value = p1 }
	end,
	createLiteralProp = function(p2, p3) --[[ line: 42 ]]
		return {
			kind = { type = "literal", value = p2 },
			descriptor = { name = p3, fullName = p3 }
		}
	end,
	createBindingPathProp = function(p4, p5) --[[ line: 70 ]]
		return {
			kind = { type = "binding_path", value = p4 },
			descriptor = { name = p5, fullName = p5 }
		}
	end,
	createTokenProp = function(p6, p7) --[[ line: 56 ]]
		return {
			kind = { type = "token", value = p6 },
			descriptor = { name = p7, fullName = p7 }
		}
	end,
	createMockInlineComponent = function(p8, p9) --[[ line: 113 ]]
		return {
			kind = { value = { props = p9, shared = { component_type = p8 } } }
		}
	end,
	createMockInputForNestedComponent = function(p10, p11) --[[ line: 133 ]]
		return if p10 == "literal" then {
			kind = { type = "literal", value = { kind = { value = p11 } } }
		} elseif p10 == "translation" then { kind = { type = "translation", value = p11 } } else { kind = { type = "binding_path", value = p11 } }
	end,
	createMockConditionalPropValue = function(p12, p13) --[[ line: 186 ]]
		return {
			kind = { type = "conditional", value = { options = p12 } },
			descriptor = { fullName = p13, name = p13 }
		}
	end,
	createMockConditionalOptions = function(p14) --[[ line: 318 ]]
		return { options = p14 }
	end,
	createMockComparisonConditionOption = function(p15, p16, p17, p18) --[[ line: 205 ]]
		return {
			condition = {
				kind = {
					type = "comparison",
					value = { op = p15, field = p16, kind = { value = p17 } }
				}
			},
			kind = p18
		}
	end,
	createMockIsNullConditionOption = function(p19, p20) --[[ line: 228 ]]
		return {
			condition = { kind = { type = "is_null", value = { field = p19 } } },
			kind = p20
		}
	end,
	createMockIsNotNullConditionOption = function(p21, p22) --[[ line: 242 ]]
		return {
			condition = { kind = { type = "is_not_null", value = { field = p21 } } },
			kind = p22
		}
	end,
	createMockIsEmptyConditionOption = function(p23, p24) --[[ line: 256 ]]
		return {
			condition = { kind = { type = "is_empty", value = { field = p23 } } },
			kind = p24
		}
	end,
	createMockIsNotEmptyConditionOption = function(p25, p26) --[[ line: 270 ]]
		return {
			condition = {
				kind = { type = "is_not_empty", value = { field = p25 } }
			},
			kind = p26
		}
	end,
	createMockAndConditionOption = function(p27, p28) --[[ line: 284 ]]
		return {
			condition = {
				kind = { type = "and_condition", value = { conditions = p27 } }
			},
			kind = p28
		}
	end,
	createMockOrConditionOption = function(p29, p30) --[[ line: 298 ]]
		return {
			condition = {
				kind = { type = "or_condition", value = { conditions = p29 } }
			},
			kind = p30
		}
	end,
	createMockNestedComponentConditionalOption = function(p31, p32, p33) --[[ line: 169 ]]
		return {
			condition = p31,
			kind = {
				type = "literal",
				value = { roblox_component = p32, inputs = p33 }
			}
		}
	end
}