-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:10 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local instanceof = luauPolyfillModule.instanceof
local luauRegExpModule = require(parent.LuauRegExp)
local t = {}

local function valueMatchesCriteria(p0, p1) --[[ line: 16 ]]
	-- upvalues: array (ref), valueMatchesCriteria (ref), boolean (ref), object (ref), instanceof (ref), luauRegExpModule (ref)
	return if p0 == nil then p0 == p1 elseif array.isArray(p0) then array.isArray(p1) and array.every(p0, function(p3, p4) --[[ line: 31 ]]
		-- upvalues: valueMatchesCriteria (copy), p1 (ref)
		return valueMatchesCriteria(p3, p1[p4])
	end) elseif typeof(p0) == "table" then typeof(p1) == "table" and (boolean.toJSBoolean(p1) and array.every(object.keys(p1), function(p2) --[[ line: 45 ]]
		-- upvalues: valueMatchesCriteria (copy), p0 (ref), p1 (ref)
		return valueMatchesCriteria(p0[p2], p1[p2])
	end)) elseif instanceof(p1, luauRegExpModule) then p1:test(p0) else p0 == p1
end

t.valueMatchesCriteria = valueMatchesCriteria

return t