local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local object = luauPolyfillModule.Object
local t = {
	asArray = function(p1)
		-- upvalues: boolean (ref), array (ref)
		return if boolean.toJSBoolean(array.isArray(p1)) then p1 elseif boolean.toJSBoolean(p1) then { p1 } else {}
	end
}
local parse = require(parent.GraphQL).parse
local luauRegExpModule = require(parent.LuauRegExp)
local var1 = luauRegExpModule("\\.[a-zA-Z0-9]+$")

function t.isDocumentString(p1)
	-- upvalues: boolean (ref), var1 (ref), parse (ref)
	if typeof(p1) ~= "string" then
		return false
	elseif boolean.toJSBoolean(var1:test(p1)) then
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: parse (copy), p1 (ref)
		parse(p1)
		
		return true
	end)
	
	return if ok then status else false
end

local var2 = luauRegExpModule("[\226\128\152\226\128\156!%^<=>`]")

function t.isValidPath(p1)
	-- upvalues: boolean (ref), var2 (ref)
	return typeof(p1) == "string" and not boolean.toJSBoolean(var2:test(p1))
end

function t.compareStrings(p1, p2)
	return if tostring(p1) < tostring(p2) then -1 elseif tostring(p2) < tostring(p1) then 1 else 0
end

local function nodeToString(p1)
	-- upvalues: array (ref), object (ref)
	local var3 = if array.indexOf(object.keys(p1), "alias") ~= -1 then if typeof(p1.alias) == "table" then p1.alias.value else nil else nil
	
	if var3 == nil and array.indexOf(object.keys(p1), "name") ~= -1 then
		var3 = if typeof(p1.name) == "table" then p1.name.value else nil
	end
	if var3 == nil then
		var3 = p1.kind
	end
	return var3
end

t.nodeToString = nodeToString

function t.compareNodes(p1, p2, p3)
	-- upvalues: nodeToString (ref)
	local var3 = nodeToString(p1)
	local var4 = nodeToString(p2)
	
	return if typeof(p3) == "function" then p3(var3, var4) elseif tostring(var3) < tostring(var4) then -1 elseif tostring(var4) < tostring(var3) then 1 else 0
end

function t.isSome(p1)
	-- upvalues: object (ref)
	return p1 ~= nil and p1 ~= object.None
end

function t.assertSome(p1, p2)
	-- upvalues: error (ref)
	local var3 = if p2 ~= nil then "Value should be something" else p2
	
	if p1 == nil then
		error(error.new(var3))
	end
	return true
end

return t