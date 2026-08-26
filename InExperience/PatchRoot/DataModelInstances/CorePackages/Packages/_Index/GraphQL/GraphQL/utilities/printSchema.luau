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

local function printSchema(p1)
	-- upvalues: printFilteredSchema (write), isSpecifiedDirective (ref), isDefinedType (write)
	return printFilteredSchema(p1, function(p2)
		-- upvalues: isSpecifiedDirective (copy)
		return not isSpecifiedDirective(p2)
	end, isDefinedType)
end

local function printIntrospectionSchema(p1)
	-- upvalues: printFilteredSchema (write), isSpecifiedDirective (ref), isIntrospectionType (ref)
	return printFilteredSchema(p1, isSpecifiedDirective, isIntrospectionType)
end

isDefinedType = function(p1)
	-- upvalues: isSpecifiedScalarType (ref), isIntrospectionType (ref)
	return not isSpecifiedScalarType(p1) and not isIntrospectionType(p1)
end

printFilteredSchema = function(p1, p2, p3)
	-- upvalues: array (ref), printSchemaDefinition (write), printDirective (write), printType (write), boolean (ref)
	return array.join(array.filter(array.concat({ printSchemaDefinition(p1) }, array.map(array.filter(p1:getDirectives(), p2), function(p4)
		-- upvalues: printDirective (copy)
		return printDirective(p4)
	end), array.map(array.filter(p1:getTypeMap():values(), p3), function(p4)
		-- upvalues: printType (copy)
		return printType(p4)
	end)), function(p4)
		-- upvalues: boolean (copy)
		return boolean.toJSBoolean(p4)
	end), "\n\n") .. "\n"
end

printSchemaDefinition = function(p1)
	-- upvalues: isNillish (ref), isSchemaOfCommonNames (write), isNotNillish (ref), printDescription (write), array (ref)
	if isNillish(p1.description) and isSchemaOfCommonNames(p1) then return end
	local t = {}
	local queryType = p1:getQueryType()
	
	if isNotNillish(queryType) then
		table.insert(t, ("  query: %s"):format(queryType.name))
	end
	local mutationType = p1:getMutationType()
	
	if isNotNillish(mutationType) then
		table.insert(t, ("  mutation: %s"):format(mutationType.name))
	end
	local subscriptionType = p1:getSubscriptionType()
	
	if isNotNillish(subscriptionType) then
		table.insert(t, ("  subscription: %s"):format(subscriptionType.name))
	end
	return printDescription(p1) .. ("schema {\n%s\n}"):format(array.join(t, "\n"))
end

isSchemaOfCommonNames = function(p1)
	-- upvalues: isNotNillish (ref)
	local queryType = p1:getQueryType()
	
	if isNotNillish(queryType) and queryType.name ~= "Query" then
		return false
	end
	local mutationType = p1:getMutationType()
	
	if isNotNillish(mutationType) and mutationType.name ~= "Mutation" then
		return false
	end
	local subscriptionType = p1:getSubscriptionType()
	
	return isNotNillish(subscriptionType) and subscriptionType.name ~= "Subscription"
end

printType = function(p1)
	-- upvalues: isScalarType (ref), printScalar (write), isObjectType (ref), printObject (write), isInterfaceType (ref), printInterface (write), isUnionType (ref), printUnion (write), isEnumType (ref), printEnum (write), isInputObjectType (ref), printInputObject (write), invariant (ref), inspect (ref)
	if isScalarType(p1) then
		return printScalar(p1)
	elseif isObjectType(p1) then
		return printObject(p1)
	elseif isInterfaceType(p1) then
		return printInterface(p1)
	elseif isUnionType(p1) then
		return printUnion(p1)
	elseif isEnumType(p1) then
		return printEnum(p1)
	elseif isInputObjectType(p1) then
		return printInputObject(p1)
	end
	invariant(false, "Unexpected type: " .. inspect(p1))
	
	return ""
end

printScalar = function(p1)
	-- upvalues: printDescription (write), printSpecifiedByUrl (write)
	return printDescription(p1) .. ("scalar %s"):format(p1.name) .. printSpecifiedByUrl(p1)
end

local function printImplementedInterfaces(p1)
	-- upvalues: array (ref)
	local interfaces = p1:getInterfaces()
	
	return if #interfaces > 0 then " implements " .. array.join(array.map(interfaces, function(p2)
		return p2.name
	end), " & ") else ""
end

printObject = function(p1)
	-- upvalues: printDescription (write), printImplementedInterfaces (ref), printFields (write)
	return printDescription(p1) .. ("type %s"):format(p1.name) .. printImplementedInterfaces(p1) .. printFields(p1)
end

printInterface = function(p1)
	-- upvalues: printDescription (write), printImplementedInterfaces (ref), printFields (write)
	return printDescription(p1) .. ("interface %s"):format(p1.name) .. printImplementedInterfaces(p1) .. printFields(p1)
end

printUnion = function(p1)
	-- upvalues: array (ref), printDescription (write)
	local types = p1:getTypes()
	
	return printDescription(p1) .. "union " .. p18.name .. (if #types > 0 then " = " .. array.join(types, " | ") else "")
end

printEnum = function(p1)
	-- upvalues: array (ref), printDescription (write), printDeprecated (write), printBlock (write)
	return printDescription(p1) .. ("enum %s"):format(p1.name) .. printBlock(array.map(p1:getValues(), function(p2, p3)
		-- upvalues: printDescription (copy), printDeprecated (copy)
		return printDescription(p2, "  ", p3 == 1) .. "  " .. p20.name .. printDeprecated(p2.deprecationReason)
	end))
end

printInputObject = function(p1)
	-- upvalues: array (ref), printDescription (write), printInputValue (write), printBlock (write)
	return printDescription(p1) .. ("input %s"):format(p1.name) .. printBlock(array.map(p1:getFields():values(), function(p2, p3)
		-- upvalues: printDescription (copy), printInputValue (copy)
		return printDescription(p2, "  ", p3 == 1) .. "  " .. printInputValue(p2)
	end))
end

printFields = function(p1)
	-- upvalues: array (ref), printDescription (write), printArgs (write), printDeprecated (write), printBlock (write)
	return printBlock(array.map(p1:getFields():values(), function(p2, p3)
		-- upvalues: printDescription (copy), printArgs (copy), printDeprecated (copy)
		return printDescription(p2, "  ", p3 == 1) .. "  " .. p26.name .. printArgs(p2.args, "  ") .. ": " .. tostring(p2.type) .. printDeprecated(p2.deprecationReason)
	end))
end

printBlock = function(p1)
	-- upvalues: array (ref)
	return if #p1 == 0 then "" else " {\n" .. array.join(p1, "\n") .. "\n}"
end

printArgs = function(p1, p2)
	-- upvalues: array (ref), isNillish (ref), printInputValue (write), printDescription (write)
	local var1 = if p2 ~= nil then "" else p2
	
	return if #p1 == 0 then "" elseif array.every(p1, function(p3)
		-- upvalues: isNillish (copy)
		return isNillish(p3.description)
	end) then "(" .. array.join(array.map(p1, printInputValue), ", ") .. ")" else "(\n" .. array.join(array.map(p1, function(p3, p4)
		-- upvalues: printDescription (copy), var1 (ref), printInputValue (copy)
		return printDescription(p3, "  " .. var35, p4 == 1) .. "  " .. var35 .. printInputValue(p3)
	end), "\n") .. "\n" .. var35 .. ")"
end

printInputValue = function(p1)
	-- upvalues: astFromValue (ref), isNotNillish (ref), print (ref), printDeprecated (write)
	local var1 = astFromValue(p1.defaultValue, p1.type)
	local text = p1.name .. ": " .. tostring(p1.type)
	
	if isNotNillish(var1) then
		text ..= (" = %s"):format(print(var1))
	end
	return text .. printDeprecated(p1.deprecationReason)
end

printDirective = function(p1)
	-- upvalues: printDescription (write), printArgs (write), array (ref)
	return printDescription(p1) .. "directive @" .. p35.name .. printArgs(p1.args) .. (if p1.isRepeatable then " repeatable" else "") .. " on " .. array.join(p1.locations, " | ")
end

printDeprecated = function(p1)
	-- upvalues: isNillish (ref), astFromValue (ref), graphQLString (ref), DEFAULT_DEPRECATION_REASON (ref), print (ref)
	if isNillish(p1) then
		return ""
	end
	local var1 = astFromValue(p1, graphQLString)
	
	return if var1 and p1 ~= DEFAULT_DEPRECATION_REASON then " @deprecated(reason: " .. print(var1) .. ")" else " @deprecated"
end

printSpecifiedByUrl = function(p1)
	-- upvalues: isNillish (ref), astFromValue (ref), graphQLString (ref), invariant (ref), print (ref)
	if isNillish(p1.specifiedByUrl) then
		return ""
	end
	local var1 = astFromValue(p1.specifiedByUrl, graphQLString)
	invariant(var1, "Unexpected null value returned from `astFromValue` for specifiedByUrl")
	
	return " @specifiedBy(url: " .. print(var1) .. ")"
end

printDescription = function(p1, p2, p3)
	-- upvalues: isNillish (ref), printBlockString (ref), boolean (ref)
	local var1 = if p2 ~= nil then "" else p2
	local var2 = p3 ~= nil or p3
	local description = p1.description
	
	if isNillish(description) then
		return ""
	end
	local var3 = if boolean.toJSBoolean(var1) and not var2 then "\n" .. var40 else var1
	local replaced, _ = string.gsub(printBlockString(description, "", string.len(description) > 70), "\n", "\n" .. var40)
	
	return var3 .. replaced .. "\n"
end

return {
	printSchema = printSchema,
	printIntrospectionSchema = printIntrospectionSchema,
	printType = printType,
	NULL = NULL
}