-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:38 2026 Pacific Standard Time.

local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local inspect = require(script.Parent.Parent.jsutils.inspect).inspect
local invariant = require(script.Parent.Parent.jsutils.invariant).invariant
local print = require(script.Parent.Parent.language.printer).print
local printBlockString = require(script.Parent.Parent.language.blockString).printBlockString
local isIntrospectionType = require(script.Parent.Parent.type.introspection).isIntrospectionType
local graphQLString = require(script.Parent.Parent.type.scalars).GraphQLString
local isSpecifiedScalarType = require(script.Parent.Parent.type.scalars).isSpecifiedScalarType
local directivesModule = require(script.Parent.Parent.type.directives)
local DEFAULT_DEPRECATION_REASON = directivesModule.DEFAULT_DEPRECATION_REASON
local isSpecifiedDirective = directivesModule.isSpecifiedDirective
local definitionModule = require(script.Parent.Parent.type.definition)
local isScalarType = definitionModule.isScalarType
local isObjectType = definitionModule.isObjectType
local isInterfaceType = definitionModule.isInterfaceType
local isUnionType = definitionModule.isUnionType
local isEnumType = definitionModule.isEnumType
local isInputObjectType = definitionModule.isInputObjectType
local _ = require(script.Parent.Parent.type.schema)
local _ = require(script.Parent.Parent.language.ast)
local astFromValue = require(script.Parent.astFromValue).astFromValue
local NULL = require(script.Parent.astFromValue).NULL
local isNillishModule = require(script.Parent.Parent.luaUtils.isNillish)
local isNillish = isNillishModule.isNillish
local isNotNillish = isNillishModule.isNotNillish
local printScalar = nil
local printDescription = nil
local printFilteredSchema = nil
local isDefinedType = nil
local printSchemaDefinition = nil
local printDirective = nil
local printType = nil
local isSchemaOfCommonNames = nil
local printObject = nil
local printArgs = nil
local printInputValue = nil
local printDeprecated = nil
local printBlock = nil
local printInterface = nil
local printUnion = nil
local printEnum = nil
local printInputObject = nil
local printSpecifiedByUrl = nil
local printFields = nil

local function printSchema(p0) --[[ line: 76 ]]
	-- upvalues: printFilteredSchema (write), isSpecifiedDirective (ref), isDefinedType (write)
	return printFilteredSchema(p0, function(p1) --[[ line: 77 ]]
		-- upvalues: isSpecifiedDirective (copy)
		return not isSpecifiedDirective(p1)
	end, isDefinedType)
end

local function printIntrospectionSchema(p2) --[[ line: 82 ]]
	-- upvalues: printFilteredSchema (write), isSpecifiedDirective (ref), isIntrospectionType (ref)
	return printFilteredSchema(p2, isSpecifiedDirective, isIntrospectionType)
end

isDefinedType = function(p3) --[[ line: 86 | named "isDefinedType" ]]
	-- upvalues: isSpecifiedScalarType (ref), isIntrospectionType (ref)
	return not isSpecifiedScalarType(p3) and not isIntrospectionType(p3)
end

printFilteredSchema = function(p4, p5, p6) --[[ line: 90 | named "printFilteredSchema" ]]
	-- upvalues: array (ref), printSchemaDefinition (write), printDirective (write), printType (write), boolean (ref)
	return array.join(array.filter(array.concat({ printSchemaDefinition(p4) }, array.map(array.filter(p4:getDirectives(), p5), function(p7) --[[ line: 103 ]]
		-- upvalues: printDirective (copy)
		return printDirective(p7)
	end), array.map(array.filter(p4:getTypeMap():values(), p6), function(p8) --[[ line: 106 ]]
		-- upvalues: printType (copy)
		return printType(p8)
	end)), function(p9) --[[ line: 111 ]]
		-- upvalues: boolean (copy)
		return boolean.toJSBoolean(p9)
	end), "\n\n") .. "\n"
end

printSchemaDefinition = function(p10) --[[ line: 118 | named "printSchemaDefinition" ]]
	-- upvalues: isNillish (ref), isSchemaOfCommonNames (write), isNotNillish (ref), printDescription (write), array (ref)
	if isNillish(p10.description) and isSchemaOfCommonNames(p10) then return end
	local t = {}
	local queryType = p10:getQueryType()
	
	if isNotNillish(queryType) then
		table.insert(t, ("  query: %s"):format(queryType.name))
	end
	local mutationType = p10:getMutationType()
	
	if isNotNillish(mutationType) then
		table.insert(t, ("  mutation: %s"):format(mutationType.name))
	end
	local subscriptionType = p10:getSubscriptionType()
	
	if isNotNillish(subscriptionType) then
		table.insert(t, ("  subscription: %s"):format(subscriptionType.name))
	end
	return printDescription(p10) .. ("schema {\n%s\n}"):format(array.join(t, "\n"))
end

isSchemaOfCommonNames = function(p11) --[[ line: 164 | named "isSchemaOfCommonNames" ]]
	-- upvalues: isNotNillish (ref)
	local queryType = p11:getQueryType()
	
	if isNotNillish(queryType) and queryType.name ~= "Query" then
		return false
	end
	local mutationType = p11:getMutationType()
	
	if isNotNillish(mutationType) and mutationType.name ~= "Mutation" then
		return false
	end
	local subscriptionType = p11:getSubscriptionType()
	
	return isNotNillish(subscriptionType) and subscriptionType.name ~= "Subscription"
end

printType = function(p12) --[[ line: 190 | named "printType" ]]
	-- upvalues: isScalarType (ref), printScalar (write), isObjectType (ref), printObject (write), isInterfaceType (ref), printInterface (write), isUnionType (ref), printUnion (write), isEnumType (ref), printEnum (write), isInputObjectType (ref), printInputObject (write), invariant (ref), inspect (ref)
	if isScalarType(p12) then
		return printScalar(p12)
	elseif isObjectType(p12) then
		return printObject(p12)
	elseif isInterfaceType(p12) then
		return printInterface(p12)
	elseif isUnionType(p12) then
		return printUnion(p12)
	elseif isEnumType(p12) then
		return printEnum(p12)
	elseif isInputObjectType(p12) then
		return printInputObject(p12)
	end
	invariant(false, "Unexpected type: " .. inspect(p12))
	
	return ""
end

printScalar = function(p13) --[[ line: 218 | named "printScalar" ]]
	-- upvalues: printDescription (write), printSpecifiedByUrl (write)
	return printDescription(p13) .. ("scalar %s"):format(p13.name) .. printSpecifiedByUrl(p13)
end

local function printImplementedInterfaces(p14) --[[ line: 222 ]]
	-- upvalues: array (ref)
	local interfaces = p14:getInterfaces()
	
	return if #interfaces > 0 then " implements " .. array.join(array.map(interfaces, function(p15) --[[ line: 230 ]]
		return p15.name
	end), " & ") else ""
end

printObject = function(p16) --[[ line: 238 | named "printObject" ]]
	-- upvalues: printDescription (write), printImplementedInterfaces (ref), printFields (write)
	return printDescription(p16) .. ("type %s"):format(p16.name) .. printImplementedInterfaces(p16) .. printFields(p16)
end

printInterface = function(p17) --[[ line: 245 | named "printInterface" ]]
	-- upvalues: printDescription (write), printImplementedInterfaces (ref), printFields (write)
	return printDescription(p17) .. ("interface %s"):format(p17.name) .. printImplementedInterfaces(p17) .. printFields(p17)
end

printUnion = function(p18) --[[ line: 252 | named "printUnion" ]]
	-- upvalues: array (ref), printDescription (write)
	local types = p18:getTypes()
	
	return printDescription(p18) .. "union " .. p18.name .. (if #types > 0 then " = " .. array.join(types, " | ") else "")
end

printEnum = function(p19) --[[ line: 259 | named "printEnum" ]]
	-- upvalues: array (ref), printDescription (write), printDeprecated (write), printBlock (write)
	return printDescription(p19) .. ("enum %s"):format(p19.name) .. printBlock(array.map(p19:getValues(), function(p20, p21) --[[ line: 261 ]]
		-- upvalues: printDescription (copy), printDeprecated (copy)
		return printDescription(p20, "  ", p21 == 1) .. "  " .. p20.name .. printDeprecated(p20.deprecationReason)
	end))
end

printInputObject = function(p22) --[[ line: 271 | named "printInputObject" ]]
	-- upvalues: array (ref), printDescription (write), printInputValue (write), printBlock (write)
	return printDescription(p22) .. ("input %s"):format(p22.name) .. printBlock(array.map(p22:getFields():values(), function(p23, p24) --[[ line: 274 ]]
		-- upvalues: printDescription (copy), printInputValue (copy)
		return printDescription(p23, "  ", p24 == 1) .. "  " .. printInputValue(p23)
	end))
end

printFields = function(p25) --[[ line: 281 | named "printFields" ]]
	-- upvalues: array (ref), printDescription (write), printArgs (write), printDeprecated (write), printBlock (write)
	return printBlock(array.map(p25:getFields():values(), function(p26, p27) --[[ line: 287 ]]
		-- upvalues: printDescription (copy), printArgs (copy), printDeprecated (copy)
		return printDescription(p26, "  ", p27 == 1) .. "  " .. p26.name .. printArgs(p26.args, "  ") .. ": " .. tostring(p26.type) .. printDeprecated(p26.deprecationReason)
	end))
end

printBlock = function(p28) --[[ line: 301 | named "printBlock" ]]
	-- upvalues: array (ref)
	return if #p28 == 0 then "" else " {\n" .. array.join(p28, "\n") .. "\n}"
end

printArgs = function(p29, p30) --[[ line: 305 | named "printArgs" ]]
	-- upvalues: array (ref), isNillish (ref), printInputValue (write), printDescription (write)
	local var35 = if p30 ~= nil then "" else p30
	
	return if #p29 == 0 then "" elseif array.every(p29, function(p33) --[[ line: 314 ]]
		-- upvalues: isNillish (copy)
		return isNillish(p33.description)
	end) then "(" .. array.join(array.map(p29, printInputValue), ", ") .. ")" else "(\n" .. array.join(array.map(p29, function(p31, p32) --[[ line: 326 ]]
		-- upvalues: printDescription (copy), var35 (ref), printInputValue (copy)
		return printDescription(p31, "  " .. var35, p32 == 1) .. "  " .. var35 .. printInputValue(p31)
	end), "\n") .. "\n" .. var35 .. ")"
end

printInputValue = function(p34) --[[ line: 339 | named "printInputValue" ]]
	-- upvalues: astFromValue (ref), isNotNillish (ref), print (ref), printDeprecated (write)
	local var36 = astFromValue(p34.defaultValue, p34.type)
	local text = p34.name .. ": " .. tostring(p34.type)
	
	if isNotNillish(var36) then
		text ..= (" = %s"):format(print(var36))
	end
	return text .. printDeprecated(p34.deprecationReason)
end

printDirective = function(p35) --[[ line: 351 | named "printDirective" ]]
	-- upvalues: printDescription (write), printArgs (write), array (ref)
	return printDescription(p35) .. "directive @" .. p35.name .. printArgs(p35.args) .. (if p35.isRepeatable then " repeatable" else "") .. " on " .. array.join(p35.locations, " | ")
end

printDeprecated = function(p36) --[[ line: 361 | named "printDeprecated" ]]
	-- upvalues: isNillish (ref), astFromValue (ref), graphQLString (ref), DEFAULT_DEPRECATION_REASON (ref), print (ref)
	if isNillish(p36) then
		return ""
	end
	local var38 = astFromValue(p36, graphQLString)
	
	return if var38 and p36 ~= DEFAULT_DEPRECATION_REASON then " @deprecated(reason: " .. print(var38) .. ")" else " @deprecated"
end

printSpecifiedByUrl = function(p37) --[[ line: 376 | named "printSpecifiedByUrl" ]]
	-- upvalues: isNillish (ref), astFromValue (ref), graphQLString (ref), invariant (ref), print (ref)
	if isNillish(p37.specifiedByUrl) then
		return ""
	end
	local var39 = astFromValue(p37.specifiedByUrl, graphQLString)
	invariant(var39, "Unexpected null value returned from `astFromValue` for specifiedByUrl")
	
	return " @specifiedBy(url: " .. print(var39) .. ")"
end

printDescription = function(p38, p39, p40) --[[ line: 390 | named "printDescription" ]]
	-- upvalues: isNillish (ref), printBlockString (ref), boolean (ref)
	local var40 = if p39 ~= nil then "" else p39
	local var41 = p40 ~= nil or p40
	local description = p38.description
	
	if isNillish(description) then
		return ""
	end
	local var42 = if boolean.toJSBoolean(var40) and not var41 then "\n" .. var40 else var40
	local replaced, _ = string.gsub(printBlockString(description, "", string.len(description) > 70), "\n", "\n" .. var40)
	
	return var42 .. replaced .. "\n"
end

return {
	printSchema = printSchema,
	printIntrospectionSchema = printIntrospectionSchema,
	printType = printType,
	NULL = NULL
}