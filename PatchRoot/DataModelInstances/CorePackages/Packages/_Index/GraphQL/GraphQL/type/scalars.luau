-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:37 2026 Pacific Standard Time.

local function _(p0, p1) --[[ line: 8 | named "parseInt" ]]
	return tonumber(p0, p1)
end

local _ = function(p2) --[[ line: 11 | named "NumberisFinite" ]]
	return typeof(p2) == "number" and (p2 ~= 1e999 and p2 == p2)
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

function serializeInt(p3) --[[ line: 55 ]]
	-- upvalues: serializeObject (write), number (ref), graphQLError (ref), inspect (ref)
	local var12 = serializeObject(p3)
	
	if typeof(var12) == "boolean" then
		return if var12 then 1 else 0
	end
	local var13 = if typeof(var12) == "string" and var12 ~= "" then tonumber(var12) else var12
	
	if typeof(var13) ~= "number" or not number.isInteger(var13) then
		error(graphQLError.new(("Int cannot represent non-integer value: %s"):format(inspect(var12))))
	end
	if var13 > 2147483647 or var13 < -2147483648 then
		error(graphQLError.new("Int cannot represent non 32-bit signed integer value: " .. inspect(var12)))
	end
	return var13
end

function coerceInt(p4) --[[ line: 84 ]]
	-- upvalues: number (ref), graphQLError (ref), inspect (ref)
	if typeof(p4) ~= "number" or not number.isInteger(p4) then
		error(graphQLError.new(("Int cannot represent non-integer value: %s"):format(inspect(p4))))
	end
	if p4 > 2147483647 or p4 < -2147483648 then
		error(graphQLError.new(("Int cannot represent non 32-bit signed integer value: %s"):format(p4)))
	end
	return p4
end

local var2 = graphQLScalarType.new({
	name = "Int",
	description = "The `Int` scalar type represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.",
	serialize = serializeInt,
	parseValue = coerceInt,
	parseLiteral = function(p5) --[[ line: 110 ]]
		-- upvalues: kind (ref), graphQLError (ref), print (ref)
		if p5.kind ~= kind.INT then
			error(graphQLError.new(("Int cannot represent non-integer value: %s"):format(print(p5)), p5))
		end
		local var14 = tonumber(p5.value, 10)
		
		if var14 > 2147483647 or var14 < -2147483648 then
			error(graphQLError.new(("Int cannot represent non 32-bit signed integer value: %s"):format(p5.value), p5))
		end
		return var14
	end
})

local function serializeFloat(p6) --[[ line: 139 ]]
	-- upvalues: serializeObject (write), graphQLError (ref), inspect (ref)
	local var15 = serializeObject(p6)
	
	if typeof(var15) == "boolean" then
		return if var15 then 1 else 0
	end
	local var16 = if typeof(var15) == "string" and var15 ~= "" then tonumber(var15) else var15
	
	if typeof(var16) == "number" then
		local var17 = var16
		
		if not (typeof(var17) == "number" and (var17 ~= 1e999 and var17 == var17)) then
			error(graphQLError.new(("Float cannot represent non numeric value: %s"):format(inspect(var15))))
		end
		return var16
	end
end

function coerceFloat(p7) --[[ line: 161 ]]
	-- upvalues: graphQLError (ref), inspect (ref)
	if typeof(p7) == "number" then
		if not (typeof(p7) == "number" and (p7 ~= 1e999 and p7 == p7)) then
			error(graphQLError.new(("Float cannot represent non numeric value: %s"):format(inspect(p7))))
		end
		return p7
	end
end

local var4 = graphQLScalarType.new({
	name = "Float",
	description = "The `Float` scalar type represents signed double-precision fractional values as specified by [IEEE 754](https://en.wikipedia.org/wiki/IEEE_floating_point).",
	serialize = serializeFloat,
	parseValue = coerceFloat,
	parseLiteral = function(p8) --[[ line: 178 ]]
		-- upvalues: kind (ref), graphQLError (ref), print (ref)
		if p8.kind ~= kind.FLOAT and p8.kind ~= kind.INT then
			error(graphQLError.new(("Float cannot represent non numeric value: %s"):format(print(p8)), p8))
		end
		return tonumber(p8.value, nil)
	end
})

serializeObject = function(p9) --[[ line: 197 | named "serializeObject" ]]
	-- upvalues: isObjectLike (ref)
	if isObjectLike(p9) then
		if typeof(p9.valueOf) == "function" then
			local var18 = p9:valueOf()
			
			return if isObjectLike(var18) then if typeof(p9.toJSON) == "function" then p9:toJSON() else p9 else var18
		end
	end
end

local function serializeString(p10) --[[ line: 214 ]]
	-- upvalues: serializeObject (write), graphQLError (ref), inspect (ref)
	local var19 = serializeObject(p10)
	
	if typeof(var19) == "string" then
		return var19
	elseif typeof(var19) == "boolean" then
		return if var19 then "true" else "false"
	elseif typeof(var19) == "number" then
		if typeof(var19) == "number" and (var19 ~= 1e999 and var19 == var19) then
			return tostring(var19)
		end
	end
	error(graphQLError.new(("String cannot represent value: %s"):format(inspect(p10))))
end

function coerceString(p11) --[[ line: 231 ]]
	-- upvalues: graphQLError (ref), inspect (ref)
	if typeof(p11) ~= "string" then
		error(graphQLError.new(("String cannot represent a non string value: %s"):format(inspect(p11))))
	end
	return p11
end

local var6 = graphQLScalarType.new({
	name = "String",
	description = "The `String` scalar type represents textual data, represented as UTF-8 character sequences. The String type is most often used by GraphQL to represent free-form human-readable text.",
	serialize = serializeString,
	parseValue = coerceString,
	parseLiteral = function(p12) --[[ line: 248 ]]
		-- upvalues: kind (ref), graphQLError (ref), print (ref)
		if p12.kind ~= kind.STRING then
			error(graphQLError.new(("String cannot represent a non string value: %s"):format(print(p12)), p12))
		end
		return p12.value
	end
})

local function serializeBoolean(p13) --[[ line: 263 ]]
	-- upvalues: serializeObject (write), graphQLError (ref), inspect (ref)
	local var20 = serializeObject(p13)
	
	if typeof(var20) == "boolean" then
		return var20
	elseif typeof(var20) == "number" and (var20 ~= 1e999 and var20 == var20) then
		return var20 ~= 0
	end
	error(graphQLError.new(("Boolean cannot represent a non boolean value: %s"):format(inspect(var20))))
end

function coerceBoolean(p14) --[[ line: 281 ]]
	-- upvalues: graphQLError (ref), inspect (ref)
	if typeof(p14) ~= "boolean" then
		error(graphQLError.new(("Boolean cannot represent a non boolean value: %s"):format(inspect(p14))))
	end
	return p14
end

local var8 = graphQLScalarType.new({
	name = "Boolean",
	description = "The `Boolean` scalar type represents `true` or `false`.",
	serialize = serializeBoolean,
	parseValue = coerceBoolean,
	parseLiteral = function(p15) --[[ line: 298 ]]
		-- upvalues: kind (ref), graphQLError (ref), print (ref)
		if p15.kind ~= kind.BOOLEAN then
			error(graphQLError.new(("Boolean cannot represent a non boolean value: %s"):format(print(p15)), p15))
		end
		return p15.value
	end
})

local function serializeID(p16) --[[ line: 313 ]]
	-- upvalues: serializeObject (write), number (ref), graphQLError (ref), inspect (ref)
	local var21 = serializeObject(p16)
	
	if typeof(var21) == "string" then
		return var21
	elseif number.isInteger(var21) then
		return tostring(var21)
	end
	error(graphQLError.new(("ID cannot represent value: %s"):format(inspect(p16))))
end

function coerceID(p17) --[[ line: 326 ]]
	-- upvalues: number (ref), graphQLError (ref), inspect (ref)
	if typeof(p17) == "string" then
		return p17
	elseif typeof(p17) == "number" and number.isInteger(p17) then
		return tostring(p17)
	end
	error(graphQLError.new(("ID cannot represent value: %s"):format(inspect(p17))))
end

local var10 = graphQLScalarType.new({
	name = "ID",
	description = "The `ID` scalar type represents a unique identifier, often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `\"4\"`) or integer (such as `4`) input value will be accepted as an ID.",
	serialize = serializeID,
	parseValue = coerceID,
	parseLiteral = function(p18) --[[ line: 342 ]]
		-- upvalues: kind (ref), graphQLError (ref), print (ref)
		if p18.kind ~= kind.STRING and p18.kind ~= kind.INT then
			error(graphQLError.new("ID cannot represent a non-string and non-integer value: " .. print(p18), p18))
		end
		return p18.value
	end
})
local var11 = object.freeze({
	var6,
	var2,
	var4,
	var8,
	var10
})

return {
	GraphQLInt = var2,
	GraphQLFloat = var4,
	GraphQLString = var6,
	GraphQLBoolean = var8,
	GraphQLID = var10,
	specifiedScalarTypes = var11,
	isSpecifiedScalarType = function(p19) --[[ line: 364 ]]
		-- upvalues: array (ref), var11 (ref)
		return array.some(var11, function(p20) --[[ line: 365 ]]
			-- upvalues: p19 (ref)
			return p19.name == p20.name
		end)
	end
}