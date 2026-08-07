local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local httpService = game:GetService("HttpService")
local t = {
	makeReference = function(p0) --[[ line: 59 ]]
		return { __ref = tostring(p0) }
	end,
	isReference = function(p1) --[[ line: 64 ]]
		return type(p1) == "table" and type(p1.__ref) == "string"
	end
}
local var3 = nil
local stringify = nil
local var5 = nil
local _ = require(script.Parent.types)
local _ = require(parent_1.GraphQL)
local invariantError = require(parent.jsutils.invariant).InvariantError
local isNonNullObject = require(script.Parent.Parent.common.objects).isNonNullObject
local objectKeysForEachModule = require(parent.luaUtils.objectKeysForEach)
local getFragmentFromSelection = require(script.Parent.fragments).getFragmentFromSelection

function t.isDocumentNode(p2) --[[ line: 74 ]]
	-- upvalues: isNonNullObject (ref), array (ref)
	return isNonNullObject(p2) and (p2.kind == "Document" and array.isArray(p2.definitions))
end

local function _(p3) --[[ line: 81 | named "isStringValue" ]]
	return p3.kind == "StringValue"
end

local _ = function(p4) --[[ line: 85 | named "isBooleanValue" ]]
	return p4.kind == "BooleanValue"
end

local _ = function(p5) --[[ line: 89 | named "isIntValue" ]]
	return p5.kind == "IntValue"
end

local _ = function(p6) --[[ line: 93 | named "isFloatValue" ]]
	return p6.kind == "FloatValue"
end

local _ = function(p7) --[[ line: 97 | named "isVariable" ]]
	return p7.kind == "Variable"
end

local _ = function(p8) --[[ line: 101 | named "isObjectValue" ]]
	return p8.kind == "ObjectValue"
end

local _ = function(p9) --[[ line: 105 | named "isListValue" ]]
	return p9.kind == "ListValue"
end

local _ = function(p10) --[[ line: 109 | named "isEnumValue" ]]
	return p10.kind == "EnumValue"
end

local _ = function(p11) --[[ line: 113 | named "isNullValue" ]]
	return p11.kind == "NullValue"
end

local function valueToObjectRepresentation(p12, p13, p14, p15) --[[ line: 117 ]]
	-- upvalues: array (ref), valueToObjectRepresentation (ref), invariantError (ref)
	if p14.kind == "IntValue" or p14.kind == "FloatValue" then
		p12[p13.value] = tonumber(p14.value)
		
		return
	elseif p14.kind == "BooleanValue" or p14.kind == "StringValue" then
		p12[p13.value] = p14.value
		
		return
	elseif p14.kind == "ObjectValue" then
		local t = {}
		array.map(p14.fields, function(p16) --[[ line: 125 ]]
			-- upvalues: valueToObjectRepresentation (copy), t (ref), p15 (ref)
			valueToObjectRepresentation(t, p16.name, p16.value, p15)
			
			return nil
		end)
		p12[p13.value] = t
		
		return
	elseif p14.kind == "Variable" then
		p12[p13.value] = (p15 or {})[p14.name.value]
		
		return
	elseif p14.kind == "ListValue" then
		p12[p13.value] = array.map(p14.values, function(p17) --[[ line: 136 ]]
			-- upvalues: valueToObjectRepresentation (copy), p13 (ref), p15 (ref)
			local t = {}
			valueToObjectRepresentation(t, p13, p17, p15)
			
			return t[p13.value]
		end)
		
		return
	elseif p14.kind == "EnumValue" then
		p12[p13.value] = p14.value
		
		return
	elseif p14.kind == "NullValue" then
		p12[p13.value] = nil
		
		return
	end
	error(invariantError.new(tostring(("The inline argument \"%s\" of kind \"%s\""):format(p13.value, p14.kind)) .. "is not supported. Use variables instead of inline arguments to " .. "overcome this limitation."))
end

t.valueToObjectRepresentation = valueToObjectRepresentation

function t.storeKeyNameFromField(p18, p19) --[[ line: 158 ]]
	-- upvalues: array (ref), valueToObjectRepresentation (ref), var3 (write)
	local t = nil
	
	if p18.directives then
		t = {}
		array.forEach(p18.directives, function(p20) --[[ line: 162 ]]
			-- upvalues: t (write), array (copy), valueToObjectRepresentation (copy), p19 (ref)
			t[p20.name.value] = {}
			
			if p20.arguments then
				array.forEach(p20.arguments, function(p21) --[[ line: 166 ]]
					-- upvalues: valueToObjectRepresentation (copy), t (copy), p20 (ref), p19 (copy)
					valueToObjectRepresentation(t[p20.name.value], p21.name, p21.value, p19)
				end)
			end
		end)
	end
	local t_1 = nil
	
	if p18.arguments and #p18.arguments > 0 then
		t_1 = {}
		array.forEach(p18.arguments, function(p22) --[[ line: 177 ]]
			-- upvalues: valueToObjectRepresentation (copy), t_1 (write), p19 (ref)
			valueToObjectRepresentation(t_1, p22.name, p22.value, p19)
		end)
	end
	return var3(p18.name.value, t_1, t)
end

local list = {
	"connection", "include", "skip", "client", "rest", "export"
}
t.getStoreKeyName = object.assign(setmetatable({}, {
	__call = function(_, p23, p24, p25) --[[ line: 201 ]]
		-- upvalues: array (ref), stringify (write), objectKeysForEachModule (ref), list (ref)
		if p24 and p25 and (p25.connection and p25.connection.key) then
			if p25.connection.filter and #p25.connection.filter > 0 then
				local var14 = if p25.connection.filter then p25.connection.filter else {}
				array.sort(var14, nil)
				local t = {}
				array.forEach(var14, function(p26) --[[ line: 227 ]]
					-- upvalues: t (ref), p24 (ref)
					t[p26] = p24[p26]
				end)
				
				return ("%s(%s)"):format(p25.connection.key, stringify(t))
			end
			return p25.connection.key
		else
			local var16 = p23
			
			if p24 then
				var16 ..= ("(%s)"):format(stringify(p24))
			end
			if p25 then
				objectKeysForEachModule(p25, function(p27) --[[ line: 254 ]]
					-- upvalues: array (copy), list (copy), p25 (ref), var16 (write), stringify (copy)
					if array.indexOf(list, p27) ~= -1 then return end
					if p25[p27] and next(p25[p27]) ~= nil then
						var16 ..= ("@%s(%s)"):format(p27, stringify(p25[p27]))
						
						return
					end
					var16 ..= ("@%s"):format(p27)
				end)
			end
			return var16
		end
	end
}), {
	setStringify = function(_, p28) --[[ line: 273 ]]
		-- upvalues: stringify (write)
		stringify = p28
		
		return stringify
	end
})

stringify = function(p29) --[[ line: 284 | named "stringify" ]]
	-- upvalues: isNonNullObject (ref), httpService (ref), array (ref), object (ref), stringify (write)
	if not isNonNullObject(p29) then
		return httpService:JSONEncode(p29)
	end
	local var17 = array.map(array.sort(object.keys(p29), nil), function(p30) --[[ line: 295 ]]
		-- upvalues: stringify (copy), p29 (ref)
		return { p30, stringify(p29[p30]) }
	end)
	
	return if array.isArray(p29) then ("[%s]"):format(array.join(array.map(var17, function(p32) --[[ line: 301 ]]
		return p32[2]
	end), ",")) else ("{%s}"):format(array.join(array.map(var17, function(p31) --[[ line: 308 ]]
		return ("\"%s\":%s"):format(p31[1], p31[2])
	end), ","))
end

function t.argumentsObjectFromField(p33, p34) --[[ line: 329 ]]
	-- upvalues: array (ref), valueToObjectRepresentation (ref)
	if p33.arguments and #p33.arguments > 0 then
		local t = {}
		array.forEach(p33.arguments, function(p35) --[[ line: 334 ]]
			-- upvalues: valueToObjectRepresentation (copy), t (ref), p34 (ref)
			valueToObjectRepresentation(t, p35.name, p35.value, p34)
		end)
		
		return t
	end
	return nil
end

function t.resultKeyNameFromField(p36) --[[ line: 344 ]]
	return if p36.alias then p36.alias.value else p36.name.value
end

local function getTypenameFromResult(p37, p38, p39) --[[ line: 355 ]]
	-- upvalues: var5 (write), getTypenameFromResult (ref), getFragmentFromSelection (ref)
	if typeof(p37.__typename) == "string" then
		return p37.__typename
	end
	for i, v in ipairs(p38.selections) do
		if var5(v) then
			if v.name.value == "__typename" then
				return p37[if v.alias then v.alias.value else v.name.value]
			end
		else
			local var19 = getTypenameFromResult(p37, getFragmentFromSelection(v, p39).selectionSet, p39)
			
			if typeof(var19) == "string" then
				return var19
			end
		end
	end
	return nil
end

t.getTypenameFromResult = getTypenameFromResult

function t.isField(p40) --[[ line: 385 ]]
	return p40.kind == "Field"
end

function t.isInlineFragment(p41) --[[ line: 390 ]]
	return p41.kind == "InlineFragment"
end

return t