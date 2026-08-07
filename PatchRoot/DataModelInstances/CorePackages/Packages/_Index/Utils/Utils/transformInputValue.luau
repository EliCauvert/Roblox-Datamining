-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:09 2026 Pacific Standard Time.

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

local function transformInputValue(a, b, p0, p1) --[[ line: 34 ]]
	-- upvalues: getNullableType (ref), boolean (ref), isLeafType (ref), isListType (ref), array (ref), transformInputValue (ref), isInputObjectType (ref)
	local var4 = if p0 ~= nil then nil else p0
	local var5 = if p1 ~= nil then nil else p1
	
	if b == nil then
		return b
	end
	local var6 = getNullableType(a)
	
	if boolean.toJSBoolean(isLeafType(var6)) then
		return if var4 == nil then b else var4(var6, b)
	elseif boolean.toJSBoolean(isListType(var6)) then
		return array.map(b, function(p2) --[[ line: 61 ]]
			-- upvalues: transformInputValue (copy), var6 (ref), var4 (ref), var5 (ref)
			return transformInputValue(var6.ofType, p2, var4, var5)
		end)
	elseif not boolean.toJSBoolean(isInputObjectType(var6)) then
		return nil
	end
	local fields = var6:getFields()
	local t = {}
	
	for i in b do
		local var9 = fields[tostring(i)]
		
		if var9 ~= nil then
			t[tostring(i)] = transformInputValue(var9.type, b[tostring(i)], var4, var5)
		end
	end
	return if var5 == nil then t else var5(var6, t)
end

t.transformInputValue = transformInputValue

function t.serializeInputValue(p3, p4) --[[ line: 95 ]]
	-- upvalues: transformInputValue (ref)
	return transformInputValue(p3, p4, function(p5, p6) --[[ line: 96 ]]
		local ok, status = pcall(p5.serialize, p5, p6)
		
		return if ok then status else p6
	end)
end

function t.parseInputValue(p7, p8) --[[ line: 117 ]]
	-- upvalues: transformInputValue (ref)
	return transformInputValue(p7, p8, function(p9, p10) --[[ line: 118 ]]
		local ok, status = pcall(p9.parseValue, p9, p10)
		
		return if ok then status else p10
	end)
end

function t.parseInputValueLiteral(p11, p12) --[[ line: 139 ]]
	-- upvalues: transformInputValue (ref)
	return transformInputValue(p11, p12, function(p13, p14) --[[ line: 140 ]]
		return p13:parseLiteral(p14, {})
	end)
end

return t