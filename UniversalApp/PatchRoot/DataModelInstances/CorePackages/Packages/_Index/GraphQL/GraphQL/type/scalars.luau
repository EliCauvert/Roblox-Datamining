local function _(p1, p2): number
	return (tonumber(p1, p2))
end

local _ = function(p1): boolean
	return typeof(p1) == "number" and (p1 ~= 1e999 and p1 == p1)
end

local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Number = LuauPolyfillModule.Number
local Object = LuauPolyfillModule.Object
local _ = require(script.Parent.Parent.language.ast)
local InspectFunction = require(script.Parent.Parent.jsutils.inspect).inspect
local IsObjectLikeFunction = require(script.Parent.Parent.jsutils.isObjectLike).isObjectLike
local Kind = require(script.Parent.Parent.language.kinds).Kind
local PrintFunction = require(script.Parent.Parent.language.printer).print
local GraphQLError = require(script.Parent.Parent.error.GraphQLError).GraphQLError
local GraphQLScalarType = require(script.Parent.definition).GraphQLScalarType
local Callback = nil

function serializeInt(p1)
	-- upvalues: Callback (ref), Number (copy), GraphQLError (copy), InspectFunction (copy)
	local CallbackResult = Callback(p1)
	
	if typeof(CallbackResult) == "boolean" then
		return if CallbackResult then 1 else 0
	end
	local Number1 = if typeof(CallbackResult) == "string" and CallbackResult ~= "" then tonumber(CallbackResult) else CallbackResult
	
	if typeof(Number1) ~= "number" or not Number.isInteger(Number1) then
		error(GraphQLError.new(("Int cannot represent non-integer value: %s"):format(InspectFunction(CallbackResult))))
	end
	if Number1 > 2147483647 or Number1 < -2147483648 then
		error(GraphQLError.new("Int cannot represent non 32-bit signed integer value: " .. InspectFunction(CallbackResult)))
	end
	return Number1
end

function coerceInt(p1: number): number
	-- upvalues: Number (copy), GraphQLError (copy), InspectFunction (copy)
	if typeof(p1) ~= "number" or not Number.isInteger(p1) then
		error(GraphQLError.new(("Int cannot represent non-integer value: %s"):format(InspectFunction(p1))))
	end
	if p1 > 2147483647 or p1 < -2147483648 then
		error(GraphQLError.new(("Int cannot represent non 32-bit signed integer value: %s"):format(p1)))
	end
	return p1
end

local Int = GraphQLScalarType.new({
	name = "Int",
	description = "The `Int` scalar type represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.",
	serialize = serializeInt,
	parseValue = coerceInt,
	parseLiteral = function(p1): number
		-- upvalues: Kind (copy), GraphQLError (copy), PrintFunction (copy)
		if p1.kind ~= Kind.INT then
			error(GraphQLError.new(("Int cannot represent non-integer value: %s"):format(PrintFunction(p1)), p1))
		end
		local Number: number? = tonumber(p1.value, 10)
		
		if Number > 2147483647 or Number < -2147483648 then
			error(GraphQLError.new(("Int cannot represent non 32-bit signed integer value: %s"):format(p1.value), p1))
		end
		return Number
	end
})

local function serializeFloat(p1)
	-- upvalues: Callback (ref), GraphQLError (copy), InspectFunction (copy)
	local CallbackResult = Callback(p1)
	
	if typeof(CallbackResult) == "boolean" then
		return if CallbackResult then 1 else 0
	end
	local Number = if typeof(CallbackResult) == "string" and CallbackResult ~= "" then tonumber(CallbackResult) else CallbackResult
	
	if typeof(Number) ~= "number" or (typeof(Number) ~= "number" or (Number == 1e999 or Number ~= Number)) then
		error(GraphQLError.new(("Float cannot represent non numeric value: %s"):format(InspectFunction(CallbackResult))))
	end
	return Number
end

function coerceFloat(p1: number)
	-- upvalues: GraphQLError (copy), InspectFunction (copy)
	if typeof(p1) ~= "number" or (typeof(p1) ~= "number" or (p1 == 1e999 or p1 ~= p1)) then
		error(GraphQLError.new(("Float cannot represent non numeric value: %s"):format(InspectFunction(p1))))
	end
	return p1
end

local Float = GraphQLScalarType.new({
	name = "Float",
	description = "The `Float` scalar type represents signed double-precision fractional values as specified by [IEEE 754](https://en.wikipedia.org/wiki/IEEE_floating_point).",
	serialize = serializeFloat,
	parseValue = coerceFloat,
	parseLiteral = function(p1): number
		-- upvalues: Kind (copy), GraphQLError (copy), PrintFunction (copy)
		if p1.kind ~= Kind.FLOAT and p1.kind ~= Kind.INT then
			error(GraphQLError.new(("Float cannot represent non numeric value: %s"):format(PrintFunction(p1)), p1))
		end
		return (tonumber(p1.value, nil))
	end
})

Callback = function(p1)
	-- upvalues: IsObjectLikeFunction (copy)
	if IsObjectLikeFunction(p1) then
		if typeof(p1.valueOf) == "function" then
			local ValueOfResult = p1:valueOf()
			
			if not IsObjectLikeFunction(ValueOfResult) then
				return ValueOfResult
			end
		end
		if typeof(p1.toJSON) == "function" then
			return p1:toJSON()
		end
	end
	return p1
end

local function serializeString(p1)
	-- upvalues: Callback (ref), GraphQLError (copy), InspectFunction (copy)
	local CallbackResult = Callback(p1)
	
	if typeof(CallbackResult) == "string" then
		return CallbackResult
	elseif typeof(CallbackResult) == "boolean" then
		return if CallbackResult then "true" else "false"
	elseif typeof(CallbackResult) == "number" and (typeof(CallbackResult) == "number" and (CallbackResult ~= 1e999 and CallbackResult == CallbackResult)) then
		return (tostring(CallbackResult))
	else
		error(GraphQLError.new(("String cannot represent value: %s"):format(InspectFunction(p1))))
	end
end

function coerceString(p1: string)
	-- upvalues: GraphQLError (copy), InspectFunction (copy)
	if typeof(p1) ~= "string" then
		error(GraphQLError.new(("String cannot represent a non string value: %s"):format(InspectFunction(p1))))
	end
	return p1
end

local String = GraphQLScalarType.new({
	name = "String",
	description = "The `String` scalar type represents textual data, represented as UTF-8 character sequences. The String type is most often used by GraphQL to represent free-form human-readable text.",
	serialize = serializeString,
	parseValue = coerceString,
	parseLiteral = function(p1)
		-- upvalues: Kind (copy), GraphQLError (copy), PrintFunction (copy)
		if p1.kind ~= Kind.STRING then
			error(GraphQLError.new(("String cannot represent a non string value: %s"):format(PrintFunction(p1)), p1))
		end
		return p1.value
	end
})

local function serializeBoolean(p1)
	-- upvalues: Callback (ref), GraphQLError (copy), InspectFunction (copy)
	local CallbackResult = Callback(p1)
	
	if typeof(CallbackResult) == "boolean" then
		return CallbackResult
	elseif typeof(CallbackResult) == "number" and (CallbackResult ~= 1e999 and CallbackResult == CallbackResult) then
		return CallbackResult ~= 0
	else
		error(GraphQLError.new(("Boolean cannot represent a non boolean value: %s"):format(InspectFunction(CallbackResult))))
	end
end

function coerceBoolean(p1: boolean)
	-- upvalues: GraphQLError (copy), InspectFunction (copy)
	if typeof(p1) ~= "boolean" then
		error(GraphQLError.new(("Boolean cannot represent a non boolean value: %s"):format(InspectFunction(p1))))
	end
	return p1
end

local Boolean = GraphQLScalarType.new({
	name = "Boolean",
	description = "The `Boolean` scalar type represents `true` or `false`.",
	serialize = serializeBoolean,
	parseValue = coerceBoolean,
	parseLiteral = function(p1)
		-- upvalues: Kind (copy), GraphQLError (copy), PrintFunction (copy)
		if p1.kind ~= Kind.BOOLEAN then
			error(GraphQLError.new(("Boolean cannot represent a non boolean value: %s"):format(PrintFunction(p1)), p1))
		end
		return p1.value
	end
})

local function serializeID(p1)
	-- upvalues: Callback (ref), Number (copy), GraphQLError (copy), InspectFunction (copy)
	local CallbackResult = Callback(p1)
	
	if typeof(CallbackResult) == "string" then
		return CallbackResult
	elseif Number.isInteger(CallbackResult) then
		return (tostring(CallbackResult))
	else
		error(GraphQLError.new(("ID cannot represent value: %s"):format(InspectFunction(p1))))
	end
end

function coerceID(p1)
	-- upvalues: Number (copy), GraphQLError (copy), InspectFunction (copy)
	if typeof(p1) == "string" then
		return p1
	elseif typeof(p1) == "number" and Number.isInteger(p1) then
		return (tostring(p1))
	else
		error(GraphQLError.new(("ID cannot represent value: %s"):format(InspectFunction(p1))))
	end
end

local ID = GraphQLScalarType.new({
	name = "ID",
	description = "The `ID` scalar type represents a unique identifier, often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `\"4\"`) or integer (such as `4`) input value will be accepted as an ID.",
	serialize = serializeID,
	parseValue = coerceID,
	parseLiteral = function(p1)
		-- upvalues: Kind (copy), GraphQLError (copy), PrintFunction (copy)
		if p1.kind ~= Kind.STRING and p1.kind ~= Kind.INT then
			error(GraphQLError.new("ID cannot represent a non-string and non-integer value: " .. PrintFunction(p1), p1))
		end
		return p1.value
	end
})
local FreezeResult = Object.freeze({
	String,
	Int,
	Float,
	Boolean,
	ID
})

return {
	GraphQLInt = Int,
	GraphQLFloat = Float,
	GraphQLString = String,
	GraphQLBoolean = Boolean,
	GraphQLID = ID,
	specifiedScalarTypes = FreezeResult,
	isSpecifiedScalarType = function(p1)
		-- upvalues: Array (copy), FreezeResult (copy)
		return Array.some(FreezeResult, function(p2): boolean
			-- upvalues: p1 (copy)
			return p1.name == p2.name
		end)
	end
}