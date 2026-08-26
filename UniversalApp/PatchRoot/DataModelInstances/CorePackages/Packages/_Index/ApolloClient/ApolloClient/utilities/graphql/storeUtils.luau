local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local httpService = game:GetService("HttpService")
local t = {
	makeReference = function(p1)
		return { __ref = tostring(p1) }
	end,
	isReference = function(p1)
		return type(p1) == "table" and type(p1.__ref) == "string"
	end
}
local var1 = nil
local stringify = nil
local var2 = nil
local _ = require(script.Parent.types)
local _ = require(parent_1.GraphQL)
local invariantError = require(parent.jsutils.invariant).InvariantError
local isNonNullObject = require(script.Parent.Parent.common.objects).isNonNullObject
local objectKeysForEachModule = require(parent.luaUtils.objectKeysForEach)
local getFragmentFromSelection = require(script.Parent.fragments).getFragmentFromSelection

function t.isDocumentNode(p1)
	-- upvalues: isNonNullObject (ref), array (ref)
	return isNonNullObject(p1) and (p1.kind == "Document" and array.isArray(p1.definitions))
end

local function _(p1)
	return p1.kind == "StringValue"
end

local _ = function(p1)
	return p1.kind == "BooleanValue"
end

local _ = function(p1)
	return p1.kind == "IntValue"
end

local _ = function(p1)
	return p1.kind == "FloatValue"
end

local _ = function(p1)
	return p1.kind == "Variable"
end

local _ = function(p1)
	return p1.kind == "ObjectValue"
end

local _ = function(p1)
	return p1.kind == "ListValue"
end

local _ = function(p1)
	return p1.kind == "EnumValue"
end

local _ = function(p1)
	return p1.kind == "NullValue"
end

local function valueToObjectRepresentation(p1, p2, p3, p4)
	-- upvalues: array (ref), valueToObjectRepresentation (ref), invariantError (ref)
	if p3.kind == "IntValue" or p3.kind == "FloatValue" then
		p1[p2.value] = tonumber(p3.value)
		
		return
	elseif p3.kind == "BooleanValue" or p3.kind == "StringValue" then
		p1[p2.value] = p3.value
		
		return
	elseif p3.kind == "ObjectValue" then
		local t = {}
		array.map(p3.fields, function(p5)
			-- upvalues: valueToObjectRepresentation (copy), t (ref), p4 (ref)
			valueToObjectRepresentation(t, p5.name, p5.value, p4)
			
			return nil
		end)
		p1[p2.value] = t
		
		return
	elseif p3.kind == "Variable" then
		p1[p2.value] = (p4 or {})[p3.name.value]
		
		return
	elseif p3.kind == "ListValue" then
		p1[p2.value] = array.map(p3.values, function(p5)
			-- upvalues: valueToObjectRepresentation (copy), p2 (ref), p4 (ref)
			local t = {}
			valueToObjectRepresentation(t, p2, p5, p4)
			
			return t[p2.value]
		end)
		
		return
	elseif p3.kind == "EnumValue" then
		p1[p2.value] = p3.value
		
		return
	elseif p3.kind == "NullValue" then
		p1[p2.value] = nil
		
		return
	end
	error(invariantError.new(tostring(("The inline argument \"%s\" of kind \"%s\""):format(p2.value, p3.kind)) .. "is not supported. Use variables instead of inline arguments to " .. "overcome this limitation."))
end

t.valueToObjectRepresentation = valueToObjectRepresentation

function t.storeKeyNameFromField(p1, p2)
	-- upvalues: array (ref), valueToObjectRepresentation (ref), var1 (write)
	local t = nil
	
	if p1.directives then
		t = {}
		array.forEach(p1.directives, function(p3)
			-- upvalues: t (write), array (copy), valueToObjectRepresentation (copy), p2 (ref)
			t[p3.name.value] = {}
			
			if p3.arguments then
				array.forEach(p3.arguments, function(p4)
					-- upvalues: valueToObjectRepresentation (copy), t (copy), p3 (ref), p2 (copy)
					valueToObjectRepresentation(t[p3.name.value], p4.name, p4.value, p2)
				end)
			end
		end)
	end
	local t_1 = nil
	
	if p1.arguments and #p1.arguments > 0 then
		t_1 = {}
		array.forEach(p1.arguments, function(p3)
			-- upvalues: valueToObjectRepresentation (copy), t_1 (write), p2 (ref)
			valueToObjectRepresentation(t_1, p3.name, p3.value, p2)
		end)
	end
	return var1(p1.name.value, t_1, t)
end

local list = {
	"connection", "include", "skip", "client", "rest", "export"
}
t.getStoreKeyName = object.assign(setmetatable({}, {
	__call = function(_, p1, p2, p3)
		-- upvalues: array (ref), stringify (write), objectKeysForEachModule (ref), list (ref)
		if p2 and p3 and (p3.connection and p3.connection.key) then
			if p3.connection.filter and #p3.connection.filter > 0 then
				local var3 = if p3.connection.filter then p3.connection.filter else {}
				array.sort(var3, nil)
				local t = {}
				array.forEach(var3, function(p4)
					-- upvalues: t (ref), p2 (ref)
					t[p4] = p2[p4]
				end)
				
				return ("%s(%s)"):format(p3.connection.key, stringify(t))
			end
			return p3.connection.key
		else
			local var4 = p1
			
			if p2 then
				var4 ..= ("(%s)"):format(stringify(p2))
			end
			if p3 then
				objectKeysForEachModule(p3, function(p4)
					-- upvalues: array (copy), list (copy), p3 (ref), var4 (write), stringify (copy)
					if array.indexOf(list, p4) ~= -1 then return end
					if p3[p4] and next(p3[p4]) ~= nil then
						var4 ..= ("@%s(%s)"):format(p4, stringify(p3[p4]))
						
						return
					end
					var4 ..= ("@%s"):format(p4)
				end)
			end
			return var4
		end
	end
}), {
	setStringify = function(_, p1)
		-- upvalues: stringify (write)
		stringify = p1
		
		return stringify
	end
})

stringify = function(p1)
	-- upvalues: isNonNullObject (ref), httpService (ref), array (ref), object (ref), stringify (write)
	if not isNonNullObject(p1) then
		return httpService:JSONEncode(p1)
	end
	local var3 = array.map(array.sort(object.keys(p1), nil), function(p2)
		-- upvalues: stringify (copy), p1 (ref)
		return { p2, stringify(p1[p2]) }
	end)
	
	return if array.isArray(p1) then ("[%s]"):format(array.join(array.map(var3, function(p2)
		return p2[2]
	end), ",")) else ("{%s}"):format(array.join(array.map(var3, function(p2)
		return ("\"%s\":%s"):format(p2[1], p2[2])
	end), ","))
end

function t.argumentsObjectFromField(p1, p2)
	-- upvalues: array (ref), valueToObjectRepresentation (ref)
	if p1.arguments and #p1.arguments > 0 then
		local t = {}
		array.forEach(p1.arguments, function(p3)
			-- upvalues: valueToObjectRepresentation (copy), t (ref), p2 (ref)
			valueToObjectRepresentation(t, p3.name, p3.value, p2)
		end)
		
		return t
	end
	return nil
end

function t.resultKeyNameFromField(p1)
	return if p1.alias then p1.alias.value else p1.name.value
end

local function getTypenameFromResult(p1, p2, p3)
	-- upvalues: var2 (write), getTypenameFromResult (ref), getFragmentFromSelection (ref)
	if typeof(p1.__typename) == "string" then
		return p1.__typename
	end
	for i, v in ipairs(p2.selections) do
		if var2(v) then
			if v.name.value == "__typename" then
				return p1[if v.alias then v.alias.value else v.name.value]
			end
		else
			local var3 = getTypenameFromResult(p1, getFragmentFromSelection(v, p3).selectionSet, p3)
			
			if typeof(var3) == "string" then
				return var3
			end
		end
	end
	return nil
end

t.getTypenameFromResult = getTypenameFromResult

function t.isField(p4)
	return p4.kind == "Field"
end

function t.isInlineFragment(p4)
	return p4.kind == "InlineFragment"
end

return t