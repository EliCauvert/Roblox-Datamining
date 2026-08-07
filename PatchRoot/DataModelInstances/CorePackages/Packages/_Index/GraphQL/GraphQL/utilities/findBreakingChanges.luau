-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:38 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local keyMapOrdered = require(parent.luaUtils.keyMapOrdered).keyMapOrdered
local jsutils = parent.jsutils
local inspect = require(jsutils.inspect).inspect
local invariant = require(jsutils.invariant).invariant
local naturalCompare = require(jsutils.naturalCompare).naturalCompare
local language = parent.language
local print = require(language.printer).print
local visit = require(language.visitor).visit
local _ = require(language.ast)
local type = parent.type
local _ = require(type.schema)
local definitionModule = require(type.definition)
local isSpecifiedScalarType = require(type.scalars).isSpecifiedScalarType
local isScalarType = definitionModule.isScalarType
local isObjectType = definitionModule.isObjectType
local isInterfaceType = definitionModule.isInterfaceType
local isUnionType = definitionModule.isUnionType
local isEnumType = definitionModule.isEnumType
local isInputObjectType = definitionModule.isInputObjectType
local isNonNullType = definitionModule.isNonNullType
local isListType = definitionModule.isListType
local isNamedType = definitionModule.isNamedType
local isRequiredArgument = definitionModule.isRequiredArgument
local isRequiredInputField = definitionModule.isRequiredInputField
local astFromValue = require(script.Parent.astFromValue).astFromValue
local findSchemaChanges = nil
local findTypeChanges = nil
local findDirectiveChanges = nil
local diff = nil
local findEnumTypeChanges = nil
local findUnionTypeChanges = nil
local findInputObjectTypeChanges = nil
local findFieldChanges = nil
local findImplementedInterfacesChanges = nil
local typeKindName = nil
local isChangeSafeForInputObjectFieldOrFieldArg = nil
local findArgChanges = nil
local isChangeSafeForObjectOrInterfaceField = nil
local stringifyValue = nil
local var16 = object.freeze({
	TYPE_REMOVED = "TYPE_REMOVED",
	TYPE_CHANGED_KIND = "TYPE_CHANGED_KIND",
	TYPE_REMOVED_FROM_UNION = "TYPE_REMOVED_FROM_UNION",
	VALUE_REMOVED_FROM_ENUM = "VALUE_REMOVED_FROM_ENUM",
	REQUIRED_INPUT_FIELD_ADDED = "REQUIRED_INPUT_FIELD_ADDED",
	IMPLEMENTED_INTERFACE_REMOVED = "IMPLEMENTED_INTERFACE_REMOVED",
	FIELD_REMOVED = "FIELD_REMOVED",
	FIELD_CHANGED_KIND = "FIELD_CHANGED_KIND",
	REQUIRED_ARG_ADDED = "REQUIRED_ARG_ADDED",
	ARG_REMOVED = "ARG_REMOVED",
	ARG_CHANGED_KIND = "ARG_CHANGED_KIND",
	DIRECTIVE_REMOVED = "DIRECTIVE_REMOVED",
	DIRECTIVE_ARG_REMOVED = "DIRECTIVE_ARG_REMOVED",
	REQUIRED_DIRECTIVE_ARG_ADDED = "REQUIRED_DIRECTIVE_ARG_ADDED",
	DIRECTIVE_REPEATABLE_REMOVED = "DIRECTIVE_REPEATABLE_REMOVED",
	DIRECTIVE_LOCATION_REMOVED = "DIRECTIVE_LOCATION_REMOVED"
})
local var17 = object.freeze({
	VALUE_ADDED_TO_ENUM = "VALUE_ADDED_TO_ENUM",
	TYPE_ADDED_TO_UNION = "TYPE_ADDED_TO_UNION",
	OPTIONAL_INPUT_FIELD_ADDED = "OPTIONAL_INPUT_FIELD_ADDED",
	OPTIONAL_ARG_ADDED = "OPTIONAL_ARG_ADDED",
	IMPLEMENTED_INTERFACE_ADDED = "IMPLEMENTED_INTERFACE_ADDED",
	ARG_DEFAULT_VALUE_CHANGE = "ARG_DEFAULT_VALUE_CHANGE"
})

local function findBreakingChanges(p0, p1) --[[ line: 122 ]]
	-- upvalues: array (ref), findSchemaChanges (write), var16 (ref)
	return array.filter(findSchemaChanges(p0, p1), function(p2) --[[ line: 126 ]]
		-- upvalues: var16 (copy)
		return var16[p2.type] ~= nil
	end)
end

local function findDangerousChanges(p3, p4) --[[ line: 136 ]]
	-- upvalues: array (ref), findSchemaChanges (write), var17 (ref)
	return array.filter(findSchemaChanges(p3, p4), function(p5) --[[ line: 140 ]]
		-- upvalues: var17 (copy)
		return var17[p5.type] ~= nil
	end)
end

findSchemaChanges = function(p6, p7) --[[ line: 146 | named "findSchemaChanges" ]]
	-- upvalues: array (ref), findTypeChanges (write), findDirectiveChanges (write)
	return array.concat(findTypeChanges(p6, p7), findDirectiveChanges(p6, p7))
end

findDirectiveChanges = function(p8, p9) --[[ line: 156 | named "findDirectiveChanges" ]]
	-- upvalues: diff (write), var16 (ref), isRequiredArgument (ref)
	local t = {}
	local var21 = diff(p8:getDirectives(), p9:getDirectives())
	
	for i, v in ipairs(var21.removed) do
		table.insert(t, {
			type = var16.DIRECTIVE_REMOVED,
			description = ("%s was removed."):format(v.name)
		})
	end
	for i, v_1 in ipairs(var21.persisted) do
		local var22 = v_1[1]
		local var23 = v_1[2]
		local var24 = diff(var22.args, var23.args)
		
		for i_2, v_2 in ipairs(var24.added) do
			if isRequiredArgument(v_2) then
				table.insert(t, {
					type = var16.REQUIRED_DIRECTIVE_ARG_ADDED,
					description = ("A required arg %s on directive %s was added."):format(v_2.name, var22.name)
				})
			end
		end
		for i_2, v_2 in ipairs(var24.removed) do
			table.insert(t, {
				type = var16.DIRECTIVE_ARG_REMOVED,
				description = ("%s was removed from %s."):format(v_2.name, var22.name)
			})
		end
		if var22.isRepeatable and not var23.isRepeatable then
			table.insert(t, {
				type = var16.DIRECTIVE_REPEATABLE_REMOVED,
				description = ("Repeatable flag was removed from %s."):format(var22.name)
			})
		end
		for i_2, v_2 in ipairs(var22.locations) do
			if table.find(var23.locations, v_2) == nil then
				table.insert(t, {
					type = var16.DIRECTIVE_LOCATION_REMOVED,
					description = ("%s was removed from %s."):format(v_2, var22.name)
				})
			end
		end
	end
	return t
end

findTypeChanges = function(p10, p11) --[[ line: 215 | named "findTypeChanges" ]]
	-- upvalues: diff (write), var16 (ref), isSpecifiedScalarType (ref), isEnumType (ref), findEnumTypeChanges (write), isUnionType (ref), findUnionTypeChanges (write), isInputObjectType (ref), findInputObjectTypeChanges (write), isObjectType (ref), array (ref), findFieldChanges (write), findImplementedInterfacesChanges (write), isInterfaceType (ref), typeKindName (write)
	local t = {}
	local var26 = diff(p10:getTypeMap():values(), p11:getTypeMap():values())
	
	for i, v in ipairs(var26.removed) do
		table.insert(t, {
			type = var16.TYPE_REMOVED,
			description = isSpecifiedScalarType(v) and ("Standard scalar %s was removed because it is not referenced anymore."):format(v.name) or ("%s was removed."):format(v.name)
		})
	end
	for i, v_1 in ipairs(var26.persisted) do
		local var27 = v_1[1]
		local var28 = v_1[2]
		
		if isEnumType(var27) and isEnumType(var28) then
			for i_2, v_2 in ipairs(findEnumTypeChanges(var27, var28)) do
				table.insert(t, v_2)
			end
		end
		if isUnionType(var27) and isUnionType(var28) then
			for i_2, v_2 in ipairs(findUnionTypeChanges(var27, var28)) do
				table.insert(t, v_2)
			end
		end
		if isInputObjectType(var27) and isInputObjectType(var28) then
			for i_2, v_2 in ipairs(findInputObjectTypeChanges(var27, var28)) do
				table.insert(t, v_2)
			end
		elseif isObjectType(var27) and isObjectType(var28) then
			for i_2, v_2 in ipairs(array.concat(findFieldChanges(var27, var28), findImplementedInterfacesChanges(var27, var28))) do
				table.insert(t, v_2)
			end
		elseif isInterfaceType(var27) and isInterfaceType(var28) then
			for i_2, v_2 in ipairs(array.concat(findFieldChanges(var27, var28), findImplementedInterfacesChanges(var27, var28))) do
				table.insert(t, v_2)
			end
		elseif var27.new ~= var28.new then
			table.insert(t, {
				type = var16.TYPE_CHANGED_KIND,
				description = ("%s changed from %s to %s."):format(var27.name, typeKindName(var27), typeKindName(var28))
			})
		end
	end
	return t
end

findInputObjectTypeChanges = function(p12, p13) --[[ line: 284 | named "findInputObjectTypeChanges" ]]
	-- upvalues: diff (write), isRequiredInputField (ref), var16 (ref), var17 (ref), isChangeSafeForInputObjectFieldOrFieldArg (write)
	local t = {}
	local var30 = diff(p12:getFields():values(), p13:getFields():values())
	
	for i, v in ipairs(var30.added) do
		if isRequiredInputField(v) then
			table.insert(t, {
				type = var16.REQUIRED_INPUT_FIELD_ADDED,
				description = ("A required field %s on input type %s was added."):format(v.name, p12.name)
			})
		else
			table.insert(t, {
				type = var17.OPTIONAL_INPUT_FIELD_ADDED,
				description = ("An optional field %s on input type %s was added."):format(v.name, p12.name)
			})
		end
	end
	for i, v_1 in ipairs(var30.removed) do
		table.insert(t, {
			type = var16.FIELD_REMOVED,
			description = ("%s.%s was removed."):format(p12.name, v_1.name)
		})
	end
	for i, v_2 in ipairs(var30.persisted) do
		local var31 = v_2[1]
		local var32 = v_2[2]
		
		if not isChangeSafeForInputObjectFieldOrFieldArg(var31.type, var32.type) then
			table.insert(t, {
				type = var16.FIELD_CHANGED_KIND,
				description = ("%s.%s changed type from %s to %s."):format(p12.name, var31.name, tostring(var31.type), tostring(var32.type))
			})
		end
	end
	return t
end

findUnionTypeChanges = function(p14, p15) --[[ line: 339 | named "findUnionTypeChanges" ]]
	-- upvalues: diff (write), var17 (ref), var16 (ref)
	local t = {}
	local var34 = diff(p14:getTypes(), p15:getTypes())
	
	for i, v in ipairs(var34.added) do
		table.insert(t, {
			type = var17.TYPE_ADDED_TO_UNION,
			description = ("%s was added to union type %s."):format(v.name, p14.name)
		})
	end
	for i, v_1 in ipairs(var34.removed) do
		table.insert(t, {
			type = var16.TYPE_REMOVED_FROM_UNION,
			description = ("%s was removed from union type %s."):format(v_1.name, p14.name)
		})
	end
	return t
end

findEnumTypeChanges = function(p16, p17) --[[ line: 368 | named "findEnumTypeChanges" ]]
	-- upvalues: diff (write), var17 (ref), var16 (ref)
	local t = {}
	local var36 = diff(p16:getValues(), p17:getValues())
	
	for i, v in ipairs(var36.added) do
		table.insert(t, {
			type = var17.VALUE_ADDED_TO_ENUM,
			description = ("%s was added to enum type %s."):format(v.name, p16.name)
		})
	end
	for i, v_1 in ipairs(var36.removed) do
		table.insert(t, {
			type = var16.VALUE_REMOVED_FROM_ENUM,
			description = ("%s was removed from enum type %s."):format(v_1.name, p16.name)
		})
	end
	return t
end

findImplementedInterfacesChanges = function(p18, p19) --[[ line: 390 | named "findImplementedInterfacesChanges" ]]
	-- upvalues: diff (write), var17 (ref), var16 (ref)
	local t = {}
	local var38 = diff(p18:getInterfaces(), p19:getInterfaces())
	
	for i, v in ipairs(var38.added) do
		table.insert(t, {
			type = var17.IMPLEMENTED_INTERFACE_ADDED,
			description = ("%s added to interfaces implemented by %s."):format(v.name, p18.name)
		})
	end
	for i, v_1 in ipairs(var38.removed) do
		table.insert(t, {
			type = var16.IMPLEMENTED_INTERFACE_REMOVED,
			description = ("%s no longer implements interface %s."):format(p18.name, v_1.name)
		})
	end
	return t
end

findFieldChanges = function(p20, p21) --[[ line: 420 | named "findFieldChanges" ]]
	-- upvalues: diff (write), var16 (ref), findArgChanges (write), isChangeSafeForObjectOrInterfaceField (write)
	local t = {}
	local var40 = diff(p20:getFields():values(), p21:getFields():values())
	
	for i, v in ipairs(var40.removed) do
		table.insert(t, {
			type = var16.FIELD_REMOVED,
			description = ("%s.%s was removed."):format(p20.name, v.name)
		})
	end
	for i, v_1 in ipairs(var40.persisted) do
		local var41 = v_1[1]
		local var42 = v_1[2]
		
		for i_2, v_2 in ipairs(findArgChanges(p20, var41, var42)) do
			table.insert(t, v_2)
		end
		if not isChangeSafeForObjectOrInterfaceField(var41.type, var42.type) then
			table.insert(t, {
				type = var16.FIELD_CHANGED_KIND,
				description = ("%s.%s changed type from "):format(p20.name, var41.name) .. ("%s to %s."):format(tostring(var41.type), tostring(var42.type))
			})
		end
	end
	return t
end

findArgChanges = function(p22, p23, p24) --[[ line: 461 | named "findArgChanges" ]]
	-- upvalues: diff (write), var16 (ref), isChangeSafeForInputObjectFieldOrFieldArg (write), var17 (ref), stringifyValue (write), isRequiredArgument (ref)
	local t = {}
	local var44 = diff(p23.args, p24.args)
	
	for i, v in ipairs(var44.removed) do
		table.insert(t, {
			type = var16.ARG_REMOVED,
			description = ("%s.%s arg %s was removed."):format(p22.name, p23.name, v.name)
		})
	end
	for i, v_1 in ipairs(var44.persisted) do
		local var45 = v_1[1]
		local var46 = v_1[2]
		
		if not isChangeSafeForInputObjectFieldOrFieldArg(var45.type, var46.type) then
			table.insert(t, {
				type = var16.ARG_CHANGED_KIND,
				description = ("%s.%s arg %s has changed type from "):format(p22.name, p23.name, var45.name) .. ("%s to %s."):format(tostring(var45.type), tostring(var46.type))
			})
		elseif var45.defaultValue ~= nil then
			if var46.defaultValue == nil then
				table.insert(t, {
					type = var17.ARG_DEFAULT_VALUE_CHANGE,
					description = ("%s.%s arg %s defaultValue was removed."):format(p22.name, p23.name, var45.name)
				})
			else
				local var47 = stringifyValue(var45.defaultValue, var45.type)
				local var48 = stringifyValue(var46.defaultValue, var46.type)
				
				if var47 ~= var48 then
					table.insert(t, {
						type = var17.ARG_DEFAULT_VALUE_CHANGE,
						description = ("%s.%s arg %s has changed defaultValue from %s to %s."):format(p22.name, p23.name, var45.name, var47, var48)
					})
				end
			end
		end
	end
	for i, v_2 in ipairs(var44.added) do
		if isRequiredArgument(v_2) then
			table.insert(t, {
				type = var16.REQUIRED_ARG_ADDED,
				description = ("A required arg %s on %s.%s was added."):format(v_2.name, p22.name, p23.name)
			})
		else
			table.insert(t, {
				type = var17.OPTIONAL_ARG_ADDED,
				description = ("An optional arg %s on %s.%s was added."):format(v_2.name, p22.name, p23.name)
			})
		end
	end
	return t
end

isChangeSafeForObjectOrInterfaceField = function(p25, p26) --[[ line: 550 | named "isChangeSafeForObjectOrInterfaceField" ]]
	-- upvalues: isListType (ref), isChangeSafeForObjectOrInterfaceField (write), isNonNullType (ref), isNamedType (ref)
	return if isListType(p25) then isListType(p26) and isChangeSafeForObjectOrInterfaceField(p25.ofType, p26.ofType) or isNonNullType(p26) and isChangeSafeForObjectOrInterfaceField(p25, p26.ofType) elseif isNonNullType(p25) then isNonNullType(p26) and isChangeSafeForObjectOrInterfaceField(p25.ofType, p26.ofType) elseif isNamedType(p26) then true else isNonNullType(p26) and isChangeSafeForObjectOrInterfaceField(p25, p26.ofType)
end

isChangeSafeForInputObjectFieldOrFieldArg = function(p27, p28) --[[ line: 572 | named "isChangeSafeForInputObjectFieldOrFieldArg" ]]
	-- upvalues: isListType (ref), isChangeSafeForInputObjectFieldOrFieldArg (write), isNonNullType (ref), isNamedType (ref)
	return if isListType(p27) then isListType(p28) and isChangeSafeForInputObjectFieldOrFieldArg(p27.ofType, p28.ofType) elseif isNonNullType(p27) then isNonNullType(p28) and isChangeSafeForInputObjectFieldOrFieldArg(p27.ofType, p28.ofType) or not isNonNullType(p28) and isChangeSafeForInputObjectFieldOrFieldArg(p27.ofType, p28) else isNamedType(p28) and p27.name == p28.name
end

typeKindName = function(p29) --[[ line: 593 | named "typeKindName" ]]
	-- upvalues: isScalarType (ref), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isInputObjectType (ref), invariant (ref), inspect (ref)
	if isScalarType(p29) then
		return "a Scalar type"
	elseif isObjectType(p29) then
		return "an Object type"
	elseif isInterfaceType(p29) then
		return "an Interface type"
	elseif isUnionType(p29) then
		return "a Union type"
	elseif isEnumType(p29) then
		return "an Enum type"
	elseif isInputObjectType(p29) then
		return "an Input type"
	end
	invariant(false, "Unexpected type: " .. inspect(p29))
	
	return ""
end

stringifyValue = function(p30, p31) --[[ line: 620 | named "stringifyValue" ]]
	-- upvalues: astFromValue (ref), invariant (ref), visit (ref), array (ref), naturalCompare (ref), object (ref), print (ref)
	local var49 = astFromValue(p30, p31)
	invariant(var49 ~= nil)
	
	return print(visit(var49, {
		ObjectValue = function(_, p32) --[[ line: 628 ]]
			-- upvalues: array (copy), naturalCompare (copy), object (copy)
			local var50 = array.concat({}, p32.fields)
			array.sort(var50, function(p33, p34) --[[ line: 632 ]]
				-- upvalues: naturalCompare (copy)
				return naturalCompare(p33.name.value, p34.name.value)
			end)
			
			return object.assign({}, p32, { fields = var50 })
		end
	}))
end

diff = function(p35, p36) --[[ line: 645 | named "diff" ]]
	-- upvalues: keyMapOrdered (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var54 = keyMapOrdered(p35, function(p37) --[[ line: 656 ]]
		return p37.name
	end)
	local var55 = keyMapOrdered(p36, function(p38) --[[ line: 659 ]]
		return p38.name
	end)
	
	for i, v in ipairs(p35) do
		local name = var55:get(v.name)
		
		if name == nil then
			table.insert(t_1, v)
		else
			table.insert(t_2, { v, name })
		end
	end
	for i, v_1 in ipairs(p36) do
		if var54:get(v_1.name) == nil then
			table.insert(t, v_1)
		end
	end
	return { added = t, persisted = t_2, removed = t_1 }
end

return {
	BreakingChangeType = var16,
	DangerousChangeType = var17,
	findBreakingChanges = findBreakingChanges,
	findDangerousChanges = findDangerousChanges
}