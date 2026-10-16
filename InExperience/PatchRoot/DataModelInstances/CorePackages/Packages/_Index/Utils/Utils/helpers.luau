local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local Object = LuauPolyfillModule.Object
local ParseFunction = require(Parent.GraphQL).parse
local LuauRegExpModule = require(Parent.LuauRegExp)

local function asArray(p1) --[[ Line: 23 ]]
	-- upvalues: Boolean (copy), Array (copy)
	return if Boolean.toJSBoolean(Array.isArray(p1)) then p1 elseif Boolean.toJSBoolean(p1) then { p1 } else {}
end

local AZAZ09 = LuauRegExpModule("\\.[a-zA-Z0-9]+$")

local function isDocumentString(p1) --[[ Line: 31 ]]
	-- upvalues: Boolean (copy), AZAZ09 (copy), ParseFunction (copy)
	if typeof(p1) ~= "string" then
		return false
	elseif Boolean.toJSBoolean(AZAZ09:test(p1)) then
		return false
	else
		local Success, Result = pcall(function(): boolean --[[ Line: 53 ]]
			-- upvalues: ParseFunction (upval), p1 (copy)
			ParseFunction(p1)
			
			return true
		end)
		
		return if Success then Result else false
	end
end

local v1 = LuauRegExpModule("[‘“!%^<=>`]")

local function nodeToString(p1) --[[ Line: 96 ]]
	-- upvalues: Array (copy), Object (copy)
	local Value = if Array.indexOf(Object.keys(p1), "alias") ~= -1 then if typeof(p1.alias) == "table" then p1.alias.value else nil else nil
	
	if Value == nil and Array.indexOf(Object.keys(p1), "name") ~= -1 then
		Value = if typeof(p1.name) == "table" then p1.name.value else nil
	end
	if Value == nil then
		Value = p1.kind
	end
	return Value
end

return {
	asArray = asArray,
	isDocumentString = isDocumentString,
	isValidPath = function(p1): boolean --[[ Line: 68 ]]
		-- upvalues: Boolean (copy), v1 (copy)
		return typeof(p1) == "string" and not Boolean.toJSBoolean(v1:test(p1))
	end,
	compareStrings = function(p1, p2): number --[[ Line: 72 ]]
		return if tostring(p1) < tostring(p2) then -1 elseif tostring(p2) < tostring(p1) then 1 else 0
	end,
	nodeToString = nodeToString,
	compareNodes = function(p1, p2, Callback) --[[ Line: 122 ]]
		-- upvalues: nodeToString (copy)
		local NodeToStringResult = nodeToString(p1)
		local NodeToStringResult1 = nodeToString(p2)
		
		return if typeof(Callback) == "function" then Callback(NodeToStringResult, NodeToStringResult1) elseif tostring(NodeToStringResult) < tostring(NodeToStringResult1) then -1 elseif tostring(NodeToStringResult1) < tostring(NodeToStringResult) then 1 else 0
	end,
	isSome = function(None): boolean --[[ Line: 131 ]]
		-- upvalues: Object (copy)
		return None ~= nil and None ~= Object.None
	end,
	assertSome = function(p1, p2): boolean --[[ Line: 140 ]]
		-- upvalues: Error1 (copy)
		local ValueShouldBeSomething = if p2 == nil then "Value should be something" else p2
		
		if p1 == nil then
			error(Error1.new(ValueShouldBeSomething))
		end
		return true
	end
}