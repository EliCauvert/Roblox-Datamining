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
local var1 = object.freeze({
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
local var2 = object.freeze({
	VALUE_ADDED_TO_ENUM = "VALUE_ADDED_TO_ENUM",
	TYPE_ADDED_TO_UNION = "TYPE_ADDED_TO_UNION",
	OPTIONAL_INPUT_FIELD_ADDED = "OPTIONAL_INPUT_FIELD_ADDED",
	OPTIONAL_ARG_ADDED = "OPTIONAL_ARG_ADDED",
	IMPLEMENTED_INTERFACE_ADDED = "IMPLEMENTED_INTERFACE_ADDED",
	ARG_DEFAULT_VALUE_CHANGE = "ARG_DEFAULT_VALUE_CHANGE"
})

local function findBreakingChanges(p1, p2)
	-- upvalues: array (ref), findSchemaChanges (write), var1 (ref)
	return array.filter(findSchemaChanges(p1, p2), function(p3)
		-- upvalues: var1 (copy)
		return var1[p3.type] ~= nil
	end)
end

local function findDangerousChanges(p1, p2)
	-- upvalues: array (ref), findSchemaChanges (write), var2 (ref)
	return array.filter(findSchemaChanges(p1, p2), function(p3)
		-- upvalues: var2 (copy)
		return var2[p3.type] ~= nil
	end)
end

findSchemaChanges = function(p1, p2)
	-- upvalues: array (ref), findTypeChanges (write), findDirectiveChanges (write)
	return array.concat(findTypeChanges(p1, p2), findDirectiveChanges(p1, p2))
end

findDirectiveChanges = function(p1, p2)
	-- upvalues: diff (write), var1 (ref), isRequiredArgument (ref)
	local t = {}
	local var3 = diff(p1:getDirectives(), p2:getDirectives())
	
	for i, v in ipairs(var3.removed) do
		table.insert(t, {
			type = var1.DIRECTIVE_REMOVED,
			description = ("%s was removed."):format(v.name)
		})
	end
	for i, v_1 in ipairs(var3.persisted) do
		local var4 = v_1[1]
		local var5 = v_1[2]
		local var6 = diff(var4.args, var5.args)
		
		for i_2, v_2 in ipairs(var6.added) do
			if isRequiredArgument(v_2) then
				table.insert(t, {
					type = var1.REQUIRED_DIRECTIVE_ARG_ADDED,
					description = ("A required arg %s on directive %s was added."):format(v_2.name, var4.name)
				})
			end
		end
		for i_2, v_2 in ipairs(var6.removed) do
			table.insert(t, {
				type = var1.DIRECTIVE_ARG_REMOVED,
				description = ("%s was removed from %s."):format(v_2.name, var4.name)
			})
		end
		if var4.isRepeatable and not var5.isRepeatable then
			table.insert(t, {
				type = var1.DIRECTIVE_REPEATABLE_REMOVED,
				description = ("Repeatable flag was removed from %s."):format(var4.name)
			})
		end
		for i_2, v_2 in ipairs(var4.locations) do
			if table.find(var5.locations, v_2) == nil then
				table.insert(t, {
					type = var1.DIRECTIVE_LOCATION_REMOVED,
					description = ("%s was removed from %s."):format(v_2, var4.name)
				})
			end
		end
	end
	return t
end

findTypeChanges = function(p3, p4)
	-- upvalues: diff (write), var1 (ref), isSpecifiedScalarType (ref), isEnumType (ref), findEnumTypeChanges (write), isUnionType (ref), findUnionTypeChanges (write), isInputObjectType (ref), findInputObjectTypeChanges (write), isObjectType (ref), array (ref), findFieldChanges (write), findImplementedInterfacesChanges (write), isInterfaceType (ref), typeKindName (write)
	local t = {}
	local var7 = diff(p3:getTypeMap():values(), p4:getTypeMap():values())
	
	for i, v in ipairs(var7.removed) do
		table.insert(t, {
			type = var1.TYPE_REMOVED,
			description = isSpecifiedScalarType(v) and ("Standard scalar %s was removed because it is not referenced anymore."):format(v.name) or ("%s was removed."):format(v.name)
		})
	end
	for i, v_1 in ipairs(var7.persisted) do
		local var8 = v_1[1]
		local var9 = v_1[2]
		
		if isEnumType(var8) and isEnumType(var9) then
			for i_2, v_2 in ipairs(findEnumTypeChanges(var8, var9)) do
				table.insert(t, v_2)
			end
		end
		if isUnionType(var8) and isUnionType(var9) then
			for i_2, v_2 in ipairs(findUnionTypeChanges(var8, var9)) do
				table.insert(t, v_2)
			end
		end
		if isInputObjectType(var8) and isInputObjectType(var9) then
			for i_2, v_2 in ipairs(findInputObjectTypeChanges(var8, var9)) do
				table.insert(t, v_2)
			end
		elseif isObjectType(var8) and isObjectType(var9) then
			for i_2, v_2 in ipairs(array.concat(findFieldChanges(var8, var9), findImplementedInterfacesChanges(var8, var9))) do
				table.insert(t, v_2)
			end
		elseif isInterfaceType(var8) and isInterfaceType(var9) then
			for i_2, v_2 in ipairs(array.concat(findFieldChanges(var8, var9), findImplementedInterfacesChanges(var8, var9))) do
				table.insert(t, v_2)
			end
		elseif var8.new ~= var9.new then
			table.insert(t, {
				type = var1.TYPE_CHANGED_KIND,
				description = ("%s changed from %s to %s."):format(var8.name, typeKindName(var8), typeKindName(var9))
			})
		end
	end
	return t
end

findInputObjectTypeChanges = function(p5, p6)
	-- upvalues: diff (write), isRequiredInputField (ref), var1 (ref), var2 (ref), isChangeSafeForInputObjectFieldOrFieldArg (write)
	local t = {}
	local var10 = diff(p5:getFields():values(), p6:getFields():values())
	
	for i, v in ipairs(var10.added) do
		if isRequiredInputField(v) then
			table.insert(t, {
				type = var1.REQUIRED_INPUT_FIELD_ADDED,
				description = ("A required field %s on input type %s was added."):format(v.name, p5.name)
			})
		else
			table.insert(t, {
				type = var2.OPTIONAL_INPUT_FIELD_ADDED,
				description = ("An optional field %s on input type %s was added."):format(v.name, p5.name)
			})
		end
	end
	for i, v_1 in ipairs(var10.removed) do
		table.insert(t, {
			type = var1.FIELD_REMOVED,
			description = ("%s.%s was removed."):format(p5.name, v_1.name)
		})
	end
	for i, v_2 in ipairs(var10.persisted) do
		local var11 = v_2[1]
		local var12 = v_2[2]
		
		if not isChangeSafeForInputObjectFieldOrFieldArg(var11.type, var12.type) then
			table.insert(t, {
				type = var1.FIELD_CHANGED_KIND,
				description = ("%s.%s changed type from %s to %s."):format(p5.name, var11.name, tostring(var11.type), tostring(var12.type))
			})
		end
	end
	return t
end

findUnionTypeChanges = function(p7, p8)
	-- upvalues: diff (write), var2 (ref), var1 (ref)
	local t = {}
	local var13 = diff(p7:getTypes(), p8:getTypes())
	
	for i, v in ipairs(var13.added) do
		table.insert(t, {
			type = var2.TYPE_ADDED_TO_UNION,
			description = ("%s was added to union type %s."):format(v.name, p7.name)
		})
	end
	for i, v_1 in ipairs(var13.removed) do
		table.insert(t, {
			type = var1.TYPE_REMOVED_FROM_UNION,
			description = ("%s was removed from union type %s."):format(v_1.name, p7.name)
		})
	end
	return t
end

findEnumTypeChanges = function(p9, p10)
	-- upvalues: diff (write), var2 (ref), var1 (ref)
	local t = {}
	local var14 = diff(p9:getValues(), p10:getValues())
	
	for i, v in ipairs(var14.added) do
		table.insert(t, {
			type = var2.VALUE_ADDED_TO_ENUM,
			description = ("%s was added to enum type %s."):format(v.name, p9.name)
		})
	end
	for i, v_1 in ipairs(var14.removed) do
		table.insert(t, {
			type = var1.VALUE_REMOVED_FROM_ENUM,
			description = ("%s was removed from enum type %s."):format(v_1.name, p9.name)
		})
	end
	return t
end

findImplementedInterfacesChanges = function(p11, p12)
	-- upvalues: diff (write), var2 (ref), var1 (ref)
	local t = {}
	local var15 = diff(p11:getInterfaces(), p12:getInterfaces())
	
	for i, v in ipairs(var15.added) do
		table.insert(t, {
			type = var2.IMPLEMENTED_INTERFACE_ADDED,
			description = ("%s added to interfaces implemented by %s."):format(v.name, p11.name)
		})
	end
	for i, v_1 in ipairs(var15.removed) do
		table.insert(t, {
			type = var1.IMPLEMENTED_INTERFACE_REMOVED,
			description = ("%s no longer implements interface %s."):format(p11.name, v_1.name)
		})
	end
	return t
end

findFieldChanges = function(p13, p14)
	-- upvalues: diff (write), var1 (ref), findArgChanges (write), isChangeSafeForObjectOrInterfaceField (write)
	local t = {}
	local var16 = diff(p13:getFields():values(), p14:getFields():values())
	
	for i, v in ipairs(var16.removed) do
		table.insert(t, {
			type = var1.FIELD_REMOVED,
			description = ("%s.%s was removed."):format(p13.name, v.name)
		})
	end
	for i, v_1 in ipairs(var16.persisted) do
		local var17 = v_1[1]
		local var18 = v_1[2]
		
		for i_2, v_2 in ipairs(findArgChanges(p13, var17, var18)) do
			table.insert(t, v_2)
		end
		if not isChangeSafeForObjectOrInterfaceField(var17.type, var18.type) then
			table.insert(t, {
				type = var1.FIELD_CHANGED_KIND,
				description = ("%s.%s changed type from "):format(p13.name, var17.name) .. ("%s to %s."):format(tostring(var17.type), tostring(var18.type))
			})
		end
	end
	return t
end

findArgChanges = function(p15, p16, p17)
	-- upvalues: diff (write), var1 (ref), isChangeSafeForInputObjectFieldOrFieldArg (write), var2 (ref), stringifyValue (write), isRequiredArgument (ref)
	local t = {}
	local var19 = diff(p16.args, p17.args)
	
	for i, v in ipairs(var19.removed) do
		table.insert(t, {
			type = var1.ARG_REMOVED,
			description = ("%s.%s arg %s was removed."):format(p15.name, p16.name, v.name)
		})
	end
	for i, v_1 in ipairs(var19.persisted) do
		local var20 = v_1[1]
		local var21 = v_1[2]
		
		if not isChangeSafeForInputObjectFieldOrFieldArg(var20.type, var21.type) then
			table.insert(t, {
				type = var1.ARG_CHANGED_KIND,
				description = ("%s.%s arg %s has changed type from "):format(p15.name, p16.name, var20.name) .. ("%s to %s."):format(tostring(var20.type), tostring(var21.type))
			})
		elseif var20.defaultValue ~= nil then
			if var21.defaultValue == nil then
				table.insert(t, {
					type = var2.ARG_DEFAULT_VALUE_CHANGE,
					description = ("%s.%s arg %s defaultValue was removed."):format(p15.name, p16.name, var20.name)
				})
			else
				local var22 = stringifyValue(var20.defaultValue, var20.type)
				local var23 = stringifyValue(var21.defaultValue, var21.type)
				
				if var22 ~= var23 then
					table.insert(t, {
						type = var2.ARG_DEFAULT_VALUE_CHANGE,
						description = ("%s.%s arg %s has changed defaultValue from %s to %s."):format(p15.name, p16.name, var20.name, var22, var23)
					})
				end
			end
		end
	end
	for i, v_2 in ipairs(var19.added) do
		if isRequiredArgument(v_2) then
			table.insert(t, {
				type = var1.REQUIRED_ARG_ADDED,
				description = ("A required arg %s on %s.%s was added."):format(v_2.name, p15.name, p16.name)
			})
		else
			table.insert(t, {
				type = var2.OPTIONAL_ARG_ADDED,
				description = ("An optional arg %s on %s.%s was added."):format(v_2.name, p15.name, p16.name)
			})
		end
	end
	return t
end

isChangeSafeForObjectOrInterfaceField = function(p18, p19)
	-- upvalues: isListType (ref), isChangeSafeForObjectOrInterfaceField (write), isNonNullType (ref), isNamedType (ref)
	return if isListType(p18) then isListType(p19) and isChangeSafeForObjectOrInterfaceField(p18.ofType, p19.ofType) or isNonNullType(p19) and isChangeSafeForObjectOrInterfaceField(p18, p19.ofType) elseif isNonNullType(p18) then isNonNullType(p19) and isChangeSafeForObjectOrInterfaceField(p18.ofType, p19.ofType) elseif isNamedType(p19) then true else isNonNullType(p19) and isChangeSafeForObjectOrInterfaceField(p18, p19.ofType)
end

isChangeSafeForInputObjectFieldOrFieldArg = function(p18, p19)
	-- upvalues: isListType (ref), isChangeSafeForInputObjectFieldOrFieldArg (write), isNonNullType (ref), isNamedType (ref)
	return if isListType(p18) then isListType(p19) and isChangeSafeForInputObjectFieldOrFieldArg(p18.ofType, p19.ofType) elseif isNonNullType(p18) then isNonNullType(p19) and isChangeSafeForInputObjectFieldOrFieldArg(p18.ofType, p19.ofType) or not isNonNullType(p19) and isChangeSafeForInputObjectFieldOrFieldArg(p18.ofType, p19) else isNamedType(p19) and p18.name == p19.name
end

typeKindName = function(p18)
	-- upvalues: isScalarType (ref), isObjectType (ref), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), isInputObjectType (ref), invariant (ref), inspect (ref)
	if isScalarType(p18) then
		return "a Scalar type"
	elseif isObjectType(p18) then
		return "an Object type"
	elseif isInterfaceType(p18) then
		return "an Interface type"
	elseif isUnionType(p18) then
		return "a Union type"
	elseif isEnumType(p18) then
		return "an Enum type"
	elseif isInputObjectType(p18) then
		return "an Input type"
	end
	invariant(false, "Unexpected type: " .. inspect(p18))
	
	return ""
end

stringifyValue = function(p18, p19)
	-- upvalues: astFromValue (ref), invariant (ref), visit (ref), array (ref), naturalCompare (ref), object (ref), print (ref)
	local var24 = astFromValue(p18, p19)
	invariant(var24 ~= nil)
	
	return print(visit(var24, {
		ObjectValue = function(_, p20)
			-- upvalues: array (copy), naturalCompare (copy), object (copy)
			local var25 = array.concat({}, p20.fields)
			array.sort(var25, function(p21, p22)
				-- upvalues: naturalCompare (copy)
				return naturalCompare(p21.name.value, p22.name.value)
			end)
			
			return object.assign({}, p20, { fields = var25 })
		end
	}))
end

diff = function(p18, p19)
	-- upvalues: keyMapOrdered (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var24 = keyMapOrdered(p18, function(p20)
		return p20.name
	end)
	local var25 = keyMapOrdered(p19, function(p20)
		return p20.name
	end)
	
	for i, v in ipairs(p18) do
		local name = var25:get(v.name)
		
		if name == nil then
			table.insert(t_1, v)
		else
			table.insert(t_2, { v, name })
		end
	end
	for i, v_1 in ipairs(p19) do
		if var24:get(v_1.name) == nil then
			table.insert(t, v_1)
		end
	end
	return { added = t, persisted = t_2, removed = t_1 }
end

return {
	BreakingChangeType = var1,
	DangerousChangeType = var2,
	findBreakingChanges = findBreakingChanges,
	findDangerousChanges = findDangerousChanges
}