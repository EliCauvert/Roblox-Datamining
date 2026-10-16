local Parent = script.Parent.Parent
local Jsutils = Parent.jsutils
local Language = Parent.language
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local CoerceToTableFunction = LuauPolyfillModule.coerceToTable
local NullModule = require(Parent.luaUtils.null)
local _ = require(Jsutils.ObjMap)
local InspectFunction = require(Jsutils.inspect).inspect
local InvariantFunction = require(Jsutils.invariant).invariant
local KeyValMapFunction = require(Jsutils.keyValMap).keyValMap
local Kind = require(Language.kinds).Kind
local _ = require(Language.ast)

local function valueFromASTUntyped(p1, p2) --[[ Line: 48 ]]
	-- upvalues: Kind (copy), NullModule (copy), Array (copy), valueFromASTUntyped (copy), CoerceToTableFunction (copy), KeyValMapFunction (copy), InvariantFunction (copy), InspectFunction (copy)
	if p1.kind == Kind.NULL then
		return NullModule
	elseif p1.kind == Kind.INT then
		return (tonumber(p1.value, 10))
	elseif p1.kind == Kind.FLOAT then
		return (tonumber(p1.value))
	elseif p1.kind == Kind.STRING or p1.kind == Kind.ENUM or p1.kind == Kind.BOOLEAN then
		return p1.value
	elseif p1.kind == Kind.LIST then
		return Array.map(p1.values, function(p3) --[[ Line: 66 ]]
			-- upvalues: valueFromASTUntyped (upval), p2 (copy)
			return valueFromASTUntyped(p3, p2)
		end)
	elseif p1.kind == Kind.OBJECT then
		return CoerceToTableFunction(KeyValMapFunction(p1.fields, function(p3) --[[ Line: 71 ]]
			return p3.name.value
		end, function(p3) --[[ Line: 73 ]]
			-- upvalues: valueFromASTUntyped (upval), p2 (copy)
			return valueFromASTUntyped(p3.value, p2)
		end))
	elseif p1.kind == Kind.VARIABLE then
		return p2 and p2[p1.name.value]
	else
		InvariantFunction(false, "Unexpected value node: " .. InspectFunction(p1))
		error("Unexpected value node: " .. InspectFunction(p1))
	end
end

return { valueFromASTUntyped = valueFromASTUntyped }