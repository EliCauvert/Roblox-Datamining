local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local object = luauPolyfillModule.Object
local t = {
	asArray = function(p0)
		-- upvalues: boolean (ref), array (ref)
		return if boolean.toJSBoolean(array.isArray(p0)) then p0 elseif boolean.toJSBoolean(p0) then { p0 } else {}
	end
}
local parse = require(parent.GraphQL).parse
local luauRegExpModule = require(parent.LuauRegExp)
local var3 = luauRegExpModule("\\.[a-zA-Z0-9]+$")

function t.isDocumentString(p1)
	-- upvalues: boolean (ref), var3 (ref), parse (ref)
	if typeof(p1) ~= "string" then
		return false
	elseif boolean.toJSBoolean(var3:test(p1)) then
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: parse (copy), p1 (ref)
		parse(p1)
		
		return true
	end)
	
	return if ok then status else false
end

local var4 = luauRegExpModule("[\226\128\152\226\128\156!%^<=>`]")

function t.isValidPath(p2)
	-- upvalues: boolean (ref), var4 (ref)
	return typeof(p2) == "string" and not boolean.toJSBoolean(var4:test(p2))
end

function t.compareStrings(p3, p4)
	return if tostring(p3) < tostring(p4) then -1 elseif tostring(p4) < tostring(p3) then 1 else 0
end

local function nodeToString(p5)
	-- upvalues: array (ref), object (ref)
	local var6 = if array.indexOf(object.keys(p5), "alias") ~= -1 then if typeof(p5.alias) == "table" then p5.alias.value else nil else nil
	
	if var6 == nil and array.indexOf(object.keys(p5), "name") ~= -1 then
		var6 = if typeof(p5.name) == "table" then p5.name.value else nil
	end
	if var6 == nil then
		var6 = p5.kind
	end
	return var6
end

t.nodeToString = nodeToString

function t.compareNodes(p6, p7, p8)
	-- upvalues: nodeToString (ref)
	local var7 = nodeToString(p6)
	local var8 = nodeToString(p7)
	
	return if typeof(p8) == "function" then p8(var7, var8) elseif tostring(var7) < tostring(var8) then -1 elseif tostring(var8) < tostring(var7) then 1 else 0
end

function t.isSome(p9)
	-- upvalues: object (ref)
	return p9 ~= nil and p9 ~= object.None
end

function t.assertSome(p10, p11)
	-- upvalues: error (ref)
	local var9 = if p11 ~= nil then "Value should be something" else p11
	
	if p10 == nil then
		error(error.new(var9))
	end
	return true
end

return t