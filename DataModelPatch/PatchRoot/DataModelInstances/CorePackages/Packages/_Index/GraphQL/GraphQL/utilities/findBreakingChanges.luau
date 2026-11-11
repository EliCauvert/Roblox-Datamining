local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local KeyMapOrderedFunction = require(Parent.luaUtils.keyMapOrdered).keyMapOrdered
local Jsutils = Parent.jsutils
local InspectFunction = require(Jsutils.inspect).inspect
local InvariantFunction = require(Jsutils.invariant).invariant
local NaturalCompareFunction = require(Jsutils.naturalCompare).naturalCompare
local Language = Parent.language
local PrintFunction = require(Language.printer).print
local VisitFunction = require(Language.visitor).visit
local _ = require(Language.ast)
local Type = Parent.type
local _ = require(Type.schema)
local DefinitionModule = require(Type.definition)
local IsSpecifiedScalarTypeFunction = require(Type.scalars).isSpecifiedScalarType
local IsScalarTypeFunction = DefinitionModule.isScalarType
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsUnionTypeFunction = DefinitionModule.isUnionType
local IsEnumTypeFunction = DefinitionModule.isEnumType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local IsListTypeFunction = DefinitionModule.isListType
local IsNamedTypeFunction = DefinitionModule.isNamedType
local IsRequiredArgumentFunction = DefinitionModule.isRequiredArgument
local IsRequiredInputFieldFunction = DefinitionModule.isRequiredInputField
local AstFromValueFunction = require(script.Parent.astFromValue).astFromValue
local Callback = nil
local Callback1 = nil
local Callback2 = nil
local Callback3 = nil
local Callback4 = nil
local Callback5 = nil
local Callback6 = nil
local Callback7 = nil
local Callback8 = nil
local Callback9 = nil
local Callback10 = nil
local Callback11 = nil
local Callback12 = nil
local Callback13 = nil
local FreezeResult = Object.freeze({
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
local FreezeResult1 = Object.freeze({
	VALUE_ADDED_TO_ENUM = "VALUE_ADDED_TO_ENUM",
	TYPE_ADDED_TO_UNION = "TYPE_ADDED_TO_UNION",
	OPTIONAL_INPUT_FIELD_ADDED = "OPTIONAL_INPUT_FIELD_ADDED",
	OPTIONAL_ARG_ADDED = "OPTIONAL_ARG_ADDED",
	IMPLEMENTED_INTERFACE_ADDED = "IMPLEMENTED_INTERFACE_ADDED",
	ARG_DEFAULT_VALUE_CHANGE = "ARG_DEFAULT_VALUE_CHANGE"
})

local function findBreakingChanges(p1, p2)
	-- upvalues: Array (copy), Callback (ref), FreezeResult (copy)
	return (Array.filter(Callback(p1, p2), function(p3): boolean
		-- upvalues: FreezeResult (upval)
		return FreezeResult[p3.type] ~= nil
	end))
end

local function findDangerousChanges(p1, p2)
	-- upvalues: Array (copy), Callback (ref), FreezeResult1 (copy)
	return (Array.filter(Callback(p1, p2), function(p3): boolean
		-- upvalues: FreezeResult1 (upval)
		return FreezeResult1[p3.type] ~= nil
	end))
end

Callback = function(p1, p2)
	-- upvalues: Array (copy), Callback1 (ref), Callback2 (ref)
	return Array.concat(Callback1(p1, p2), Callback2(p1, p2))
end

Callback2 = function(p1, p2)
	-- upvalues: Callback3 (ref), FreezeResult (copy), IsRequiredArgumentFunction (copy)
	local List = {}
	local CallbackResult = Callback3(p1:getDirectives(), p2:getDirectives())
	
	for _, value in ipairs(CallbackResult.removed) do
		table.insert(List, {
			type = FreezeResult.DIRECTIVE_REMOVED,
			description = ("%s was removed."):format(value.name)
		})
	end
	for _, value1 in ipairs(CallbackResult.persisted) do
		local v1 = value1[1]
		local v2 = value1[2]
		local CallbackResult1 = Callback3(v1.args, v2.args)
		
		for _, value2 in ipairs(CallbackResult1.added) do
			if IsRequiredArgumentFunction(value2) then
				table.insert(List, {
					type = FreezeResult.REQUIRED_DIRECTIVE_ARG_ADDED,
					description = ("A required arg %s on directive %s was added."):format(value2.name, v1.name)
				})
			end
		end
		for _, value3 in ipairs(CallbackResult1.removed) do
			table.insert(List, {
				type = FreezeResult.DIRECTIVE_ARG_REMOVED,
				description = ("%s was removed from %s."):format(value3.name, v1.name)
			})
		end
		if v1.isRepeatable and not v2.isRepeatable then
			table.insert(List, {
				type = FreezeResult.DIRECTIVE_REPEATABLE_REMOVED,
				description = ("Repeatable flag was removed from %s."):format(v1.name)
			})
		end
		for _, location in ipairs(v1.locations) do
			if table.find(v2.locations, location) == nil then
				table.insert(List, {
					type = FreezeResult.DIRECTIVE_LOCATION_REMOVED,
					description = ("%s was removed from %s."):format(location, v1.name)
				})
			end
		end
	end
	return List
end

Callback1 = function(p3, p4)
	-- upvalues: Callback3 (ref), FreezeResult (copy), IsSpecifiedScalarTypeFunction (copy), IsEnumTypeFunction (copy), Callback4 (ref), IsUnionTypeFunction (copy), Callback5 (ref), IsInputObjectTypeFunction (copy), Callback6 (ref), IsObjectTypeFunction (copy), Array (copy), Callback7 (ref), Callback8 (ref), IsInterfaceTypeFunction (copy), Callback9 (ref)
	local List = {}
	local CallbackResult = Callback3(p3:getTypeMap():values(), p4:getTypeMap():values())
	
	for _, value in ipairs(CallbackResult.removed) do
		table.insert(List, {
			type = FreezeResult.TYPE_REMOVED,
			description = IsSpecifiedScalarTypeFunction(value) and ("Standard scalar %s was removed because it is not referenced anymore."):format(value.name) or ("%s was removed."):format(value.name)
		})
	end
	for _, value1 in ipairs(CallbackResult.persisted) do
		local v3 = value1[1]
		local v4 = value1[2]
		
		if IsEnumTypeFunction(v3) and IsEnumTypeFunction(v4) then
			for _, value2 in ipairs(Callback4(v3, v4)) do
				table.insert(List, value2)
			end
		elseif IsUnionTypeFunction(v3) and IsUnionTypeFunction(v4) then
			for _, value3 in ipairs(Callback5(v3, v4)) do
				table.insert(List, value3)
			end
		else
			if IsInputObjectTypeFunction(v3) and IsInputObjectTypeFunction(v4) then
				for _, value4 in ipairs(Callback6(v3, v4)) do
					table.insert(List, value4)
				end
			elseif IsObjectTypeFunction(v3) and IsObjectTypeFunction(v4) then
				for _, value5 in ipairs(Array.concat(Callback7(v3, v4), Callback8(v3, v4))) do
					table.insert(List, value5)
				end
			elseif IsInterfaceTypeFunction(v3) and IsInterfaceTypeFunction(v4) then
				for _, value6 in ipairs(Array.concat(Callback7(v3, v4), Callback8(v3, v4))) do
					table.insert(List, value6)
				end
			elseif v3.new ~= v4.new then
				table.insert(List, {
					type = FreezeResult.TYPE_CHANGED_KIND,
					description = ("%s changed from %s to %s."):format(v3.name, Callback9(v3), Callback9(v4))
				})
			end
		end
	end
	return List
end

Callback6 = function(p5, p6)
	-- upvalues: Callback3 (ref), IsRequiredInputFieldFunction (copy), FreezeResult (copy), FreezeResult1 (copy), Callback10 (ref)
	local List = {}
	local CallbackResult = Callback3(p5:getFields():values(), p6:getFields():values())
	
	for _, value in ipairs(CallbackResult.added) do
		if IsRequiredInputFieldFunction(value) then
			table.insert(List, {
				type = FreezeResult.REQUIRED_INPUT_FIELD_ADDED,
				description = ("A required field %s on input type %s was added."):format(value.name, p5.name)
			})
		else
			table.insert(List, {
				type = FreezeResult1.OPTIONAL_INPUT_FIELD_ADDED,
				description = ("An optional field %s on input type %s was added."):format(value.name, p5.name)
			})
		end
	end
	for _, value1 in ipairs(CallbackResult.removed) do
		table.insert(List, {
			type = FreezeResult.FIELD_REMOVED,
			description = ("%s.%s was removed."):format(p5.name, value1.name)
		})
	end
	for _, value2 in ipairs(CallbackResult.persisted) do
		local v5 = value2[1]
		local v6 = value2[2]
		
		if not Callback10(v5.type, v6.type) then
			table.insert(List, {
				type = FreezeResult.FIELD_CHANGED_KIND,
				description = ("%s.%s changed type from %s to %s."):format(p5.name, v5.name, tostring(v5.type), (tostring(v6.type)))
			})
		end
	end
	return List
end

Callback5 = function(p7, p8)
	-- upvalues: Callback3 (ref), FreezeResult1 (copy), FreezeResult (copy)
	local List = {}
	local CallbackResult = Callback3(p7:getTypes(), p8:getTypes())
	
	for _, value in ipairs(CallbackResult.added) do
		table.insert(List, {
			type = FreezeResult1.TYPE_ADDED_TO_UNION,
			description = ("%s was added to union type %s."):format(value.name, p7.name)
		})
	end
	for _, value1 in ipairs(CallbackResult.removed) do
		table.insert(List, {
			type = FreezeResult.TYPE_REMOVED_FROM_UNION,
			description = ("%s was removed from union type %s."):format(value1.name, p7.name)
		})
	end
	return List
end

Callback4 = function(p9, p10)
	-- upvalues: Callback3 (ref), FreezeResult1 (copy), FreezeResult (copy)
	local List = {}
	local CallbackResult = Callback3(p9:getValues(), p10:getValues())
	
	for _, value in ipairs(CallbackResult.added) do
		table.insert(List, {
			type = FreezeResult1.VALUE_ADDED_TO_ENUM,
			description = ("%s was added to enum type %s."):format(value.name, p9.name)
		})
	end
	for _, value1 in ipairs(CallbackResult.removed) do
		table.insert(List, {
			type = FreezeResult.VALUE_REMOVED_FROM_ENUM,
			description = ("%s was removed from enum type %s."):format(value1.name, p9.name)
		})
	end
	return List
end

Callback8 = function(p11, p12)
	-- upvalues: Callback3 (ref), FreezeResult1 (copy), FreezeResult (copy)
	local List = {}
	local CallbackResult = Callback3(p11:getInterfaces(), p12:getInterfaces())
	
	for _, value in ipairs(CallbackResult.added) do
		table.insert(List, {
			type = FreezeResult1.IMPLEMENTED_INTERFACE_ADDED,
			description = ("%s added to interfaces implemented by %s."):format(value.name, p11.name)
		})
	end
	for _, value1 in ipairs(CallbackResult.removed) do
		table.insert(List, {
			type = FreezeResult.IMPLEMENTED_INTERFACE_REMOVED,
			description = ("%s no longer implements interface %s."):format(p11.name, value1.name)
		})
	end
	return List
end

Callback7 = function(p13, p14)
	-- upvalues: Callback3 (ref), FreezeResult (copy), Callback11 (ref), Callback12 (ref)
	local List = {}
	local CallbackResult = Callback3(p13:getFields():values(), p14:getFields():values())
	
	for _, value in ipairs(CallbackResult.removed) do
		table.insert(List, {
			type = FreezeResult.FIELD_REMOVED,
			description = ("%s.%s was removed."):format(p13.name, value.name)
		})
	end
	for _, value1 in ipairs(CallbackResult.persisted) do
		local v7 = value1[1]
		local v8 = value1[2]
		
		for _, value2 in ipairs(Callback11(p13, v7, v8)) do
			table.insert(List, value2)
		end
		if not Callback12(v7.type, v8.type) then
			table.insert(List, {
				type = FreezeResult.FIELD_CHANGED_KIND,
				description = ("%s.%s changed type from "):format(p13.name, v7.name) .. ("%s to %s."):format(tostring(v7.type), (tostring(v8.type)))
			})
		end
	end
	return List
end

Callback11 = function(p15, p16, p17)
	-- upvalues: Callback3 (ref), FreezeResult (copy), Callback10 (ref), FreezeResult1 (copy), Callback13 (ref), IsRequiredArgumentFunction (copy)
	local List = {}
	local CallbackResult = Callback3(p16.args, p17.args)
	
	for _, value in ipairs(CallbackResult.removed) do
		table.insert(List, {
			type = FreezeResult.ARG_REMOVED,
			description = ("%s.%s arg %s was removed."):format(p15.name, p16.name, value.name)
		})
	end
	for _, value1 in ipairs(CallbackResult.persisted) do
		local v9 = value1[1]
		local v10 = value1[2]
		
		if not Callback10(v9.type, v10.type) then
			table.insert(List, {
				type = FreezeResult.ARG_CHANGED_KIND,
				description = ("%s.%s arg %s has changed type from "):format(p15.name, p16.name, v9.name) .. ("%s to %s."):format(tostring(v9.type), (tostring(v10.type)))
			})
		elseif v9.defaultValue ~= nil then
			if v10.defaultValue == nil then
				table.insert(List, {
					type = FreezeResult1.ARG_DEFAULT_VALUE_CHANGE,
					description = ("%s.%s arg %s defaultValue was removed."):format(p15.name, p16.name, v9.name)
				})
			else
				local CallbackResult1 = Callback13(v9.defaultValue, v9.type)
				local CallbackResult2 = Callback13(v10.defaultValue, v10.type)
				
				if CallbackResult1 ~= CallbackResult2 then
					table.insert(List, {
						type = FreezeResult1.ARG_DEFAULT_VALUE_CHANGE,
						description = ("%s.%s arg %s has changed defaultValue from %s to %s."):format(p15.name, p16.name, v9.name, CallbackResult1, CallbackResult2)
					})
				end
			end
		end
	end
	for _, value2 in ipairs(CallbackResult.added) do
		if IsRequiredArgumentFunction(value2) then
			table.insert(List, {
				type = FreezeResult.REQUIRED_ARG_ADDED,
				description = ("A required arg %s on %s.%s was added."):format(value2.name, p15.name, p16.name)
			})
		else
			table.insert(List, {
				type = FreezeResult1.OPTIONAL_ARG_ADDED,
				description = ("An optional arg %s on %s.%s was added."):format(value2.name, p15.name, p16.name)
			})
		end
	end
	return List
end

Callback12 = function(OfType, OfType1)
	-- upvalues: IsListTypeFunction (copy), Callback12 (ref), IsNonNullTypeFunction (copy), IsNamedTypeFunction (copy)
	return if IsListTypeFunction(OfType) then IsListTypeFunction(OfType1) and Callback12(OfType.ofType, OfType1.ofType) or IsNonNullTypeFunction(OfType1) and Callback12(OfType, OfType1.ofType) elseif IsNonNullTypeFunction(OfType) then IsNonNullTypeFunction(OfType1) and Callback12(OfType.ofType, OfType1.ofType) else IsNamedTypeFunction(OfType1) and OfType.name == OfType1.name or IsNonNullTypeFunction(OfType1) and Callback12(OfType, OfType1.ofType)
end

Callback10 = function(OfType, OfType1)
	-- upvalues: IsListTypeFunction (copy), Callback10 (ref), IsNonNullTypeFunction (copy), IsNamedTypeFunction (copy)
	return if IsListTypeFunction(OfType) then IsListTypeFunction(OfType1) and Callback10(OfType.ofType, OfType1.ofType) elseif IsNonNullTypeFunction(OfType) then IsNonNullTypeFunction(OfType1) and Callback10(OfType.ofType, OfType1.ofType) or not IsNonNullTypeFunction(OfType1) and Callback10(OfType.ofType, OfType1) else IsNamedTypeFunction(OfType1) and OfType.name == OfType1.name
end

Callback9 = function(p18): string
	-- upvalues: IsScalarTypeFunction (copy), IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), IsUnionTypeFunction (copy), IsEnumTypeFunction (copy), IsInputObjectTypeFunction (copy), InvariantFunction (copy), InspectFunction (copy)
	if IsScalarTypeFunction(p18) then
		return "a Scalar type"
	elseif IsObjectTypeFunction(p18) then
		return "an Object type"
	elseif IsInterfaceTypeFunction(p18) then
		return "an Interface type"
	elseif IsUnionTypeFunction(p18) then
		return "a Union type"
	elseif IsEnumTypeFunction(p18) then
		return "an Enum type"
	elseif IsInputObjectTypeFunction(p18) then
		return "an Input type"
	else
		InvariantFunction(false, "Unexpected type: " .. InspectFunction(p18))
		
		return ""
	end
end

Callback13 = function(DefaultValue, Type)
	-- upvalues: AstFromValueFunction (copy), InvariantFunction (copy), VisitFunction (copy), Array (copy), NaturalCompareFunction (copy), Object (copy), PrintFunction (copy)
	local AstFromValueResult = AstFromValueFunction(DefaultValue, Type)
	InvariantFunction(AstFromValueResult ~= nil)
	
	return PrintFunction((VisitFunction(AstFromValueResult, {
		ObjectValue = function(_, p18)
			-- upvalues: Array (upval), NaturalCompareFunction (upval), Object (upval)
			local ConcatResult = Array.concat({}, p18.fields)
			Array.sort(ConcatResult, function(p19, p20)
				-- upvalues: NaturalCompareFunction (upval)
				return NaturalCompareFunction(p19.name.value, p20.name.value)
			end)
			
			return Object.assign({}, p18, { fields = ConcatResult })
		end
	})))
end

Callback3 = function(ValuesResult, ValuesResult1)
	-- upvalues: KeyMapOrderedFunction (copy)
	local Added = {}
	local Removed = {}
	local Persisted = {}
	local KeyMapOrderedResult = KeyMapOrderedFunction(ValuesResult, function(p18)
		return p18.name
	end)
	local KeyMapOrderedResult1 = KeyMapOrderedFunction(ValuesResult1, function(p18)
		return p18.name
	end)
	
	for _, value in ipairs(ValuesResult) do
		local GetResult = KeyMapOrderedResult1:get(value.name)
		
		if GetResult == nil then
			table.insert(Removed, value)
		else
			table.insert(Persisted, { value, GetResult })
		end
	end
	for _, value1 in ipairs(ValuesResult1) do
		if KeyMapOrderedResult:get(value1.name) == nil then
			table.insert(Added, value1)
		end
	end
	return { added = Added, persisted = Persisted, removed = Removed }
end

return {
	BreakingChangeType = FreezeResult,
	DangerousChangeType = FreezeResult1,
	findBreakingChanges = findBreakingChanges,
	findDangerousChanges = findDangerousChanges
}