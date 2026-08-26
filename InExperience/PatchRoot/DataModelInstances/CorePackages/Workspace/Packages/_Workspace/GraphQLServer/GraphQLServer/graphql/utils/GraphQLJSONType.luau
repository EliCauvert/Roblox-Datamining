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

local function _(p1, p2)
	return tonumber(p1, p2)
end

local function identity(p1)
	return p1
end

local function ensureObject(p1)
	-- upvalues: boolean (ref), array (ref), error (ref)
	if boolean.toJSBoolean(if typeof(p1) == "table" then if p1 ~= nil then array.isArray(p1) else true else true) then
		error(error.new(("JSONObject cannot represent non-object value: %s"):format(tostring(p1))))
	end
	return p1
end

local _ = function(p1, p2, p3)
	-- upvalues: array (ref), parseLiteral (write)
	local t = {}
	array.forEach(p2.fields, function(p4)
		-- upvalues: t (ref), parseLiteral (copy), p1 (ref), p3 (ref)
		t[p4.name.value] = parseLiteral(p1, p4.value, p3)
	end)
	
	return t
end

parseLiteral = function(p1, p2, p3)
	-- upvalues: kind (ref), array (ref), parseLiteral (write), boolean (ref), error (ref), print (ref)
	local kind_1 = p2.kind
	
	if kind_1 == kind.STRING or kind_1 == kind.BOOLEAN then
		return p2.value
	elseif kind_1 == kind.INT or kind_1 == kind.FLOAT then
		return tonumber(p2.value, nil)
	elseif kind_1 == kind.OBJECT then
		local t = {}
		array.forEach(p2.fields, function(p4)
			-- upvalues: t (ref), parseLiteral (copy), p1 (ref), p3 (ref)
			t[p4.name.value] = parseLiteral(p1, p4.value, p3)
		end)
		
		return t
	elseif kind_1 == kind.LIST then
		return array.map(p2.values, function(p4)
			-- upvalues: parseLiteral (copy), p1 (ref), p3 (ref)
			return parseLiteral(p1, p4, p3)
		end)
	elseif kind_1 == kind.NULL then
		return nil
	elseif kind_1 ~= kind.VARIABLE then
		error(error.new(("%s cannot represent value: %s"):format(p1, print(p2))))
		
		return nil
	end
	return if boolean.toJSBoolean(p3) then p3[p2.name.value] else nil
end

local var1 = graphQLScalarType.new({
	name = "JSON",
	description = "The `JSON` scalar type represents JSON values as specified by [ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).",
	specifiedByUrl = "http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf",
	serialize = identity,
	parseValue = identity,
	parseLiteral = function(p1, p2)
		-- upvalues: parseLiteral (write)
		return parseLiteral("JSON", p1, p2)
	end
})
t.GraphQLJSON = var1
t.default = var1
t.GraphQLJSONObject = graphQLScalarType.new({
	name = "JSONObject",
	description = "The `JSONObject` scalar type represents JSON objects as specified by [ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).",
	specifiedByUrl = "http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf",
	serialize = ensureObject,
	parseValue = ensureObject,
	parseLiteral = function(p1, p2)
		-- upvalues: kind (ref), error (ref), print (ref), array (ref), parseLiteral (write)
		if p1.kind ~= kind.OBJECT then
			error(error.new(("JSONObject cannot represent non-object value: %s"):format(print(p1))))
		end
		local t = {}
		local var2 = "JSONObject"
		array.forEach(p1.fields, function(p3)
			-- upvalues: t (ref), parseLiteral (copy), var2 (ref), p2 (ref)
			t[p3.name.value] = parseLiteral(var2, p3.value, p2)
		end)
		
		return t
	end
})

return t