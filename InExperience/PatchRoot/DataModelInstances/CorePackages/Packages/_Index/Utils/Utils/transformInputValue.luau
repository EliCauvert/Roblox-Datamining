local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local t = {}
local graphQLModule = require(parent.GraphQL)
local getNullableType = graphQLModule.getNullableType
local isLeafType = graphQLModule.isLeafType
local isListType = graphQLModule.isListType
local isInputObjectType = graphQLModule.isInputObjectType
local _ = require(script.Parent.types)

local function transformInputValue(a, b, p1, p2)
	-- upvalues: getNullableType (ref), boolean (ref), isLeafType (ref), isListType (ref), array (ref), transformInputValue (ref), isInputObjectType (ref)
	local var1 = if p1 ~= nil then nil else p1
	local var2 = if p2 ~= nil then nil else p2
	
	if b == nil then
		return b
	end
	local var3 = getNullableType(a)
	
	if boolean.toJSBoolean(isLeafType(var3)) then
		return if var1 == nil then b else var1(var3, b)
	elseif boolean.toJSBoolean(isListType(var3)) then
		return array.map(b, function(p3)
			-- upvalues: transformInputValue (copy), var3 (ref), var1 (ref), var2 (ref)
			return transformInputValue(var3.ofType, p3, var1, var2)
		end)
	elseif not boolean.toJSBoolean(isInputObjectType(var3)) then
		return nil
	end
	local fields = var3:getFields()
	local t = {}
	
	for i in b do
		local var4 = fields[tostring(i)]
		
		if var4 ~= nil then
			t[tostring(i)] = transformInputValue(var4.type, b[tostring(i)], var1, var2)
		end
	end
	return if var2 == nil then t else var2(var3, t)
end

t.transformInputValue = transformInputValue

function t.serializeInputValue(p3, p4)
	-- upvalues: transformInputValue (ref)
	return transformInputValue(p3, p4, function(p5, p6)
		local ok, status = pcall(p5.serialize, p5, p6)
		
		return if ok then status else p6
	end)
end

function t.parseInputValue(p3, p4)
	-- upvalues: transformInputValue (ref)
	return transformInputValue(p3, p4, function(p5, p6)
		local ok, status = pcall(p5.parseValue, p5, p6)
		
		return if ok then status else p6
	end)
end

function t.parseInputValueLiteral(p3, p4)
	-- upvalues: transformInputValue (ref)
	return transformInputValue(p3, p4, function(p5, p6)
		return p5:parseLiteral(p6, {})
	end)
end

return t