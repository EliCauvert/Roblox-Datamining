return {
	createLiteralKind = function(Value)
		return { type = "literal", value = Value }
	end,
	createBindingPathKind = function(Value)
		return { type = "binding_path", value = Value }
	end,
	createLiteralProp = function(Value, FullName)
		return {
			kind = { type = "literal", value = Value },
			descriptor = { name = FullName, fullName = FullName }
		}
	end,
	createBindingPathProp = function(Value, FullName)
		return {
			kind = { type = "binding_path", value = Value },
			descriptor = { name = FullName, fullName = FullName }
		}
	end,
	createTokenProp = function(Value, FullName)
		return {
			kind = { type = "token", value = Value },
			descriptor = { name = FullName, fullName = FullName }
		}
	end,
	createMockInlineComponent = function(Component_type, Props)
		return {
			kind = {
				value = {
					props = Props,
					shared = { component_type = Component_type }
				}
			}
		}
	end,
	createMockInputForNestedComponent = function(p1, Value)
		return if p1 == "literal" then {
			kind = { type = "literal", value = { kind = { value = Value } } }
		} elseif p1 == "translation" then { kind = { type = "translation", value = Value } } else { kind = { type = "binding_path", value = Value } }
	end,
	createMockConditionalPropValue = function(Options, FullName)
		return {
			kind = { type = "conditional", value = { options = Options } },
			descriptor = { fullName = FullName, name = FullName }
		}
	end,
	createMockConditionalOptions = function(Options)
		return { options = Options }
	end,
	createMockComparisonConditionOption = function(Op, Field, Value, Kind)
		return {
			condition = {
				kind = {
					type = "comparison",
					value = { op = Op, field = Field, kind = { value = Value } }
				}
			},
			kind = Kind
		}
	end,
	createMockIsNullConditionOption = function(Field, Kind)
		return {
			condition = { kind = { type = "is_null", value = { field = Field } } },
			kind = Kind
		}
	end,
	createMockIsNotNullConditionOption = function(Field, Kind)
		return {
			condition = {
				kind = { type = "is_not_null", value = { field = Field } }
			},
			kind = Kind
		}
	end,
	createMockIsEmptyConditionOption = function(Field, Kind)
		return {
			condition = { kind = { type = "is_empty", value = { field = Field } } },
			kind = Kind
		}
	end,
	createMockIsNotEmptyConditionOption = function(Field, Kind)
		return {
			condition = {
				kind = { type = "is_not_empty", value = { field = Field } }
			},
			kind = Kind
		}
	end,
	createMockAndConditionOption = function(Conditions, Kind)
		return {
			condition = {
				kind = {
					type = "and_condition",
					value = { conditions = Conditions }
				}
			},
			kind = Kind
		}
	end,
	createMockOrConditionOption = function(Conditions, Kind)
		return {
			condition = {
				kind = {
					type = "or_condition",
					value = { conditions = Conditions }
				}
			},
			kind = Kind
		}
	end,
	createMockNestedComponentConditionalOption = function(Condition, Roblox_component, Inputs)
		return {
			condition = Condition,
			kind = {
				type = "literal",
				value = { roblox_component = Roblox_component, inputs = Inputs }
			}
		}
	end
}