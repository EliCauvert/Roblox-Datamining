local Kind = require(script.Parent.kinds).Kind
local Callback = nil
local Callback1 = nil
local Callback3 = nil
local Callback2 = nil
local Callback4 = nil

local function isDefinitionNode(p1)
	-- upvalues: Callback (ref), Callback1 (ref), Callback2 (ref)
	return Callback(p1) or (Callback1(p1) or Callback2(p1))
end

Callback = function(p1): boolean
	-- upvalues: Kind (copy)
	return p1.kind == Kind.OPERATION_DEFINITION or p1.kind == Kind.FRAGMENT_DEFINITION
end

Callback1 = function(p1)
	-- upvalues: Kind (copy), Callback3 (ref)
	return p1.kind == Kind.SCHEMA_DEFINITION or (Callback3(p1) or p1.kind == Kind.DIRECTIVE_DEFINITION)
end

Callback3 = function(p1): boolean
	-- upvalues: Kind (copy)
	return p1.kind == Kind.SCALAR_TYPE_DEFINITION or (p1.kind == Kind.OBJECT_TYPE_DEFINITION or (p1.kind == Kind.INTERFACE_TYPE_DEFINITION or (p1.kind == Kind.UNION_TYPE_DEFINITION or (p1.kind == Kind.ENUM_TYPE_DEFINITION or p1.kind == Kind.INPUT_OBJECT_TYPE_DEFINITION))))
end

Callback2 = function(p1)
	-- upvalues: Kind (copy), Callback4 (ref)
	return p1.kind == Kind.SCHEMA_EXTENSION or Callback4(p1)
end

Callback4 = function(p1): boolean
	-- upvalues: Kind (copy)
	return p1.kind == Kind.SCALAR_TYPE_EXTENSION or (p1.kind == Kind.OBJECT_TYPE_EXTENSION or (p1.kind == Kind.INTERFACE_TYPE_EXTENSION or (p1.kind == Kind.UNION_TYPE_EXTENSION or (p1.kind == Kind.ENUM_TYPE_EXTENSION or p1.kind == Kind.INPUT_OBJECT_TYPE_EXTENSION))))
end

return {
	isDefinitionNode = isDefinitionNode,
	isExecutableDefinitionNode = Callback,
	isSelectionNode = function(p1): boolean
		-- upvalues: Kind (copy)
		return p1.kind == Kind.FIELD or (p1.kind == Kind.FRAGMENT_SPREAD or p1.kind == Kind.INLINE_FRAGMENT)
	end,
	isValueNode = function(p1): boolean
		-- upvalues: Kind (copy)
		return p1.kind == Kind.VARIABLE or (p1.kind == Kind.INT or (p1.kind == Kind.FLOAT or (p1.kind == Kind.STRING or (p1.kind == Kind.BOOLEAN or (p1.kind == Kind.NULL or (p1.kind == Kind.ENUM or (p1.kind == Kind.LIST or p1.kind == Kind.OBJECT)))))))
	end,
	isTypeNode = function(p1): boolean
		-- upvalues: Kind (copy)
		return p1.kind == Kind.NAMED_TYPE or (p1.kind == Kind.LIST_TYPE or p1.kind == Kind.NON_NULL_TYPE)
	end,
	isTypeSystemDefinitionNode = Callback1,
	isTypeDefinitionNode = Callback3,
	isTypeSystemExtensionNode = Callback2,
	isTypeExtensionNode = Callback4
}