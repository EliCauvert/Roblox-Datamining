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

local function valueFromASTUntyped(p0, p1)
	-- upvalues: kind (ref), nullModule (ref), array (ref), valueFromASTUntyped (ref), coerceToTable (ref), keyValMap (ref), invariant (ref), inspect (ref)
	if p0.kind == kind.NULL then
		return nullModule
	elseif p0.kind == kind.INT then
		return tonumber(p0.value, 10)
	elseif p0.kind == kind.FLOAT then
		return tonumber(p0.value)
	elseif p0.kind == kind.STRING or p0.kind == kind.ENUM or p0.kind == kind.BOOLEAN then
		return p0.value
	elseif p0.kind == kind.LIST then
		return array.map(p0.values, function(p2)
			-- upvalues: valueFromASTUntyped (copy), p1 (ref)
			return valueFromASTUntyped(p2, p1)
		end)
	elseif p0.kind == kind.OBJECT then
		return coerceToTable(keyValMap(p0.fields, function(p3)
			return p3.name.value
		end, function(p4)
			-- upvalues: valueFromASTUntyped (copy), p1 (ref)
			return valueFromASTUntyped(p4.value, p1)
		end))
	elseif p0.kind == kind.VARIABLE then
		return p1 and p1[p0.name.value]
	end
	invariant(false, "Unexpected value node: " .. inspect(p0))
	error("Unexpected value node: " .. inspect(p0))
end

return { valueFromASTUntyped = valueFromASTUntyped }