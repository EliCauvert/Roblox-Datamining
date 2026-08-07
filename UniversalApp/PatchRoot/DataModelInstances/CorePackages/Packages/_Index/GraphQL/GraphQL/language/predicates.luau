local kind = require(script.Parent.kinds).Kind
local var0 = nil
local _ = nil
local _ = nil
local _ = nil
local var1 = nil
local var2 = nil
local var3 = nil
local var4 = nil

return {
	isDefinitionNode = function(p0) --[[ line: 20 ]]
		-- upvalues: var0 (write), var1 (write), var3 (write)
		return var0(p0) or (var1(p0) or var3(p0))
	end,
	isExecutableDefinitionNode = function(p1) --[[ line: 26 ]]
		-- upvalues: kind (ref)
		return if p1.kind ~= kind.OPERATION_DEFINITION then p1.kind == kind.FRAGMENT_DEFINITION else true
	end,
	isSelectionNode = function(p2) --[[ line: 30 ]]
		-- upvalues: kind (ref)
		return if p2.kind ~= kind.FIELD then if p2.kind ~= kind.FRAGMENT_SPREAD then p2.kind == kind.INLINE_FRAGMENT else true else true
	end,
	isValueNode = function(p3) --[[ line: 36 ]]
		-- upvalues: kind (ref)
		return if p3.kind ~= kind.VARIABLE then if p3.kind ~= kind.INT then if p3.kind ~= kind.FLOAT then if p3.kind ~= kind.STRING then if p3.kind ~= kind.BOOLEAN then if p3.kind ~= kind.NULL then if p3.kind ~= kind.ENUM then if p3.kind ~= kind.LIST then p3.kind == kind.OBJECT else true else true else true else true else true else true else true else true
	end,
	isTypeNode = function(p4) --[[ line: 48 ]]
		-- upvalues: kind (ref)
		return if p4.kind ~= kind.NAMED_TYPE then if p4.kind ~= kind.LIST_TYPE then p4.kind == kind.NON_NULL_TYPE else true else true
	end,
	isTypeSystemDefinitionNode = function(p5) --[[ line: 54 ]]
		-- upvalues: kind (ref), var2 (write)
		return if p5.kind ~= kind.SCHEMA_DEFINITION then var2(p5) or p5.kind == kind.DIRECTIVE_DEFINITION else true
	end,
	isTypeDefinitionNode = function(p6) --[[ line: 60 ]]
		-- upvalues: kind (ref)
		return if p6.kind ~= kind.SCALAR_TYPE_DEFINITION then if p6.kind ~= kind.OBJECT_TYPE_DEFINITION then if p6.kind ~= kind.INTERFACE_TYPE_DEFINITION then if p6.kind ~= kind.UNION_TYPE_DEFINITION then if p6.kind ~= kind.ENUM_TYPE_DEFINITION then p6.kind == kind.INPUT_OBJECT_TYPE_DEFINITION else true else true else true else true else true
	end,
	isTypeSystemExtensionNode = function(p7) --[[ line: 69 ]]
		-- upvalues: kind (ref), var4 (write)
		return if p7.kind ~= kind.SCHEMA_EXTENSION then var4(p7) else true
	end,
	isTypeExtensionNode = function(p8) --[[ line: 73 ]]
		-- upvalues: kind (ref)
		return if p8.kind ~= kind.SCALAR_TYPE_EXTENSION then if p8.kind ~= kind.OBJECT_TYPE_EXTENSION then if p8.kind ~= kind.INTERFACE_TYPE_EXTENSION then if p8.kind ~= kind.UNION_TYPE_EXTENSION then if p8.kind ~= kind.ENUM_TYPE_EXTENSION then p8.kind == kind.INPUT_OBJECT_TYPE_EXTENSION else true else true else true else true else true
	end
}