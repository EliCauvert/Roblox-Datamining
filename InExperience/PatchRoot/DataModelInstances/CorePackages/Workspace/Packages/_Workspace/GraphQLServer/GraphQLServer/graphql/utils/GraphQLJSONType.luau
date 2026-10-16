local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local GraphQLModule = require(Parent.GraphQL)
local GraphQLScalarType = GraphQLModule.GraphQLScalarType
local Kind = GraphQLModule.Kind
local PrintFunction = GraphQLModule.print
local ParseLiteral = nil

local function _(p1, p2): number --[[ Line: 32 | Named "parseFloat" ]]
	return (tonumber(p1, p2))
end

local function identity(p1) --[[ Line: 36 ]]
	return p1
end

local function ensureObject(p1) --[[ Line: 40 ]]
	-- upvalues: Boolean (copy), Array (copy), Error1 (copy)
	if Boolean.toJSBoolean(typeof(p1) ~= "table" or (p1 == nil or Array.isArray(p1))) then
		error(Error1.new(("JSONObject cannot represent non-object value: %s"):format((tostring(p1)))))
	end
	return p1
end

local _ = function(p1, p2, p3) --[[ Line: 47 | Named "parseObject" ]]
	-- upvalues: Array (copy), ParseLiteral (ref)
	local t = {}
	Array.forEach(p2.fields, function(p4) --[[ Line: 49 ]]
		-- upvalues: t (copy), ParseLiteral (upval), p1 (copy), p3 (copy)
		t[p4.name.value] = ParseLiteral(p1, p4.value, p3)
	end)
	
	return t
end

ParseLiteral = function(p1, p2, p3) --[[ Line: 56 | Named "parseLiteral" ]]
	-- upvalues: Kind (copy), Array (copy), ParseLiteral (ref), Boolean (copy), Error1 (copy), PrintFunction (copy)
	local Kind1 = p2.kind
	
	if Kind1 == Kind.STRING or Kind1 == Kind.BOOLEAN then
		return p2.value
	elseif Kind1 == Kind.INT or Kind1 == Kind.FLOAT then
		return (tonumber(p2.value, nil))
	elseif Kind1 == Kind.OBJECT then
		local t = {}
		Array.forEach(p2.fields, function(p4) --[[ Line: 49 ]]
			-- upvalues: t (copy), ParseLiteral (upval), p1 (copy), p3 (copy)
			t[p4.name.value] = ParseLiteral(p1, p4.value, p3)
		end)
		
		return t
	elseif Kind1 == Kind.LIST then
		return Array.map(p2.values, function(p4) --[[ Line: 65 ]]
			-- upvalues: ParseLiteral (upval), p1 (copy), p3 (copy)
			return ParseLiteral(p1, p4, p3)
		end)
	elseif Kind1 == Kind.NULL then
		return nil
	elseif Kind1 == Kind.VARIABLE then
		return if Boolean.toJSBoolean(p3) then p3[p2.name.value] else nil
	else
		error(Error1.new(("%s cannot represent value: %s"):format(p1, PrintFunction(p2))))
		
		return nil
	end
end

local JSON = GraphQLScalarType.new({
	name = "JSON",
	description = "The `JSON` scalar type represents JSON values as specified by [ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).",
	specifiedByUrl = "http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf",
	serialize = identity,
	parseValue = identity,
	parseLiteral = function(p1, p2) --[[ Line: 86 ]]
		-- upvalues: ParseLiteral (ref)
		return ParseLiteral("JSON", p1, p2)
	end
})

return {
	GraphQLJSON = JSON,
	default = JSON,
	GraphQLJSONObject = GraphQLScalarType.new({
		name = "JSONObject",
		description = "The `JSONObject` scalar type represents JSON objects as specified by [ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).",
		specifiedByUrl = "http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf",
		serialize = ensureObject,
		parseValue = ensureObject,
		parseLiteral = function(p1, p2) --[[ Line: 99 ]]
			-- upvalues: Kind (copy), Error1 (copy), PrintFunction (copy), Array (copy), ParseLiteral (ref)
			if p1.kind ~= Kind.OBJECT then
				error(Error1.new(("JSONObject cannot represent non-object value: %s"):format(PrintFunction(p1))))
			end
			local t = {}
			local v1 = "JSONObject"
			Array.forEach(p1.fields, function(p3) --[[ Line: 49 ]]
				-- upvalues: t (copy), ParseLiteral (upval), v1 (copy), p2 (copy)
				t[p3.name.value] = ParseLiteral(v1, p3.value, p2)
			end)
			
			return t
		end
	})
}