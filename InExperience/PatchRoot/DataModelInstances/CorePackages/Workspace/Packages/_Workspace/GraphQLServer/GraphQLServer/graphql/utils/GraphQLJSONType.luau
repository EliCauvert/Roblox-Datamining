local parent = script:FindFirstAncestor("GraphQLServer").Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local t = {}
local graphQLModule = require(parent.GraphQL)
local graphQLScalarType = graphQLModule.GraphQLScalarType
local kind = graphQLModule.Kind
local print = graphQLModule.print
local parseLiteral = nil

local function _(p0, p1) --[[ line: 32 | named "parseFloat" ]]
	return tonumber(p0, p1)
end

local function identity(p2) --[[ line: 36 ]]
	return p2
end

local function ensureObject(p3) --[[ line: 40 ]]
	-- upvalues: boolean (ref), array (ref), error (ref)
	if boolean.toJSBoolean(if typeof(p3) == "table" then if p3 ~= nil then array.isArray(p3) else true else true) then
		error(error.new(("JSONObject cannot represent non-object value: %s"):format(tostring(p3))))
	end
	return p3
end

local _ = function(p4, p5, p6) --[[ line: 47 | named "parseObject" ]]
	-- upvalues: array (ref), parseLiteral (write)
	local t = {}
	array.forEach(p5.fields, function(p7) --[[ line: 49 ]]
		-- upvalues: t (ref), parseLiteral (copy), p4 (ref), p6 (ref)
		t[p7.name.value] = parseLiteral(p4, p7.value, p6)
	end)
	
	return t
end

parseLiteral = function(p8, p9, p10) --[[ line: 56 | named "parseLiteral" ]]
	-- upvalues: kind (ref), array (ref), parseLiteral (write), boolean (ref), error (ref), print (ref)
	local kind_1 = p9.kind
	
	if kind_1 == kind.STRING or kind_1 == kind.BOOLEAN then
		return p9.value
	elseif kind_1 == kind.INT or kind_1 == kind.FLOAT then
		return tonumber(p9.value, nil)
	elseif kind_1 == kind.OBJECT then
		local t = {}
		array.forEach(p9.fields, function(p11) --[[ line: 49 ]]
			-- upvalues: t (ref), parseLiteral (copy), p8 (ref), p10 (ref)
			t[p11.name.value] = parseLiteral(p8, p11.value, p10)
		end)
		
		return t
	elseif kind_1 == kind.LIST then
		return array.map(p9.values, function(p12) --[[ line: 65 ]]
			-- upvalues: parseLiteral (copy), p8 (ref), p10 (ref)
			return parseLiteral(p8, p12, p10)
		end)
	elseif kind_1 == kind.NULL then
		return nil
	elseif kind_1 ~= kind.VARIABLE then
		error(error.new(("%s cannot represent value: %s"):format(p8, print(p9))))
		
		return nil
	end
	return if boolean.toJSBoolean(p10) then p10[p9.name.value] else nil
end

local var6 = graphQLScalarType.new({
	name = "JSON",
	description = "The `JSON` scalar type represents JSON values as specified by [ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).",
	specifiedByUrl = "http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf",
	serialize = identity,
	parseValue = identity,
	parseLiteral = function(p13, p14) --[[ line: 86 ]]
		-- upvalues: parseLiteral (write)
		return parseLiteral("JSON", p13, p14)
	end
})
t.GraphQLJSON = var6
t.default = var6
t.GraphQLJSONObject = graphQLScalarType.new({
	name = "JSONObject",
	description = "The `JSONObject` scalar type represents JSON objects as specified by [ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).",
	specifiedByUrl = "http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf",
	serialize = ensureObject,
	parseValue = ensureObject,
	parseLiteral = function(p15, p16) --[[ line: 99 ]]
		-- upvalues: kind (ref), error (ref), print (ref), array (ref), parseLiteral (write)
		if p15.kind ~= kind.OBJECT then
			error(error.new(("JSONObject cannot represent non-object value: %s"):format(print(p15))))
		end
		local t = {}
		local var10 = "JSONObject"
		array.forEach(p15.fields, function(p17) --[[ line: 49 ]]
			-- upvalues: t (ref), parseLiteral (copy), var10 (ref), p16 (ref)
			t[p17.name.value] = parseLiteral(var10, p17.value, p16)
		end)
		
		return t
	end
})

return t