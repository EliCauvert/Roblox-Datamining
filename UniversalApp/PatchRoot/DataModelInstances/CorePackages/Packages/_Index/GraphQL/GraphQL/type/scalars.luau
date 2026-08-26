local function _(p1, p2)
	return tonumber(p1, p2)
end

local _ = function(p1)
	return typeof(p1) == "number" and (p1 ~= 1e999 and p1 == p1)
end

local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local number = luauPolyfillModule.Number
local object = luauPolyfillModule.Object
local _ = require(script.Parent.Parent.language.ast)
local inspect = require(script.Parent.Parent.jsutils.inspect).inspect
local isObjectLike = require(script.Parent.Parent.jsutils.isObjectLike).isObjectLike
local kind = require(script.Parent.Parent.language.kinds).Kind
local print = require(script.Parent.Parent.language.printer).print
local graphQLError = require(script.Parent.Parent.error.GraphQLError).GraphQLError
local graphQLScalarType = require(script.Parent.definition).GraphQLScalarType
local serializeObject = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil

function serializeInt(p1)
	-- upvalues: serializeObject (write), number (ref), graphQLError (ref), inspect (ref)
	local var1 = serializeObject(p1)
	
	if typeof(var1) == "boolean" then
		return if var1 then 1 else 0
	end
	local var2 = if typeof(var1) == "string" and var1 ~= "" then tonumber(var1) else var1
	
	if typeof(var2) ~= "number" or not number.isInteger(var2) then
		error(graphQLError.new(("Int cannot represent non-integer value: %s"):format(inspect(var1))))
	end
	if var2 > 2147483647 or var2 < -2147483648 then
		error(graphQLError.new("Int cannot represent non 32-bit signed integer value: " .. inspect(var1)))
	end
	return var2
end

function coerceInt(p1)
	-- upvalues: number (ref), graphQLError (ref), inspect (ref)
	if typeof(p1) ~= "number" or not number.isInteger(p1) then
		error(graphQLError.new(("Int cannot represent non-integer value: %s"):format(inspect(p1))))
	end
	if p1 > 2147483647 or p1 < -2147483648 then
		error(graphQLError.new(("Int cannot represent non 32-bit signed integer value: %s"):format(p1)))
	end
	return p1
end

local var1 = graphQLScalarType.new({
	name = "Int",
	description = "The `Int` scalar type represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.",
	serialize = serializeInt,
	parseValue = coerceInt,
	parseLiteral = function(p1)
		-- upvalues: kind (ref), graphQLError (ref), print (ref)
		if p1.kind ~= kind.INT then
			error(graphQLError.new(("Int cannot represent non-integer value: %s"):format(print(p1)), p1))
		end
		local var2 = tonumber(p1.value, 10)
		
		if var2 > 2147483647 or var2 < -2147483648 then
			error(graphQLError.new(("Int cannot represent non 32-bit signed integer value: %s"):format(p1.value), p1))
		end
		return var2
	end
})

local function serializeFloat(p1)
	-- upvalues: serializeObject (write), graphQLError (ref), inspect (ref)
	local var2 = serializeObject(p1)
	
	if typeof(var2) == "boolean" then
		return if var2 then 1 else 0
	end
	local var3 = if typeof(var2) == "string" and var2 ~= "" then tonumber(var2) else var2
	
	if typeof(var3) == "number" then
		local var4 = var3
		
		if not (typeof(var4) == "number" and (var4 ~= 1e999 and var4 == var4)) then
			error(graphQLError.new(("Float cannot represent non numeric value: %s"):format(inspect(var2))))
		end
		return var3
	end
end

function coerceFloat(p1)
	-- upvalues: graphQLError (ref), inspect (ref)
	if typeof(p1) == "number" then
		if not (typeof(p1) == "number" and (p1 ~= 1e999 and p1 == p1)) then
			error(graphQLError.new(("Float cannot represent non numeric value: %s"):format(inspect(p1))))
		end
		return p1
	end
end

local var2 = graphQLScalarType.new({
	name = "Float",
	description = "The `Float` scalar type represents signed double-precision fractional values as specified by [IEEE 754](https://en.wikipedia.org/wiki/IEEE_floating_point).",
	serialize = serializeFloat,
	parseValue = coerceFloat,
	parseLiteral = function(p1)
		-- upvalues: kind (ref), graphQLError (ref), print (ref)
		if p1.kind ~= kind.FLOAT and p1.kind ~= kind.INT then
			error(graphQLError.new(("Float cannot represent non numeric value: %s"):format(print(p1)), p1))
		end
		return tonumber(p1.value, nil)
	end
})

serializeObject = function(p1)
	-- upvalues: isObjectLike (ref)
	if isObjectLike(p1) then
		if typeof(p1.valueOf) == "function" then
			local var3 = p1:valueOf()
			
			return if isObjectLike(var3) then if typeof(p1.toJSON) == "function" then p1:toJSON() else p1 else var3
		end
	end
end

local function serializeString(p1)
	-- upvalues: serializeObject (write), graphQLError (ref), inspect (ref)
	local var3 = serializeObject(p1)
	
	if typeof(var3) == "string" then
		return var3
	elseif typeof(var3) == "boolean" then
		return if var3 then "true" else "false"
	elseif typeof(var3) == "number" then
		if typeof(var3) == "number" and (var3 ~= 1e999 and var3 == var3) then
			return tostring(var3)
		end
	end
	error(graphQLError.new(("String cannot represent value: %s"):format(inspect(p1))))
end

function coerceString(p1)
	-- upvalues: graphQLError (ref), inspect (ref)
	if typeof(p1) ~= "string" then
		error(graphQLError.new(("String cannot represent a non string value: %s"):format(inspect(p1))))
	end
	return p1
end

local var3 = graphQLScalarType.new({
	name = "String",
	description = "The `String` scalar type represents textual data, represented as UTF-8 character sequences. The String type is most often used by GraphQL to represent free-form human-readable text.",
	serialize = serializeString,
	parseValue = coerceString,
	parseLiteral = function(p1)
		-- upvalues: kind (ref), graphQLError (ref), print (ref)
		if p1.kind ~= kind.STRING then
			error(graphQLError.new(("String cannot represent a non string value: %s"):format(print(p1)), p1))
		end
		return p1.value
	end
})

local function serializeBoolean(p1)
	-- upvalues: serializeObject (write), graphQLError (ref), inspect (ref)
	local var4 = serializeObject(p1)
	
	if typeof(var4) == "boolean" then
		return var4
	elseif typeof(var4) == "number" and (var4 ~= 1e999 and var4 == var4) then
		return var4 ~= 0
	end
	error(graphQLError.new(("Boolean cannot represent a non boolean value: %s"):format(inspect(var4))))
end

function coerceBoolean(p1)
	-- upvalues: graphQLError (ref), inspect (ref)
	if typeof(p1) ~= "boolean" then
		error(graphQLError.new(("Boolean cannot represent a non boolean value: %s"):format(inspect(p1))))
	end
	return p1
end

local var4 = graphQLScalarType.new({
	name = "Boolean",
	description = "The `Boolean` scalar type represents `true` or `false`.",
	serialize = serializeBoolean,
	parseValue = coerceBoolean,
	parseLiteral = function(p1)
		-- upvalues: kind (ref), graphQLError (ref), print (ref)
		if p1.kind ~= kind.BOOLEAN then
			error(graphQLError.new(("Boolean cannot represent a non boolean value: %s"):format(print(p1)), p1))
		end
		return p1.value
	end
})

local function serializeID(p1)
	-- upvalues: serializeObject (write), number (ref), graphQLError (ref), inspect (ref)
	local var5 = serializeObject(p1)
	
	if typeof(var5) == "string" then
		return var5
	elseif number.isInteger(var5) then
		return tostring(var5)
	end
	error(graphQLError.new(("ID cannot represent value: %s"):format(inspect(p1))))
end

function coerceID(p1)
	-- upvalues: number (ref), graphQLError (ref), inspect (ref)
	if typeof(p1) == "string" then
		return p1
	elseif typeof(p1) == "number" and number.isInteger(p1) then
		return tostring(p1)
	end
	error(graphQLError.new(("ID cannot represent value: %s"):format(inspect(p1))))
end

local var5 = graphQLScalarType.new({
	name = "ID",
	description = "The `ID` scalar type represents a unique identifier, often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `\"4\"`) or integer (such as `4`) input value will be accepted as an ID.",
	serialize = serializeID,
	parseValue = coerceID,
	parseLiteral = function(p1)
		-- upvalues: kind (ref), graphQLError (ref), print (ref)
		if p1.kind ~= kind.STRING and p1.kind ~= kind.INT then
			error(graphQLError.new("ID cannot represent a non-string and non-integer value: " .. print(p1), p1))
		end
		return p1.value
	end
})
local var6 = object.freeze({
	var3,
	var1,
	var2,
	var4,
	var5
})

return {
	GraphQLInt = var1,
	GraphQLFloat = var2,
	GraphQLString = var3,
	GraphQLBoolean = var4,
	GraphQLID = var5,
	specifiedScalarTypes = var6,
	isSpecifiedScalarType = function(p1)
		-- upvalues: array (ref), var6 (ref)
		return array.some(var6, function(p2)
			-- upvalues: p1 (ref)
			return p1.name == p2.name
		end)
	end
}