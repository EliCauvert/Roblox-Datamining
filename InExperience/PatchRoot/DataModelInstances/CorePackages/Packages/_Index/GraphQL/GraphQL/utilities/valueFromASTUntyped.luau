local parent = script.Parent.Parent
local parent_1 = parent.Parent
local jsutils = parent.jsutils
local language = parent.language
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local coerceToTable = luauPolyfillModule.coerceToTable
local nullModule = require(parent.luaUtils.null)
local _ = require(jsutils.ObjMap)
local inspect = require(jsutils.inspect).inspect
local invariant = require(jsutils.invariant).invariant
local keyValMap = require(jsutils.keyValMap).keyValMap
local kind = require(language.kinds).Kind
local _ = require(language.ast)

local function valueFromASTUntyped(p1, p2)
	-- upvalues: kind (ref), nullModule (ref), array (ref), valueFromASTUntyped (ref), coerceToTable (ref), keyValMap (ref), invariant (ref), inspect (ref)
	if p1.kind == kind.NULL then
		return nullModule
	elseif p1.kind == kind.INT then
		return tonumber(p1.value, 10)
	elseif p1.kind == kind.FLOAT then
		return tonumber(p1.value)
	elseif p1.kind == kind.STRING or p1.kind == kind.ENUM or p1.kind == kind.BOOLEAN then
		return p1.value
	elseif p1.kind == kind.LIST then
		return array.map(p1.values, function(p3)
			-- upvalues: valueFromASTUntyped (copy), p2 (ref)
			return valueFromASTUntyped(p3, p2)
		end)
	elseif p1.kind == kind.OBJECT then
		return coerceToTable(keyValMap(p1.fields, function(p3)
			return p3.name.value
		end, function(p3)
			-- upvalues: valueFromASTUntyped (copy), p2 (ref)
			return valueFromASTUntyped(p3.value, p2)
		end))
	elseif p1.kind == kind.VARIABLE then
		return p2 and p2[p1.name.value]
	end
	invariant(false, "Unexpected value node: " .. inspect(p1))
	error("Unexpected value node: " .. inspect(p1))
end

return { valueFromASTUntyped = valueFromASTUntyped }