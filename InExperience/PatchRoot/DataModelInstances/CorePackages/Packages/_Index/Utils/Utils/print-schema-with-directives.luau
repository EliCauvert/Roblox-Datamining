local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local Module = {}
local GraphQLModule = require(Parent.GraphQL)
local PrintFunction = GraphQLModule.print
local Kind = GraphQLModule.Kind
local IsSpecifiedScalarTypeFunction = GraphQLModule.isSpecifiedScalarType
local IsIntrospectionTypeFunction = GraphQLModule.isIntrospectionType
local IsSpecifiedDirectiveFunction = GraphQLModule.isSpecifiedDirective
local AstFromValueFunction = GraphQLModule.astFromValue
local GraphQLDeprecatedDirective = GraphQLModule.GraphQLDeprecatedDirective
local IsObjectTypeFunction = GraphQLModule.isObjectType
local IsInterfaceTypeFunction = GraphQLModule.isInterfaceType
local IsUnionTypeFunction = GraphQLModule.isUnionType
local IsInputObjectTypeFunction = GraphQLModule.isInputObjectType
local IsEnumTypeFunction = GraphQLModule.isEnumType
local IsScalarTypeFunction = GraphQLModule.isScalarType
local _ = require(script.Parent.types)
local AstFromTypeFunction = require(script.Parent.astFromType).astFromType
local GetDirectivesInExtensionsFunction = require(script.Parent["get-directives"]).getDirectivesInExtensions
local AstFromValueUntypedFunction = require(script.Parent.astFromValueUntyped).astFromValueUntyped
local IsSome = require(script.Parent.helpers).isSome
local GetRootTypeMapFunction = require(script.Parent.rootTypes).getRootTypeMap
local Callback = nil
local Callback2 = nil
local Callback15 = nil
local Callback3 = nil
local Callback4 = nil
local Callback10 = nil
local Callback14 = nil
local Callback11 = nil
local Callback5 = nil
local Callback6 = nil
local Callback8 = nil
local Callback7 = nil
local Callback9 = nil
local Callback1 = nil
local Callback12 = nil
local Callback13 = nil
local NULL = GraphQLModule.NULL

local function getDocumentNodeFromSchema(p1, p2) --[[ Line: 160 ]]
	-- upvalues: Callback (ref), Boolean (copy), IsSpecifiedDirectiveFunction (copy), Callback2 (ref), IsSpecifiedScalarTypeFunction (copy), IsIntrospectionTypeFunction (copy), IsObjectTypeFunction (copy), Callback4 (ref), IsInterfaceTypeFunction (copy), Callback5 (ref), IsUnionTypeFunction (copy), Callback6 (ref), IsInputObjectTypeFunction (copy), Callback8 (ref), IsEnumTypeFunction (copy), Callback7 (ref), IsScalarTypeFunction (copy), Callback9 (ref), Error1 (copy), Kind (copy)
	local PathToDirectivesInExtensions = (if p2 == nil then {} else p2).pathToDirectivesInExtensions
	local TypeMap = p1:getTypeMap()
	local CallbackResult = Callback(p1, PathToDirectivesInExtensions)
	local T = if CallbackResult == nil then {} else { CallbackResult }
	for _, directive in p1:getDirectives() do
		if not Boolean.toJSBoolean(IsSpecifiedDirectiveFunction(directive)) then
			table.insert(T, Callback2(directive, p1, PathToDirectivesInExtensions))
		end
	end
	for _, value in TypeMap do
		local GetResult = TypeMap:get(value[1])
		local IsSpecifiedScalarType = IsSpecifiedScalarTypeFunction(GetResult)
		local IsIntrospectionType = IsIntrospectionTypeFunction(GetResult)
		
		if not IsSpecifiedScalarType and not IsIntrospectionType then
			if Boolean.toJSBoolean(IsObjectTypeFunction(GetResult)) then
				table.insert(T, Callback4(GetResult, p1, PathToDirectivesInExtensions))
			elseif Boolean.toJSBoolean(IsInterfaceTypeFunction(GetResult)) then
				table.insert(T, Callback5(GetResult, p1, PathToDirectivesInExtensions))
			elseif Boolean.toJSBoolean(IsUnionTypeFunction(GetResult)) then
				table.insert(T, Callback6(GetResult, p1, PathToDirectivesInExtensions))
			elseif Boolean.toJSBoolean(IsInputObjectTypeFunction(GetResult)) then
				table.insert(T, Callback8(GetResult, p1, PathToDirectivesInExtensions))
			elseif Boolean.toJSBoolean(IsEnumTypeFunction(GetResult)) then
				table.insert(T, Callback7(GetResult, p1, PathToDirectivesInExtensions))
			elseif Boolean.toJSBoolean(IsScalarTypeFunction(GetResult)) then
				table.insert(T, Callback9(GetResult, p1, PathToDirectivesInExtensions))
			else
				error(Error1.new(("Unknown type %s."):format((tostring(GetResult)))))
			end
		end
	end
	return { kind = Kind.DOCUMENT, definitions = T }
end

Module.getDocumentNodeFromSchema = getDocumentNodeFromSchema

function Module.printSchemaWithDirectives(p3, p4) --[[ Line: 244 ]]
	-- upvalues: getDocumentNodeFromSchema (copy), PrintFunction (copy)
	return PrintFunction((getDocumentNodeFromSchema(p3, if p4 == nil then {} else p4)))
end

Callback = function(p3, PathToDirectivesInExtensions) --[[ Line: 252 | Named "astFromSchema" ]]
	-- upvalues: Map (copy), Object (copy), Boolean (copy), GetRootTypeMapFunction (copy), AstFromTypeFunction (copy), Kind (copy), Array (copy), IsSome (copy), Callback3 (ref)
	local NewMap = Map.new({
		{ "query", Object.None },
		{ "mutation", Object.None },
		{ "subscription", Object.None }
	})
	local List = {}
	
	if p3.astNode ~= nil then
		table.insert(List, p3.astNode)
	end
	if p3.extensionASTNodes ~= nil then
		for _, extensionASTNode in p3.extensionASTNodes do
			table.insert(List, extensionASTNode)
		end
	end
	for _, value in List do
		if Boolean.toJSBoolean(value.operationTypes) then
			for _, operationType in value.operationTypes do
				NewMap:set(operationType.operation, operationType)
			end
		end
	end
	local RootTypeMap = GetRootTypeMapFunction(p3)
	
	for _, value1 in NewMap do
		local Unpacked, Unpacked2 = table.unpack(value1, 1, 2)
		local GetResult = RootTypeMap:get(Unpacked)
		
		if GetResult ~= nil then
			local AstFromTypeResult = AstFromTypeFunction(GetResult)
			
			if Unpacked2 == nil or Unpacked2 == Object.None then
				NewMap:set(Unpacked, {
					kind = Kind.OPERATION_TYPE_DEFINITION,
					operation = Unpacked,
					type = AstFromTypeResult
				})
			else
				Unpacked2.type = AstFromTypeResult
			end
		end
	end
	local FilterResult = Array.filter(Array.concat({}, NewMap:values()), IsSome)
	local CallbackResult = Callback3(p3, p3, PathToDirectivesInExtensions)
	
	if Boolean.toJSBoolean(#FilterResult) or Boolean.toJSBoolean(#CallbackResult) then
		local ToJSBooleanFunction = Boolean.toJSBoolean
		local Description = if typeof(p3.astNode) == "table" then p3.astNode.description else nil
		local HasDescription = if Description == nil then p3.description ~= nil else Description
		
		return {
			kind = if FilterResult == nil then Kind.SCHEMA_EXTENSION else Kind.SCHEMA_DEFINITION,
			operationTypes = FilterResult,
			directives = CallbackResult,
			description = if ToJSBooleanFunction(HasDescription) then { block = true, kind = Kind.STRING, value = p3.description } else nil
		}
	else
		return nil
	end
end

Module.astFromSchema = Callback

Callback2 = function(p4, p5, PathToDirectivesInExtensions) --[[ Line: 355 | Named "astFromDirective" ]]
	-- upvalues: Kind (copy), Boolean (copy), Array (copy), Callback1 (ref)
	local Description = if typeof(p4.astNode) == "table" then p4.astNode.description else nil
	local MapResult = if typeof(p4.locations) == "table" then Array.map(p4.locations, function(Value) --[[ Line: 390 ]]
		-- upvalues: Kind (upval)
		return { kind = Kind.NAME, value = Value }
	end) else nil
	
	return {
		kind = Kind.DIRECTIVE_DEFINITION,
		description = if Description == nil then if Boolean.toJSBoolean(p4.description) then { kind = Kind.STRING, value = p4.description } else nil else Description,
		name = { kind = Kind.NAME, value = p4.name },
		arguments = if typeof(p4.args) == "table" then Array.map(p4.args, function(p6) --[[ Line: 379 ]]
			-- upvalues: Callback1 (upval), p5 (copy), PathToDirectivesInExtensions (copy)
			return Callback1(p6, p5, PathToDirectivesInExtensions)
		end) else nil,
		repeatable = p4.isRepeatable,
		locations = Boolean.toJSBoolean(MapResult) and MapResult or {}
	}
end

Module.astFromDirective = Callback2

Callback3 = function(p4, p5, p6) --[[ Line: 418 | Named "getDirectiveNodes" ]]
	-- upvalues: GetDirectivesInExtensionsFunction (copy), Array (copy), Object (copy), Callback10 (ref), Boolean (copy)
	local DirectivesInExtensions = GetDirectivesInExtensionsFunction(p4, p6)
	local ConcatResult = {}
	
	if p4.astNode ~= nil then
		table.insert(ConcatResult, p4.astNode)
	end
	if Array.indexOf(Object.keys(p4), "extensionASTNodes") ~= -1 and p4.extensionASTNodes ~= nil then
		ConcatResult = Array.concat(ConcatResult, p4.extensionASTNodes)
	end
	if DirectivesInExtensions ~= nil then
		return (Callback10(p5, DirectivesInExtensions))
	end
	local ConcatResult1 = {}
	
	for _, value in ConcatResult do
		if Boolean.toJSBoolean(value.directives) then
			ConcatResult1 = Array.concat(ConcatResult1, value.directives)
		end
	end
	return ConcatResult1
end

Module.getDirectiveNodes = Callback3

local function getDeprecatableDirectiveNodes(p7, p8, p9) --[[ Line: 471 ]]
	-- upvalues: GetDirectivesInExtensionsFunction (copy), Callback10 (ref), Array (copy), Callback11 (ref)
	local FilterResult = {}
	local FilterResultEntry = nil
	local DirectivesInExtensions = GetDirectivesInExtensionsFunction(p7, p9)
	local Directives = if DirectivesInExtensions == nil then if typeof(p7.astNode) == "table" then p7.astNode.directives else nil else Callback10(p8, DirectivesInExtensions)
	
	if Directives ~= nil then
		FilterResult = Array.filter(Directives, function(p10): boolean --[[ Line: 493 ]]
			return p10.name.value ~= "deprecated"
		end)
		
		if p7.deprecationReason ~= nil then
			FilterResultEntry = if typeof(Array.filter(Directives, function(p10): boolean --[[ Line: 500 ]]
				return p10.name.value == "deprecated"
			end)) == "table" then Array.filter(Directives, function(p10): boolean --[[ Line: 504 ]]
				return p10.name.value == "deprecated"
			end)[1] else nil
		end
	end
	if p7.deprecationReason ~= nil and FilterResultEntry == nil then
		FilterResultEntry = Callback11(p7.deprecationReason)
	end
	return if FilterResultEntry == nil then FilterResult else Array.concat({ FilterResultEntry }, FilterResult)
end

Module.getDeprecatableDirectiveNodes = getDeprecatableDirectiveNodes

Callback1 = function(p7, p8, p9) --[[ Line: 528 | Named "astFromArg" ]]
	-- upvalues: Kind (copy), Boolean (copy), AstFromTypeFunction (copy), AstFromValueFunction (copy), getDeprecatableDirectiveNodes (copy)
	local Description = if typeof(p7.astNode) == "table" then p7.astNode.description else nil
	
	return {
		kind = Kind.INPUT_VALUE_DEFINITION,
		description = if Description == nil then if Boolean.toJSBoolean(p7.description) then {
			block = true,
			kind = Kind.STRING,
			value = p7.description
		} else nil else Description,
		name = { kind = Kind.NAME, value = p7.name },
		type = AstFromTypeFunction(p7.type),
		defaultValue = if p7.defaultValue == nil then nil else AstFromValueFunction(p7.defaultValue, p7.type),
		directives = getDeprecatableDirectiveNodes(p7, p8, p9)
	}
end

Module.astFromArg = Callback1

Callback4 = function(GetResult, p7, PathToDirectivesInExtensions) --[[ Line: 566 | Named "astFromObjectType" ]]
	-- upvalues: Kind (copy), Boolean (copy), Array (copy), Callback12 (ref), Object (copy), AstFromTypeFunction (copy), Callback3 (ref)
	local Description = if typeof(GetResult.astNode) == "table" then GetResult.astNode.description else nil
	
	return {
		kind = Kind.OBJECT_TYPE_DEFINITION,
		description = if Description == nil then if Boolean.toJSBoolean(GetResult.description) then {
			block = true,
			kind = Kind.STRING,
			value = GetResult.description
		} else nil else Description,
		name = { kind = Kind.NAME, value = GetResult.name },
		fields = Array.map(GetResult:getFields():values(), function(p8) --[[ Line: 592 ]]
			-- upvalues: Callback12 (upval), p7 (copy), PathToDirectivesInExtensions (copy)
			return Callback12(p8, p7, PathToDirectivesInExtensions)
		end),
		interfaces = Array.map(Object.values(GetResult:getInterfaces()), function(p8) --[[ Line: 596 ]]
			-- upvalues: AstFromTypeFunction (upval)
			return (AstFromTypeFunction(p8))
		end),
		directives = Callback3(GetResult, p7, PathToDirectivesInExtensions)
	}
end

Module.astFromObjectType = Callback4

Callback5 = function(GetResult, p7, PathToDirectivesInExtensions) --[[ Line: 605 | Named "astFromInterfaceType" ]]
	-- upvalues: Kind (copy), Boolean (copy), Array (copy), Callback12 (ref), Callback3 (ref), Object (copy), AstFromTypeFunction (copy)
	local Description = if typeof(GetResult.astNode) == "table" then GetResult.astNode.description else nil
	local config = {
		kind = Kind.INTERFACE_TYPE_DEFINITION,
		description = if Description == nil then if Boolean.toJSBoolean(GetResult.description) then {
			block = true,
			kind = Kind.STRING,
			value = GetResult.description
		} else nil else Description,
		name = { kind = Kind.NAME, value = GetResult.name },
		fields = Array.map(GetResult:getFields():values(), function(p8) --[[ Line: 631 ]]
			-- upvalues: Callback12 (upval), p7 (copy), PathToDirectivesInExtensions (copy)
			return Callback12(p8, p7, PathToDirectivesInExtensions)
		end),
		directives = Callback3(GetResult, p7, PathToDirectivesInExtensions)
	}
	
	if GetResult.getInterfaces ~= nil then
		config.interfaces = Array.map(Object.values(GetResult:getInterfaces()), function(p8) --[[ Line: 643 ]]
			-- upvalues: AstFromTypeFunction (upval)
			return (AstFromTypeFunction(p8))
		end)
	end
	return config
end

Module.astFromInterfaceType = Callback5

Callback6 = function(GetResult, p7, PathToDirectivesInExtensions) --[[ Line: 653 | Named "astFromUnionType" ]]
	-- upvalues: Kind (copy), Boolean (copy), Callback3 (ref), Array (copy), AstFromTypeFunction (copy)
	local Description = if typeof(GetResult.astNode) == "table" then GetResult.astNode.description else nil
	
	return {
		kind = Kind.UNION_TYPE_DEFINITION,
		description = if Description == nil then if Boolean.toJSBoolean(GetResult.description) then {
			block = true,
			kind = Kind.STRING,
			value = GetResult.description
		} else nil else Description,
		name = { kind = Kind.NAME, value = GetResult.name },
		directives = Callback3(GetResult, p7, PathToDirectivesInExtensions),
		types = Array.map(GetResult:getTypes(), function(p8) --[[ Line: 680 ]]
			-- upvalues: AstFromTypeFunction (upval)
			return (AstFromTypeFunction(p8))
		end)
	}
end

Module.astFromUnionType = Callback6

Callback8 = function(GetResult, p7, PathToDirectivesInExtensions) --[[ Line: 688 | Named "astFromInputObjectType" ]]
	-- upvalues: Kind (copy), Boolean (copy), Array (copy), Callback13 (ref), Callback3 (ref)
	local Description = if typeof(GetResult.astNode) == "table" then GetResult.astNode.description else nil
	
	return {
		kind = Kind.INPUT_OBJECT_TYPE_DEFINITION,
		description = if Description == nil then if Boolean.toJSBoolean(GetResult.description) then {
			block = true,
			kind = Kind.STRING,
			value = GetResult.description
		} else nil else Description,
		name = { kind = Kind.NAME, value = GetResult.name },
		fields = Array.map(GetResult:getFields():values(), function(p8) --[[ Line: 714 ]]
			-- upvalues: Callback13 (upval), p7 (copy), PathToDirectivesInExtensions (copy)
			return Callback13(p8, p7, PathToDirectivesInExtensions)
		end),
		directives = Callback3(GetResult, p7, PathToDirectivesInExtensions)
	}
end

Module.astFromInputObjectType = Callback8

Callback7 = function(GetResult, p7, PathToDirectivesInExtensions) --[[ Line: 725 | Named "astFromEnumType" ]]
	-- upvalues: Kind (copy), Boolean (copy), Array (copy), Object (copy), Callback14 (ref), Callback3 (ref)
	local Description = if typeof(GetResult.astNode) == "table" then GetResult.astNode.description else nil
	
	return {
		kind = Kind.ENUM_TYPE_DEFINITION,
		description = if Description == nil then if Boolean.toJSBoolean(GetResult.description) then {
			block = true,
			kind = Kind.STRING,
			value = GetResult.description
		} else nil else Description,
		name = { kind = Kind.NAME, value = GetResult.name },
		values = Array.map(Object.values(GetResult:getValues()), function(p8) --[[ Line: 749 ]]
			-- upvalues: Callback14 (upval), p7 (copy), PathToDirectivesInExtensions (copy)
			return Callback14(p8, p7, PathToDirectivesInExtensions)
		end),
		directives = Callback3(GetResult, p7, PathToDirectivesInExtensions)
	}
end

Module.astFromEnumType = Callback7

Callback9 = function(GetResult, p7, PathToDirectivesInExtensions) --[[ Line: 759 | Named "astFromScalarType" ]]
	-- upvalues: GetDirectivesInExtensionsFunction (copy), Boolean (copy), Callback10 (ref), Array (copy), Callback15 (ref), Kind (copy)
	local DirectivesInExtensions = GetDirectivesInExtensionsFunction(GetResult, PathToDirectivesInExtensions)
	local CallbackResult = if Boolean.toJSBoolean(DirectivesInExtensions) then Callback10(p7, DirectivesInExtensions) else (if typeof(GetResult.astNode) == "table" then GetResult.astNode.directives else nil) or {}
	local SpecifiedByUrl = Boolean.toJSBoolean(GetResult.specifiedByUrl) and GetResult.specifiedByUrl or GetResult.specifiedByURL
	
	if Boolean.toJSBoolean(if Boolean.toJSBoolean(SpecifiedByUrl) then not Boolean.toJSBoolean(Array.some(CallbackResult, function(p8): boolean --[[ Line: 787 ]]
		return p8.name.value == "specifiedBy"
	end)) else SpecifiedByUrl) then
		table.insert(CallbackResult, Callback15("specifiedBy", { url = SpecifiedByUrl }))
	end
	local Description = if typeof(GetResult.astNode) == "table" then GetResult.astNode.description else nil
	
	return {
		kind = Kind.SCALAR_TYPE_DEFINITION,
		description = if Description == nil then if Boolean.toJSBoolean(GetResult.description) then {
			block = true,
			kind = Kind.STRING,
			value = GetResult.description
		} else nil else Description,
		name = { kind = Kind.NAME, value = GetResult.name },
		directives = CallbackResult
	}
end

Module.astFromScalarType = Callback9

Callback12 = function(p7, p8, p9) --[[ Line: 817 | Named "astFromField" ]]
	-- upvalues: Kind (copy), Boolean (copy), Array (copy), Callback1 (ref), AstFromTypeFunction (copy), getDeprecatableDirectiveNodes (copy)
	local Description = if typeof(p7.astNode) == "table" then p7.astNode.description else nil
	
	return {
		kind = Kind.FIELD_DEFINITION,
		description = if Description == nil then if Boolean.toJSBoolean(p7.description) then {
			block = true,
			kind = Kind.STRING,
			value = p7.description
		} else nil else Description,
		name = { kind = Kind.NAME, value = p7.name },
		arguments = Array.map(p7.args, function(p10) --[[ Line: 838 ]]
			-- upvalues: Callback1 (upval), p8 (copy), p9 (copy)
			return Callback1(p10, p8, p9)
		end),
		type = AstFromTypeFunction(p7.type),
		directives = getDeprecatableDirectiveNodes(p7, p8, p9)
	}
end

Module.astFromField = Callback12

Callback13 = function(p7, p8, p9) --[[ Line: 849 | Named "astFromInputField" ]]
	-- upvalues: Kind (copy), Boolean (copy), AstFromTypeFunction (copy), getDeprecatableDirectiveNodes (copy), AstFromValueFunction (copy), NULL (copy)
	local INPUTVALUEDEFINITION = Kind.INPUT_VALUE_DEFINITION
	local Description = if typeof(p7.astNode) == "table" then p7.astNode.description else nil
	local Name = { kind = Kind.NAME, value = p7.name }
	local AstFromTypeResult = AstFromTypeFunction(p7.type)
	local DeprecatableDirectiveNodes = getDeprecatableDirectiveNodes(p7, p8, p9)
	local AstFromValueResult = AstFromValueFunction(p7.defaultValue, p7.type)
	
	return {
		kind = INPUTVALUEDEFINITION,
		description = if Description == nil then if Boolean.toJSBoolean(p7.description) then {
			block = true,
			kind = Kind.STRING,
			value = p7.description
		} else nil else Description,
		name = Name,
		type = AstFromTypeResult,
		directives = DeprecatableDirectiveNodes,
		defaultValue = if AstFromValueResult == nil or AstFromValueResult == NULL then nil else AstFromValueResult
	}
end

Module.astFromInputField = Callback13

Callback14 = function(p7, p8, p9) --[[ Line: 888 | Named "astFromEnumValue" ]]
	-- upvalues: Kind (copy), Boolean (copy), getDeprecatableDirectiveNodes (copy)
	local Description = if typeof(p7.astNode) == "table" then p7.astNode.description else nil
	
	return {
		kind = Kind.ENUM_VALUE_DEFINITION,
		description = if Description == nil then if Boolean.toJSBoolean(p7.description) then {
			block = true,
			kind = Kind.STRING,
			value = p7.description
		} else nil else Description,
		name = { kind = Kind.NAME, value = p7.name },
		directives = getDeprecatableDirectiveNodes(p7, p8, p9)
	}
end

Module.astFromEnumValue = Callback14

Callback11 = function(Reason) --[[ Line: 916 | Named "makeDeprecatedDirective" ]]
	-- upvalues: Callback15 (ref), GraphQLDeprecatedDirective (copy)
	return Callback15("deprecated", { reason = Reason }, GraphQLDeprecatedDirective)
end

Module.makeDeprecatedDirective = Callback11

Callback15 = function(Value, List, Directive) --[[ Line: 923 | Named "makeDirectiveNode" ]]
	-- upvalues: AstFromValueFunction (copy), Boolean (copy), Kind (copy), AstFromValueUntypedFunction (copy)
	local List1 = {}
	
	if Directive == nil then
		for Value1 in List do
			local AstFromValueUntypedResult = AstFromValueUntypedFunction(List[tostring(Value1)])
			
			if Boolean.toJSBoolean(AstFromValueUntypedResult) then
				table.insert(List1, {
					kind = Kind.ARGUMENT,
					name = { kind = Kind.NAME, value = Value1 },
					value = AstFromValueUntypedResult
				})
			end
		end
	else
		for _, arg in Directive.args do
			local Name = arg.name
			local Entry = List[tostring(Name)]
			
			if Entry ~= nil then
				local AstFromValueResult = AstFromValueFunction(Entry, arg.type)
				
				if Boolean.toJSBoolean(AstFromValueResult) then
					table.insert(List1, {
						kind = Kind.ARGUMENT,
						name = { kind = Kind.NAME, value = Name },
						value = AstFromValueResult
					})
				end
			end
		end
	end
	return {
		kind = Kind.DIRECTIVE,
		name = { kind = Kind.NAME, value = Value },
		arguments = List1
	}
end

Module.makeDirectiveNode = Callback15

Callback10 = function(p7, List) --[[ Line: 975 | Named "makeDirectiveNodes" ]]
	-- upvalues: Array (copy), Callback15 (ref)
	local List1 = {}
	
	for i in List do
		local Entry = List[tostring(i)]
		local Directive = if typeof(p7) == "table" then p7:getDirective(i) else nil
		
		if not Array.isArray(Entry) or #Entry == 0 then
			table.insert(List1, Callback15(i, Entry, Directive))
			continue
		end
		for _, value in Entry do
			table.insert(List1, Callback15(i, value, Directive))
		end
	end
	return List1
end

Module.makeDirectiveNodes = Callback10

return Module