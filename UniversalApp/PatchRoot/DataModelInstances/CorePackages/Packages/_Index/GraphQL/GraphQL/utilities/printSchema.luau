local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local InspectFunction = require(script.Parent.Parent.jsutils.inspect).inspect
local InvariantFunction = require(script.Parent.Parent.jsutils.invariant).invariant
local PrintFunction = require(script.Parent.Parent.language.printer).print
local PrintBlockStringFunction = require(script.Parent.Parent.language.blockString).printBlockString
local IsIntrospectionTypeFunction = require(script.Parent.Parent.type.introspection).isIntrospectionType
local GraphQLString = require(script.Parent.Parent.type.scalars).GraphQLString
local IsSpecifiedScalarTypeFunction = require(script.Parent.Parent.type.scalars).isSpecifiedScalarType
local DirectivesModule = require(script.Parent.Parent.type.directives)
local DEFAULTDEPRECATIONREASON = DirectivesModule.DEFAULT_DEPRECATION_REASON
local IsSpecifiedDirectiveFunction = DirectivesModule.isSpecifiedDirective
local DefinitionModule = require(script.Parent.Parent.type.definition)
local IsScalarTypeFunction = DefinitionModule.isScalarType
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsUnionTypeFunction = DefinitionModule.isUnionType
local IsEnumTypeFunction = DefinitionModule.isEnumType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local _ = require(script.Parent.Parent.type.schema)
local _ = require(script.Parent.Parent.language.ast)
local AstFromValueFunction = require(script.Parent.astFromValue).astFromValue
local IsNillishModule = require(script.Parent.Parent.luaUtils.isNillish)
local IsNillishFunction = IsNillishModule.isNillish
local IsNotNillishFunction = IsNillishModule.isNotNillish
local Callback7 = nil
local Callback6 = nil
local Callback = nil
local IsDefinedType = nil
local Callback3 = nil
local Callback4 = nil
local Callback2 = nil
local Callback5 = nil
local Callback8 = nil
local Callback17 = nil
local Callback16 = nil
local Callback15 = nil
local Callback14 = nil
local Callback9 = nil
local Callback10 = nil
local Callback1 = nil
local Callback11 = nil
local Callback12 = nil
local Callback13 = nil

local function printSchema(p1) --[[ Line: 76 ]]
	-- upvalues: Callback (ref), IsSpecifiedDirectiveFunction (copy), IsDefinedType (ref)
	return Callback(p1, function(p2): boolean --[[ Line: 77 ]]
		-- upvalues: IsSpecifiedDirectiveFunction (upval)
		return not IsSpecifiedDirectiveFunction(p2)
	end, IsDefinedType)
end

local function printIntrospectionSchema(p1) --[[ Line: 82 ]]
	-- upvalues: Callback (ref), IsSpecifiedDirectiveFunction (copy), IsIntrospectionTypeFunction (copy)
	return Callback(p1, IsSpecifiedDirectiveFunction, IsIntrospectionTypeFunction)
end

IsDefinedType = function(p1): boolean --[[ Line: 86 | Named "isDefinedType" ]]
	-- upvalues: IsSpecifiedScalarTypeFunction (copy), IsIntrospectionTypeFunction (copy)
	return not IsSpecifiedScalarTypeFunction(p1) and not IsIntrospectionTypeFunction(p1)
end

Callback = function(p1, IsSpecifiedDirective, IsDefinedType): string --[[ Line: 90 | Named "printFilteredSchema" ]]
	-- upvalues: Array (copy), Callback3 (ref), Callback4 (ref), Callback2 (ref), Boolean (copy)
	return Array.join(Array.filter(Array.concat({ Callback3(p1) }, Array.map(Array.filter(p1:getDirectives(), IsSpecifiedDirective), function(p2) --[[ Line: 103 ]]
		-- upvalues: Callback4 (upval)
		return Callback4(p2)
	end), Array.map(Array.filter(p1:getTypeMap():values(), IsDefinedType), function(p2) --[[ Line: 106 ]]
		-- upvalues: Callback2 (upval)
		return Callback2(p2)
	end)), function(p2) --[[ Line: 111 ]]
		-- upvalues: Boolean (upval)
		return Boolean.toJSBoolean(p2)
	end), "\n\n") .. "\n"
end

Callback3 = function(p1): string? --[[ Line: 118 | Named "printSchemaDefinition" ]]
	-- upvalues: IsNillishFunction (copy), Callback5 (ref), IsNotNillishFunction (copy), Callback6 (ref), Array (copy)
	if IsNillishFunction(p1.description) and Callback5(p1) then return end
	local List = {}
	local QueryType = p1:getQueryType()
	
	if IsNotNillishFunction(QueryType) then
		table.insert(List, ("  query: %s"):format(QueryType.name))
	end
	local MutationType = p1:getMutationType()
	
	if IsNotNillishFunction(MutationType) then
		table.insert(List, ("  mutation: %s"):format(MutationType.name))
	end
	local SubscriptionType = p1:getSubscriptionType()
	
	if IsNotNillishFunction(SubscriptionType) then
		table.insert(List, ("  subscription: %s"):format(SubscriptionType.name))
	end
	return Callback6(p1) .. ("schema {\n%s\n}"):format(Array.join(List, "\n"))
end

Callback5 = function(p1): boolean --[[ Line: 164 | Named "isSchemaOfCommonNames" ]]
	-- upvalues: IsNotNillishFunction (copy)
	local QueryType = p1:getQueryType()
	
	if IsNotNillishFunction(QueryType) and QueryType.name ~= "Query" then
		return false
	end
	local MutationType = p1:getMutationType()
	
	if IsNotNillishFunction(MutationType) and MutationType.name ~= "Mutation" then
		return false
	else
		local SubscriptionType = p1:getSubscriptionType()
		
		return not IsNotNillishFunction(SubscriptionType) or SubscriptionType.name == "Subscription"
	end
end

Callback2 = function(p1) --[[ Line: 190 | Named "printType" ]]
	-- upvalues: IsScalarTypeFunction (copy), Callback7 (ref), IsObjectTypeFunction (copy), Callback8 (ref), IsInterfaceTypeFunction (copy), Callback9 (ref), IsUnionTypeFunction (copy), Callback10 (ref), IsEnumTypeFunction (copy), Callback1 (ref), IsInputObjectTypeFunction (copy), Callback11 (ref), InvariantFunction (copy), InspectFunction (copy)
	if IsScalarTypeFunction(p1) then
		return Callback7(p1)
	elseif IsObjectTypeFunction(p1) then
		return Callback8(p1)
	elseif IsInterfaceTypeFunction(p1) then
		return Callback9(p1)
	elseif IsUnionTypeFunction(p1) then
		return Callback10(p1)
	elseif IsEnumTypeFunction(p1) then
		return Callback1(p1)
	elseif IsInputObjectTypeFunction(p1) then
		return Callback11(p1)
	else
		InvariantFunction(false, "Unexpected type: " .. InspectFunction(p1))
		
		return ""
	end
end

Callback7 = function(p1): string --[[ Line: 218 | Named "printScalar" ]]
	-- upvalues: Callback6 (ref), Callback12 (ref)
	return Callback6(p1) .. ("scalar %s"):format(p1.name) .. Callback12(p1)
end

local function printImplementedInterfaces(p1): string --[[ Line: 222 ]]
	-- upvalues: Array (copy)
	local Interfaces = p1.getInterfaces(p1)
	
	return if #Interfaces > 0 then " implements " .. Array.join(Array.map(Interfaces, function(p2) --[[ Line: 230 ]]
		return p2.name
	end), " & ") else ""
end

Callback8 = function(p1): string --[[ Line: 238 | Named "printObject" ]]
	-- upvalues: Callback6 (ref), printImplementedInterfaces (copy), Callback13 (ref)
	return Callback6(p1) .. ("type %s"):format(p1.name) .. printImplementedInterfaces(p1) .. Callback13(p1)
end

Callback9 = function(p1): string --[[ Line: 245 | Named "printInterface" ]]
	-- upvalues: Callback6 (ref), printImplementedInterfaces (copy), Callback13 (ref)
	return Callback6(p1) .. ("interface %s"):format(p1.name) .. printImplementedInterfaces(p1) .. Callback13(p1)
end

Callback10 = function(p1): string --[[ Line: 252 | Named "printUnion" ]]
	-- upvalues: Array (copy), Callback6 (ref)
	local Types = p1:getTypes()
	
	return Callback6(p1) .. "union " .. p1.name .. (if #Types > 0 then " = " .. Array.join(Types, " | ") else "")
end

Callback1 = function(p1): string --[[ Line: 259 | Named "printEnum" ]]
	-- upvalues: Array (copy), Callback6 (ref), Callback15 (ref), Callback14 (ref)
	return Callback6(p1) .. ("enum %s"):format(p1.name) .. Callback14((Array.map(p1:getValues(), function(p2, p3): string --[[ Line: 261 ]]
		-- upvalues: Callback6 (upval), Callback15 (upval)
		return Callback6(p2, "  ", p3 == 1) .. "  " .. p2.name .. Callback15(p2.deprecationReason)
	end)))
end

Callback11 = function(p1): string --[[ Line: 271 | Named "printInputObject" ]]
	-- upvalues: Array (copy), Callback6 (ref), Callback16 (ref), Callback14 (ref)
	return Callback6(p1) .. ("input %s"):format(p1.name) .. Callback14((Array.map(p1:getFields():values(), function(p2, p3): string --[[ Line: 274 ]]
		-- upvalues: Callback6 (upval), Callback16 (upval)
		return Callback6(p2, "  ", p3 == 1) .. "  " .. Callback16(p2)
	end)))
end

Callback13 = function(p1) --[[ Line: 281 | Named "printFields" ]]
	-- upvalues: Array (copy), Callback6 (ref), Callback17 (ref), Callback15 (ref), Callback14 (ref)
	return Callback14((Array.map(p1.getFields(p1):values(), function(p2, p3): string --[[ Line: 287 ]]
		-- upvalues: Callback6 (upval), Callback17 (upval), Callback15 (upval)
		return Callback6(p2, "  ", p3 == 1) .. "  " .. p2.name .. Callback17(p2.args, "  ") .. ": " .. tostring(p2.type) .. Callback15(p2.deprecationReason)
	end)))
end

Callback14 = function(MapResult): string --[[ Line: 301 | Named "printBlock" ]]
	-- upvalues: Array (copy)
	return if #MapResult == 0 then "" else " {\n" .. Array.join(MapResult, "\n") .. "\n}"
end

Callback17 = function(Args, p1): string --[[ Line: 305 | Named "printArgs" ]]
	-- upvalues: Array (copy), IsNillishFunction (copy), Callback16 (ref), Callback6 (ref)
	local v1 = if p1 == nil then "" else p1
	
	return if #Args == 0 then "" elseif Array.every(Args, function(p2) --[[ Line: 314 ]]
		-- upvalues: IsNillishFunction (upval)
		return IsNillishFunction(p2.description)
	end) then "(" .. Array.join(Array.map(Args, Callback16), ", ") .. ")" else "(\n" .. Array.join(Array.map(Args, function(p2, p3): string --[[ Line: 326 ]]
		-- upvalues: Callback6 (upval), v1 (copy), Callback16 (upval)
		return Callback6(p2, "  " .. v1, p3 == 1) .. "  " .. v1 .. Callback16(p2)
	end), "\n") .. "\n" .. v1 .. ")"
end

Callback16 = function(p1): string --[[ Line: 339 | Named "printInputValue" ]]
	-- upvalues: AstFromValueFunction (copy), IsNotNillishFunction (copy), PrintFunction (copy), Callback15 (ref)
	local AstFromValueResult = AstFromValueFunction(p1.defaultValue, p1.type)
	local Text = p1.name .. ": " .. tostring(p1.type)
	
	if IsNotNillishFunction(AstFromValueResult) then
		Text ..= (" = %s"):format(PrintFunction(AstFromValueResult))
	end
	return Text .. Callback15(p1.deprecationReason)
end

Callback4 = function(p1): string --[[ Line: 351 | Named "printDirective" ]]
	-- upvalues: Callback6 (ref), Callback17 (ref), Array (copy)
	return Callback6(p1) .. "directive @" .. p1.name .. Callback17(p1.args) .. (if p1.isRepeatable then " repeatable" else "") .. " on " .. Array.join(p1.locations, " | ")
end

Callback15 = function(DeprecationReason): string --[[ Line: 361 | Named "printDeprecated" ]]
	-- upvalues: IsNillishFunction (copy), AstFromValueFunction (copy), GraphQLString (copy), DEFAULTDEPRECATIONREASON (copy), PrintFunction (copy)
	if IsNillishFunction(DeprecationReason) then
		return ""
	else
		local AstFromValueResult = AstFromValueFunction(DeprecationReason, GraphQLString)
		
		return if AstFromValueResult and DeprecationReason ~= DEFAULTDEPRECATIONREASON then " @deprecated(reason: " .. PrintFunction(AstFromValueResult) .. ")" else " @deprecated"
	end
end

Callback12 = function(p1): string --[[ Line: 376 | Named "printSpecifiedByUrl" ]]
	-- upvalues: IsNillishFunction (copy), AstFromValueFunction (copy), GraphQLString (copy), InvariantFunction (copy), PrintFunction (copy)
	if IsNillishFunction(p1.specifiedByUrl) then
		return ""
	else
		local AstFromValueResult = AstFromValueFunction(p1.specifiedByUrl, GraphQLString)
		InvariantFunction(AstFromValueResult, "Unexpected null value returned from `astFromValue` for specifiedByUrl")
		
		return " @specifiedBy(url: " .. PrintFunction(AstFromValueResult) .. ")"
	end
end

Callback6 = function(p1, p2, p3): string --[[ Line: 390 | Named "printDescription" ]]
	-- upvalues: IsNillishFunction (copy), PrintBlockStringFunction (copy), Boolean (copy)
	local v1 = if p2 == nil then "" else p2
	local v2 = p3 == nil or p3
	local Description: string = p1.description
	
	if IsNillishFunction(Description) then
		return ""
	else
		local Text = if Boolean.toJSBoolean(v1) and not v2 then "\n" .. v1 else v1
		local Replaced, _ = string.gsub(PrintBlockStringFunction(Description, "", string.len(Description) > 70), "\n", "\n" .. v1)
		
		return Text .. Replaced .. "\n"
	end
end

return {
	printSchema = printSchema,
	printIntrospectionSchema = printIntrospectionSchema,
	printType = Callback2,
	NULL = require(script.Parent.astFromValue).NULL
}