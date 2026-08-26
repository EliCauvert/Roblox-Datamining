local kind = require(script.Parent.kinds).Kind
local var1 = nil
local _ = nil
local _ = nil
local _ = nil
local var2 = nil
local var3 = nil
local var4 = nil
local var5 = nil

return {
	isDefinitionNode = function(p1)
		-- upvalues: var1 (write), var2 (write), var4 (write)
		return var1(p1) or (var2(p1) or var4(p1))
	end,
	isExecutableDefinitionNode = function(p1)
		-- upvalues: kind (ref)
		return if p1.kind ~= kind.OPERATION_DEFINITION then p1.kind == kind.FRAGMENT_DEFINITION else true
	end,
	isSelectionNode = function(p1)
		-- upvalues: kind (ref)
		return if p1.kind ~= kind.FIELD then if p1.kind ~= kind.FRAGMENT_SPREAD then p1.kind == kind.INLINE_FRAGMENT else true else true
	end,
	isValueNode = function(p1)
		-- upvalues: kind (ref)
		return if p1.kind ~= kind.VARIABLE then if p1.kind ~= kind.INT then if p1.kind ~= kind.FLOAT then if p1.kind ~= kind.STRING then if p1.kind ~= kind.BOOLEAN then if p1.kind ~= kind.NULL then if p1.kind ~= kind.ENUM then if p1.kind ~= kind.LIST then p1.kind == kind.OBJECT else true else true else true else true else true else true else true else true
	end,
	isTypeNode = function(p1)
		-- upvalues: kind (ref)
		return if p1.kind ~= kind.NAMED_TYPE then if p1.kind ~= kind.LIST_TYPE then p1.kind == kind.NON_NULL_TYPE else true else true
	end,
	isTypeSystemDefinitionNode = function(p1)
		-- upvalues: kind (ref), var3 (write)
		return if p1.kind ~= kind.SCHEMA_DEFINITION then var3(p1) or p1.kind == kind.DIRECTIVE_DEFINITION else true
	end,
	isTypeDefinitionNode = function(p1)
		-- upvalues: kind (ref)
		return if p1.kind ~= kind.SCALAR_TYPE_DEFINITION then if p1.kind ~= kind.OBJECT_TYPE_DEFINITION then if p1.kind ~= kind.INTERFACE_TYPE_DEFINITION then if p1.kind ~= kind.UNION_TYPE_DEFINITION then if p1.kind ~= kind.ENUM_TYPE_DEFINITION then p1.kind == kind.INPUT_OBJECT_TYPE_DEFINITION else true else true else true else true else true
	end,
	isTypeSystemExtensionNode = function(p1)
		-- upvalues: kind (ref), var5 (write)
		return if p1.kind ~= kind.SCHEMA_EXTENSION then var5(p1) else true
	end,
	isTypeExtensionNode = function(p1)
		-- upvalues: kind (ref)
		return if p1.kind ~= kind.SCALAR_TYPE_EXTENSION then if p1.kind ~= kind.OBJECT_TYPE_EXTENSION then if p1.kind ~= kind.INTERFACE_TYPE_EXTENSION then if p1.kind ~= kind.UNION_TYPE_EXTENSION then if p1.kind ~= kind.ENUM_TYPE_EXTENSION then p1.kind == kind.INPUT_OBJECT_TYPE_EXTENSION else true else true else true else true else true
	end
}