local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local IsNotNillishFunction = require(Parent.luaUtils.isNillish).isNotNillish
local InspectFunction = require(script.Parent.Parent.jsutils.inspect).inspect
local GraphQLError = require(script.Parent.Parent.error.GraphQLError).GraphQLError
local LocatedErrorFunction = require(script.Parent.Parent.error).locatedError
local _ = require(Parent.language.ast)
local IsValidNameErrorFunction = require(Parent.utilities.assertValidName).isValidNameError
local TypeComparatorsModule = require(script.Parent.Parent.utilities.typeComparators)
local IsEqualTypeFunction = TypeComparatorsModule.isEqualType
local IsTypeSubTypeOfFunction = TypeComparatorsModule.isTypeSubTypeOf
local AssertSchemaFunction = require(script.Parent.schema).assertSchema
local DefinitionModule = require(script.Parent.definition)
local IsIntrospectionTypeFunction = require(script.Parent.introspection).isIntrospectionType
local DirectivesModule = require(script.Parent.directives)
local IsDirectiveFunction = DirectivesModule.isDirective
local GraphQLDeprecatedDirective = DirectivesModule.GraphQLDeprecatedDirective
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsUnionTypeFunction = DefinitionModule.isUnionType
local IsEnumTypeFunction = DefinitionModule.isEnumType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local IsNamedTypeFunction = DefinitionModule.isNamedType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local IsInputTypeFunction = DefinitionModule.isInputType
local IsOutputTypeFunction = DefinitionModule.isOutputType
local IsRequiredArgumentFunction = DefinitionModule.isRequiredArgument
local IsRequiredInputFieldFunction = DefinitionModule.isRequiredInputField
local Module = nil
local Callback1 = nil
local Callback = nil
local Callback3 = nil
local Callback4 = nil
local Callback10 = nil
local Callback11 = nil
local Callback6 = nil
local Callback14 = nil
local Callback9 = nil
local Callback5 = nil
local Callback7 = nil
local Callback12 = nil
local Callback2 = nil
local Callback13 = nil
local Callback8 = nil

local function ValidateSchema(Schema)
	-- upvalues: AssertSchemaFunction (copy), Module (ref), Callback1 (ref), Callback (ref), Callback2 (ref)
	AssertSchemaFunction(Schema)
	
	if Schema.__validationErrors == nil then
		local NewModule = Module.new(Schema)
		Callback1(NewModule)
		Callback(NewModule)
		Callback2(NewModule)
		local Errors = NewModule:getErrors()
		Schema.__validationErrors = Errors
		
		return Errors
	else
		return Schema.__validationErrors
	end
end

local function AssertValidSchema(p1)
	-- upvalues: ValidateSchema (copy), Error1 (copy), Array (copy)
	local ValidateSchemaResult = ValidateSchema(p1)
	
	if #ValidateSchemaResult ~= 0 then
		error(Error1.new(Array.join(Array.map(ValidateSchemaResult, function(p2)
			return p2.message
		end), "\n\n")))
	end
end

Module = {}
Module.__index = Module

function Module.new(Schema)
	-- upvalues: Module (ref)
	local self = setmetatable({}, Module)
	self._errors = {}
	self.schema = Schema
	
	return self
end

function Module:reportError(Message, AstNode)
	-- upvalues: Array (copy), Boolean (copy), GraphQLError (copy)
	self:addError(GraphQLError.new(Message, if Array.isArray(AstNode) then Array.filter(AstNode, Boolean.toJSBoolean) else AstNode))
end

function Module:addError(NewResult)
	table.insert(self._errors, NewResult)
end

function Module:getErrors()
	return self._errors
end

Callback1 = function(NewResult)
	-- upvalues: IsNotNillishFunction (copy), IsObjectTypeFunction (copy), Callback3 (ref), InspectFunction (copy)
	local Schema = NewResult.schema
	local QueryType = Schema:getQueryType()
	
	if IsNotNillishFunction(QueryType) then
		if not IsObjectTypeFunction(QueryType) then
			local Query = Callback3(Schema, "query")
			NewResult:reportError(("Query root type must be Object type, it cannot be %s."):format(InspectFunction(QueryType)), if Query then Query else QueryType.astNode)
		end
	else
		NewResult:reportError("Query root type must be provided.", Schema.astNode)
	end
	local MutationType = Schema:getMutationType()
	
	if IsNotNillishFunction(MutationType) and not IsObjectTypeFunction(MutationType) then
		local Mutation = Callback3(Schema, "mutation")
		NewResult:reportError("Mutation root type must be Object type if provided, it cannot be " .. ("%s."):format(InspectFunction(MutationType)), if Mutation then Mutation else MutationType.astNode)
	end
	local SubscriptionType = Schema:getSubscriptionType()
	
	if IsNotNillishFunction(SubscriptionType) and not IsObjectTypeFunction(SubscriptionType) then
		local Subscription = Callback3(Schema, "subscription")
		NewResult:reportError("Subscription root type must be Object type if provided, it cannot be " .. ("%s."):format(InspectFunction(SubscriptionType)), if Subscription then Subscription else SubscriptionType.astNode)
	end
end

Callback3 = function(Schema, Operation)
	-- upvalues: Callback4 (ref)
	for _, value in ipairs((Callback4(Schema, function(p1)
		return p1.operationTypes
	end))) do
		if value.operation == Operation then
			return value.type
		end
	end
	return nil
end

Callback = function(NewResult)
	-- upvalues: IsDirectiveFunction (copy), InspectFunction (copy), Callback5 (ref), IsInputTypeFunction (copy), IsRequiredArgumentFunction (copy), IsNotNillishFunction (copy), Callback6 (ref)
	for _, directive in ipairs(NewResult.schema:getDirectives()) do
		if not IsDirectiveFunction(directive) then
			NewResult:reportError(("Expected directive but got: %s."):format(InspectFunction(directive)), if directive then directive.astNode else nil)
			continue
		end
		Callback5(NewResult, directive)
		
		for _, arg in ipairs(directive.args) do
			Callback5(NewResult, arg)
			
			if not IsInputTypeFunction(arg.type) then
				NewResult:reportError(("The type of @%s(%s:) must be Input Type "):format(directive.name, arg.name) .. ("but got: %s."):format(InspectFunction(arg.type)), arg.astNode)
			end
			if IsRequiredArgumentFunction(arg) and IsNotNillishFunction(arg.deprecationReason) then
				NewResult:reportError(("Required argument @%s(%s:) cannot be deprecated."):format(directive.name, arg.name), {
					Callback6(arg.astNode),
					if arg.astNode == nil then nil else arg.astNode.type
				})
			end
		end
	end
end

Callback5 = function(p1, p2)
	-- upvalues: IsValidNameErrorFunction (copy), LocatedErrorFunction (copy)
	local AstNode = nil
	local Name = nil
	
	if typeof(p2) == "table" then
		Name = p2.name
		AstNode = p2.astNode
	else
		Name = tostring(p2)
	end
	local IsValidNameError = IsValidNameErrorFunction(Name)
	
	if IsValidNameError then
		p1:addError(LocatedErrorFunction(IsValidNameError, AstNode))
	end
end

Callback2 = function(NewResult)
	-- upvalues: IsNamedTypeFunction (copy), InspectFunction (copy), IsIntrospectionTypeFunction (copy), Callback5 (ref), IsObjectTypeFunction (copy), Callback7 (ref), Callback8 (ref), IsInterfaceTypeFunction (copy), IsUnionTypeFunction (copy), IsEnumTypeFunction (copy), Callback9 (ref), IsInputObjectTypeFunction (copy)
	local InputObjectCircularRefsValidator: (any) -> () = createInputObjectCircularRefsValidator(NewResult)
	
	for _, value in ipairs(NewResult.schema:getTypeMap():values()) do
		local AstNode = if typeof(value) == "table" then value.astNode else nil
		
		if not IsNamedTypeFunction(value) then
			NewResult:reportError(("Expected GraphQL named type but got: %s."):format(InspectFunction(value)), AstNode)
			continue
		end
		if not IsIntrospectionTypeFunction(value) then
			Callback5(NewResult, value)
		end
		if IsObjectTypeFunction(value) then
			Callback7(NewResult, value)
			Callback8(NewResult, value)
		elseif IsInterfaceTypeFunction(value) then
			Callback7(NewResult, value)
			Callback8(NewResult, value)
		elseif IsUnionTypeFunction(value) then
			validateUnionMembers(NewResult, value)
		elseif IsEnumTypeFunction(value) then
			Callback9(NewResult, value)
		elseif IsInputObjectTypeFunction(value) then
			validateInputFields(NewResult, value)
			InputObjectCircularRefsValidator(value)
		end
	end
end

Callback7 = function(p1, p2)
	-- upvalues: Callback10 (ref), Callback5 (ref), IsOutputTypeFunction (copy), InspectFunction (copy), IsInputTypeFunction (copy), IsRequiredArgumentFunction (copy), IsNotNillishFunction (copy), Callback6 (ref)
	local ValuesResult = p2:getFields():values()
	
	if #ValuesResult == 0 then
		p1:reportError(("Type %s must define one or more fields."):format(p2.name), Callback10(p2))
	end
	for _, value in ipairs(ValuesResult) do
		Callback5(p1, value)
		
		if not IsOutputTypeFunction(value.type) then
			p1:reportError(("The type of %s.%s must be Output Type "):format(p2.name, value.name) .. ("but got: %s."):format(InspectFunction(value.type)), if value.astNode == nil then nil else value.astNode.type)
		end
		for _, arg in ipairs(value.args) do
			local Name = arg.name
			Callback5(p1, arg)
			
			if not IsInputTypeFunction(arg.type) then
				p1:reportError(("The type of %s.%s(%s:) must be Input "):format(p2.name, value.name, Name) .. ("Type but got: %s."):format(InspectFunction(arg.type)), if arg.astNode == nil then nil else arg.astNode.type)
			end
			if IsRequiredArgumentFunction(arg) and IsNotNillishFunction(arg.deprecationReason) then
				p1:reportError(("Required argument %s.%s(%s:) cannot be deprecated."):format(p2.name, value.name, Name), {
					Callback6(arg.astNode),
					if arg.astNode == nil then nil else arg.astNode.type
				})
			end
		end
	end
end

Callback8 = function(p3, p4)
	-- upvalues: IsInterfaceTypeFunction (copy), InspectFunction (copy), Callback11 (ref), Callback12 (ref), Callback13 (ref)
	local t = {}
	
	for _, interface in ipairs(p4:getInterfaces()) do
		if not IsInterfaceTypeFunction(interface) then
			p3:reportError(("Type %s must only implement Interface types, "):format(InspectFunction(p4)) .. ("it cannot implement %s."):format(InspectFunction(interface)), Callback11(p4, interface))
			continue
		end
		if p4 == interface then
			p3:reportError(("Type %s cannot implement itself because it would create a circular reference."):format(p4.name), Callback11(p4, interface))
		else
			local Text: string = if typeof(nil) == "table" then tostring(interface.name) else tostring(interface)
			
			if t[Text] then
				p3:reportError(("Type %s can only implement %s once."):format(p4.name, interface.name), Callback11(p4, interface))
			else
				t[Text] = true
				Callback12(p3, p4, interface)
				Callback13(p3, p4, interface)
			end
		end
	end
end

Callback13 = function(p5, p6, p7)
	-- upvalues: Array (copy), Callback10 (ref), IsTypeSubTypeOfFunction (copy), InspectFunction (copy), IsEqualTypeFunction (copy), IsRequiredArgumentFunction (copy)
	local Fields = p6:getFields()
	
	for _, value in ipairs(p7:getFields():values()) do
		local Name = value.name
		local GetResult = Fields:get(Name)
		
		if not GetResult then
			p5:reportError(("Interface field %s.%s expected but %s does not provide it."):format(p7.name, Name, p6.name), Array.concat({ value.astNode }, Callback10(p6)))
			continue
		end
		if not IsTypeSubTypeOfFunction(p5.schema, GetResult.type, value.type) then
			p5:reportError(("Interface field %s.%s expects type "):format(p7.name, Name) .. ("%s but %s.%s "):format(InspectFunction(value.type), p6.name, Name) .. ("is type %s."):format(InspectFunction(GetResult.type)), {
				if value.astNode == nil then nil else value.astNode.type,
				if GetResult.astNode == nil then nil else GetResult.astNode.type
			})
		end
		for _, arg in ipairs(value.args) do
			local Name1 = arg.name
			local FindResult = Array.find(GetResult.args, function(p8): boolean
				-- upvalues: Name1 (copy)
				return p8.name == Name1
			end)
			
			if not FindResult then
				p5:reportError(("Interface field argument %s.%s(%s:) expected but %s.%s does not provide it."):format(p7.name, Name, Name1, p6.name, Name), { arg.astNode, GetResult.astNode })
			elseif not IsEqualTypeFunction(arg.type, FindResult.type) then
				p5:reportError(("Interface field argument %s.%s(%s:) "):format(p7.name, Name, Name1) .. ("expects type %s but "):format(InspectFunction(arg.type)) .. ("%s.%s(%s:) is type "):format(p6.name, Name, Name1) .. ("%s."):format(InspectFunction(FindResult.type)), {
					if arg.astNode == nil then nil else arg.astNode.type,
					if FindResult.astNode == nil then nil else FindResult.astNode.type
				})
			end
		end
		for _, arg1 in ipairs(GetResult.args) do
			local Name2 = arg1.name
			
			if not Array.find(value.args, function(p8): boolean
				-- upvalues: Name2 (copy)
				return p8.name == Name2
			end) and IsRequiredArgumentFunction(arg1) then
				p5:reportError(("Object field %s.%s includes required argument %s that is missing from the Interface field %s.%s."):format(p6.name, Name, Name2, p7.name, Name), { arg1.astNode, value.astNode })
			end
		end
	end
end

Callback12 = function(p8, p9, p10)
	-- upvalues: Array (copy), Callback11 (ref)
	local Interfaces = p9:getInterfaces()
	
	for _, interface in ipairs(p10:getInterfaces()) do
		if Array.indexOf(Interfaces, interface) == -1 then
			p8:reportError(if interface == p9 then ("Type %s cannot implement %s because it would create a circular reference."):format(p9.name, p10.name) else ("Type %s must implement %s because it is implemented by %s."):format(p9.name, interface.name, p10.name), Array.concat(Callback11(p10, interface), Callback11(p9, p10)))
		end
	end
end

function validateUnionMembers(p11, p12)
	-- upvalues: Callback10 (ref), Callback14 (ref), IsObjectTypeFunction (copy), InspectFunction (copy)
	local Types = p12:getTypes()
	
	if #Types == 0 then
		p11:reportError(("Union type %s must define one or more member types."):format(p12.name), Callback10(p12))
	end
	local t = {}
	
	for _, _type in ipairs(Types) do
		if t[tostring(_type.name)] then
			p11:reportError(("Union type %s can only include type %s once."):format(p12.name, _type.name), Callback14(p12, _type.name))
		else
			t[tostring(_type.name)] = true
			
			if not IsObjectTypeFunction(_type) then
				p11:reportError(("Union type %s can only include Object types, "):format(p12.name) .. ("it cannot include %s."):format(InspectFunction(_type)), Callback14(p12, (tostring(_type))))
			end
		end
	end
end

Callback9 = function(p13, p14)
	-- upvalues: Callback10 (ref), Callback5 (ref)
	local Values = p14:getValues()
	
	if #Values == 0 then
		p13:reportError(("Enum type %s must define one or more values."):format(p14.name), Callback10(p14))
	end
	for _, value in ipairs(Values) do
		local Name = value.name
		Callback5(p13, value)
		
		if Name == "true" or Name == "false" or Name == "null" then
			p13:reportError(("Enum type %s cannot include value: %s."):format(p14.name, Name), value.astNode)
		end
	end
end

function validateInputFields(p15, p16)
	-- upvalues: Callback10 (ref), Callback5 (ref), IsInputTypeFunction (copy), InspectFunction (copy), IsRequiredInputFieldFunction (copy), IsNotNillishFunction (copy), Callback6 (ref)
	local ValuesResult = p16:getFields():values()
	
	if #ValuesResult == 0 then
		p15:reportError(("Input Object type %s must define one or more fields."):format(p16.name), Callback10(p16))
	end
	for _, value in ipairs(ValuesResult) do
		Callback5(p15, value)
		
		if not IsInputTypeFunction(value.type) then
			p15:reportError(("The type of %s.%s must be Input Type "):format(p16.name, value.name) .. ("but got: %s."):format(InspectFunction(value.type)), if value.astNode == nil then nil else value.astNode.type)
		end
		if IsRequiredInputFieldFunction(value) and IsNotNillishFunction(value.deprecationReason) then
			p15:reportError(("Required input field %s.%s cannot be deprecated."):format(p16.name, value.name), {
				Callback6(value.astNode),
				if value.astNode == nil then nil else value.astNode.type
			})
		end
	end
end

function createInputObjectCircularRefsValidator(p17)
	-- upvalues: IsNonNullTypeFunction (copy), IsInputObjectTypeFunction (copy), Array (copy)
	local t = {}
	local List = {}
	local t1 = {}
	
	local function detectCycleRecursive(OfType)
		-- upvalues: t (copy), t1 (copy), List (copy), IsNonNullTypeFunction (upval), IsInputObjectTypeFunction (upval), detectCycleRecursive (copy), Array (upval), p17 (copy)
		if t[tostring(OfType.name)] then return end
		t[tostring(OfType.name)] = true
		t1[tostring(OfType.name)] = #List + 1
		
		for _, value in ipairs((OfType:getFields():values())) do
			if IsNonNullTypeFunction(value.type) and IsInputObjectTypeFunction(value.type.ofType) then
				local OfType1 = value.type.ofType
				local Entry = t1[tostring(OfType1.name)]
				table.insert(List, value)
				
				if Entry == nil then
					detectCycleRecursive(OfType1)
				else
					local SliceResult = Array.slice(List, Entry)
					p17:reportError(("Cannot reference Input Object \"%s\" within itself through a series of non-null fields: \"%s\"."):format(OfType1.name, (Array.join(Array.map(SliceResult, function(p18)
						return p18.name
					end), "."))), Array.map(SliceResult, function(p18)
						return p18.astNode
					end))
				end
				table.remove(List)
			end
		end
		t1[tostring(OfType.name)] = nil
	end
	
	return detectCycleRecursive
end

Callback10 = function(p18)
	-- upvalues: Array (copy)
	local AstNode = p18.astNode
	local ExtensionASTNodes = p18.extensionASTNodes
	
	return if AstNode then if ExtensionASTNodes then Array.concat({ AstNode }, ExtensionASTNodes) else { AstNode } elseif ExtensionASTNodes then ExtensionASTNodes else {}
end

Callback4 = function(p18, Callback)
	-- upvalues: Callback10 (ref), Array (copy)
	local ConcatResult = {}
	
	for _, value in ipairs(Callback10(p18)) do
		local CallbackResult = Callback(value)
		ConcatResult = Array.concat(ConcatResult, if CallbackResult then CallbackResult else {})
	end
	return ConcatResult
end

Callback11 = function(p19, p20)
	-- upvalues: Array (copy), Callback4 (ref)
	return Array.filter(Callback4(p19, function(p21)
		return p21.interfaces
	end), function(p21): boolean
		-- upvalues: p20 (copy)
		return p21.name.value == p20.name
	end)
end

Callback14 = function(p19, Name)
	-- upvalues: Array (copy), Callback4 (ref)
	return Array.filter(Callback4(p19, function(p20)
		return p20.types
	end), function(p20): boolean
		-- upvalues: Name (copy)
		return p20.name.value == Name
	end)
end

Callback6 = function(AstNode)
	-- upvalues: Array (copy), GraphQLDeprecatedDirective (copy)
	if AstNode == nil or AstNode.directives == nil then return end
	return Array.find(AstNode.directives, function(p19): boolean
		-- upvalues: GraphQLDeprecatedDirective (upval)
		return p19.name.value == GraphQLDeprecatedDirective.name
	end)
end

return {
	validateSchema = ValidateSchema,
	assertValidSchema = AssertValidSchema
}