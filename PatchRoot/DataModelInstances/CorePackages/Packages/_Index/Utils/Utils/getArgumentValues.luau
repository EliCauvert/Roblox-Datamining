-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local graphQLModule = require(parent.GraphQL)
local valueFromAST = graphQLModule.valueFromAST
local isNonNullType = graphQLModule.isNonNullType
local kind = graphQLModule.Kind
local print = graphQLModule.print
local createGraphQLError = require(script.Parent.errors).createGraphQLError
local inspect = require(script.Parent.inspect).inspect

function t.getArgumentValues(p0, p1, p2) --[[ line: 48 ]]
	-- upvalues: array (ref), object (ref), boolean (ref), isNonNullType (ref), createGraphQLError (ref), inspect (ref), kind (ref), valueFromAST (ref), print (ref)
	local var3 = if p2 ~= nil then {} else p2
	local var4 = array.reduce(object.entries(var3), function(p3, p4) --[[ line: 58 ]]
		-- upvalues: object (copy)
		local unpacked, unpacked_1 = table.unpack(p4, 1, 2)
		
		return object.assign({}, p3, { [tostring(unpacked)] = unpacked_1 })
	end, {})
	local t = {}
	local var6 = array.reduce(if p1.arguments ~= nil then {} else p1.arguments, function(p5, p6) --[[ line: 71 ]]
		-- upvalues: object (copy)
		return object.assign({}, p5, { [tostring(p6.name.value)] = p6 })
	end, {})
	
	for i, v in p0.args do
		local name = v.name
		local type = v.type
		local defaultValue = v.defaultValue
		local var7 = var6[tostring(name)]
		
		if not boolean.toJSBoolean(var7) then
			if defaultValue ~= nil then
				t[tostring(name)] = defaultValue
			elseif boolean.toJSBoolean(isNonNullType(type)) then
				error(createGraphQLError(("Argument \"%s\" of required type \"%s\" "):format(tostring(name), tostring(inspect(type))) .. "was not provided.", { nodes = { p1 } }))
			end
		end
		local value_1
		local value = var7.value
		local var8 = value.kind == kind.NULL
		
		if value.kind == kind.VARIABLE then
			value_1 = value.name.value
			
			if var3 ~= nil and var4[tostring(value_1)] ~= nil then
				var8 = var3[tostring(value_1)] == nil
			elseif defaultValue ~= nil then
				t[tostring(name)] = defaultValue
			elseif boolean.toJSBoolean(isNonNullType(type)) then
				error(createGraphQLError(("Argument \"%s\" of required type \"%s\" "):format(tostring(name), tostring(inspect(type))) .. ("was provided the variable \"$%s\" which was not provided a runtime value."):format(tostring(value_1)), { nodes = { value } }))
			end
		end
		if var8 and isNonNullType(type) then
			error(createGraphQLError(("Argument \"%s\" of non-null type \"%s\" "):format(tostring(name), tostring(inspect(type))) .. "must not be null.", { nodes = { value } }))
		end
		value_1 = valueFromAST(value, type, var3)
		
		if value_1 == nil then
			error(createGraphQLError(("Argument \"%s\" has invalid value %s."):format(tostring(name), tostring(print(value))), { nodes = { value } }))
		end
		t[tostring(name)] = value_1
	end
	return t
end

return t