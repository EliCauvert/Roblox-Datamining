local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local HttpService = game:GetService("HttpService")
local Callback = nil
local Callback1 = nil
local Callback2 = nil
local _ = require(script.Parent.types)
local _ = require(Parent1.GraphQL)
local InvariantError = require(Parent.jsutils.invariant).InvariantError
local IsNonNullObjectFunction = require(script.Parent.Parent.common.objects).isNonNullObject
local ObjectKeysForEachModule = require(Parent.luaUtils.objectKeysForEach)
local GetFragmentFromSelectionFunction = require(script.Parent.fragments).getFragmentFromSelection

local function _(p1): boolean --[[ Line: 81 | Named "isStringValue" ]]
	return p1.kind == "StringValue"
end

local _ = function(p1): boolean --[[ Line: 85 | Named "isBooleanValue" ]]
	return p1.kind == "BooleanValue"
end

local _ = function(p1): boolean --[[ Line: 89 | Named "isIntValue" ]]
	return p1.kind == "IntValue"
end

local _ = function(p1): boolean --[[ Line: 93 | Named "isFloatValue" ]]
	return p1.kind == "FloatValue"
end

local _ = function(p1): boolean --[[ Line: 97 | Named "isVariable" ]]
	return p1.kind == "Variable"
end

local _ = function(p1): boolean --[[ Line: 101 | Named "isObjectValue" ]]
	return p1.kind == "ObjectValue"
end

local _ = function(p1): boolean --[[ Line: 105 | Named "isListValue" ]]
	return p1.kind == "ListValue"
end

local _ = function(p1): boolean --[[ Line: 109 | Named "isEnumValue" ]]
	return p1.kind == "EnumValue"
end

local _ = function(p1): boolean --[[ Line: 113 | Named "isNullValue" ]]
	return p1.kind == "NullValue"
end

local function valueToObjectRepresentation(MapResults, Name, p1, p2) --[[ Line: 117 ]]
	-- upvalues: Array (copy), valueToObjectRepresentation (copy), InvariantError (copy)
	if p1.kind == "IntValue" or p1.kind == "FloatValue" then
		MapResults[Name.value] = tonumber(p1.value)
		
		return
	end
	if p1.kind == "BooleanValue" or p1.kind == "StringValue" then
		MapResults[Name.value] = p1.value
		
		return
	end
	if p1.kind == "ObjectValue" then
		local t = {}
		Array.map(p1.fields, function(p3) --[[ Line: 125 ]]
			-- upvalues: valueToObjectRepresentation (upval), t (copy), p2 (copy)
			valueToObjectRepresentation(t, p3.name, p3.value, p2)
			
			return nil
		end)
		MapResults[Name.value] = t
		
		return
	end
	if p1.kind == "Variable" then
		MapResults[Name.value] = (p2 or {})[p1.name.value]
		
		return
	end
	if p1.kind == "ListValue" then
		MapResults[Name.value] = Array.map(p1.values, function(p3) --[[ Line: 136 ]]
			-- upvalues: valueToObjectRepresentation (upval), Name (copy), p2 (copy)
			local t = {}
			valueToObjectRepresentation(t, Name, p3, p2)
			
			return t[Name.value]
		end)
		
		return
	end
	if p1.kind == "EnumValue" then
		MapResults[Name.value] = p1.value
		
		return
	end
	if p1.kind == "NullValue" then
		MapResults[Name.value] = nil
		
		return
	else
		error(InvariantError.new(tostring(("The inline argument \"%s\" of kind \"%s\""):format(Name.value, p1.kind)) .. "is not supported. Use variables instead of inline arguments to " .. "overcome this limitation."))
	end
end

local list = {
	"connection", "include", "skip", "client", "rest", "export"
}
Callback = Object.assign(setmetatable({}, {
	__call = function(_, p1, p2, p3) --[[ Line: 201 ]]
		-- upvalues: Array (copy), Callback1 (ref), ObjectKeysForEachModule (copy), list (copy)
		if not p2 or not p3 or not p3.connection or not p3.connection.key then
			local Text: string = p1
			
			if p2 then
				Text ..= ("(%s)"):format((Callback1(p2)))
			end
			if p3 then
				ObjectKeysForEachModule(p3, function(p4) --[[ Line: 254 ]]
					-- upvalues: Array (upval), list (upval), p3 (copy), Text (ref), Callback1 (upval)
					if Array.indexOf(list, p4) ~= -1 then return end
					if p3[p4] and next(p3[p4]) ~= nil then
						Text ..= ("@%s(%s)"):format(p4, Callback1(p3[p4]))
						
						return
					else
						Text ..= ("@%s"):format(p4)
					end
				end)
			end
			return Text
		elseif p3.connection.filter and #p3.connection.filter > 0 then
			local Filter = if p3.connection.filter then p3.connection.filter else {}
			Array.sort(Filter, nil)
			local t = {}
			Array.forEach(Filter, function(Key) --[[ Line: 227 ]]
				-- upvalues: t (copy), p2 (copy)
				t[Key] = p2[Key]
			end)
			
			return ("%s(%s)"):format(p3.connection.key, Callback1(t))
		else
			return p3.connection.key
		end
	end
}), {
	setStringify = function(_, Value) --[[ Line: 273 ]]
		-- upvalues: Callback1 (ref)
		local Stringify = Callback1
		Callback1 = Value
		
		return Stringify
	end
})

Callback1 = function(Input) --[[ Line: 284 | Named "stringify" ]]
	-- upvalues: IsNonNullObjectFunction (copy), HttpService (copy), Array (copy), Object (copy), Callback1 (ref)
	if IsNonNullObjectFunction(Input) then
		local MapResult = Array.map(Array.sort(Object.keys(Input), nil), function(p1) --[[ Line: 295 ]]
			-- upvalues: Callback1 (upval), Input (copy)
			return { p1, Callback1(Input[p1]) }
		end)
		
		return if Array.isArray(Input) then ("[%s]"):format(Array.join(Array.map(MapResult, function(Entry) --[[ Line: 301 ]]
			return Entry[2]
		end), ",")) else ("{%s}"):format(Array.join(Array.map(MapResult, function(Entry): string --[[ Line: 308 ]]
			return ("\"%s\":%s"):format(Entry[1], Entry[2])
		end), ","))
	else
		return HttpService:JSONEncode(Input)
	end
end

local function getTypenameFromResult(p1, SelectionSet, p2) --[[ Line: 355 ]]
	-- upvalues: Callback2 (ref), getTypenameFromResult (copy), GetFragmentFromSelectionFunction (copy)
	if typeof(p1.__typename) == "string" then
		return p1.__typename
	end
	local TypenameFromResult = nil
	for _, selection in ipairs(SelectionSet.selections) do
		if not Callback2(selection) then
			TypenameFromResult = getTypenameFromResult(p1, GetFragmentFromSelectionFunction(selection, p2).selectionSet, p2)
			
			if typeof(TypenameFromResult) == "string" then
				return TypenameFromResult
			end
		elseif selection.name.value == "__typename" then
			return p1[if selection.alias then selection.alias.value else selection.name.value]
		end
	end
	return nil
end

Callback2 = function(p3): boolean --[[ Line: 385 | Named "isField" ]]
	return p3.kind == "Field"
end

return {
	makeReference = function(p3) --[[ Line: 59 ]]
		return { __ref = tostring(p3) }
	end,
	isReference = function(p3): boolean --[[ Line: 64 ]]
		return type(p3) == "table" and type(p3.__ref) == "string"
	end,
	isDocumentNode = function(p3) --[[ Line: 74 ]]
		-- upvalues: IsNonNullObjectFunction (copy), Array (copy)
		return IsNonNullObjectFunction(p3) and (p3.kind == "Document" and Array.isArray(p3.definitions))
	end,
	valueToObjectRepresentation = valueToObjectRepresentation,
	storeKeyNameFromField = function(p3, p4) --[[ Line: 158 ]]
		-- upvalues: Array (copy), valueToObjectRepresentation (copy), Callback (ref)
		local v1 = nil
		
		if p3.directives then
			v1 = {}
			Array.forEach(p3.directives, function(p5) --[[ Line: 162 ]]
				-- upvalues: v1 (ref), Array (upval), valueToObjectRepresentation (upval), p4 (copy)
				v1[p5.name.value] = {}
				
				if p5.arguments then
					Array.forEach(p5.arguments, function(p6) --[[ Line: 166 ]]
						-- upvalues: valueToObjectRepresentation (upval), v1 (upval), p5 (copy), p4 (upval)
						valueToObjectRepresentation(v1[p5.name.value], p6.name, p6.value, p4)
					end)
				end
			end)
		end
		local v2 = nil
		
		if p3.arguments and #p3.arguments > 0 then
			v2 = {}
			Array.forEach(p3.arguments, function(p5) --[[ Line: 177 ]]
				-- upvalues: valueToObjectRepresentation (upval), v2 (ref), p4 (copy)
				valueToObjectRepresentation(v2, p5.name, p5.value, p4)
			end)
		end
		return Callback(p3.name.value, v2, v1)
	end,
	getStoreKeyName = Callback,
	argumentsObjectFromField = function(p3, p4) --[[ Line: 329 ]]
		-- upvalues: Array (copy), valueToObjectRepresentation (copy)
		if p3.arguments and #p3.arguments > 0 then
			local t = {}
			Array.forEach(p3.arguments, function(p5) --[[ Line: 334 ]]
				-- upvalues: valueToObjectRepresentation (upval), t (copy), p4 (copy)
				valueToObjectRepresentation(t, p5.name, p5.value, p4)
			end)
			
			return t
		else
			return nil
		end
	end,
	resultKeyNameFromField = function(p3) --[[ Line: 344 ]]
		return if p3.alias then p3.alias.value else p3.name.value
	end,
	getTypenameFromResult = getTypenameFromResult,
	isField = Callback2,
	isInlineFragment = function(p3): boolean --[[ Line: 390 ]]
		return p3.kind == "InlineFragment"
	end
}