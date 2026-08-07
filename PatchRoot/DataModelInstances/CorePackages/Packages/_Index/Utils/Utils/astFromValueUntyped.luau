-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:07 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local t = {}
local kind = require(parent.GraphQL).Kind
local error = luauPolyfillModule.Error
local number = luauPolyfillModule.Number
local object = luauPolyfillModule.Object
local luauRegExpModule = require(parent.LuauRegExp)
local var3 = nil

local function _(p0) --[[ line: 31 | named "isFinite" ]]
	-- upvalues: number (ref)
	local ok, status = pcall(function() --[[ line: 32 ]]
		-- upvalues: p0 (ref), number (copy)
		local var5 = tonumber(p0)
		
		return number.isNaN(var5) or var5 == 1e999 or var5 == -1e999
	end)
	
	return if ok then status else false
end

local function astFromValueUntyped(p1) --[[ line: 61 ]]
	-- upvalues: object (ref), kind (ref), boolean (ref), array (ref), astFromValueUntyped (ref), number (ref), var3 (write), error (ref)
	if p1 == object.None then
		return { kind = kind.NULL }
	elseif p1 == nil then
		return nil
	elseif boolean.toJSBoolean(array.isArray(p1)) then
		local t = {}
		
		for i, v in p1 do
			local var7 = astFromValueUntyped(v)
			
			if var7 ~= nil then
				table.insert(t, var7)
			end
		end
		return { kind = kind.LIST, values = t }
	elseif typeof(p1) == "table" then
		local t = {}
		
		for i in p1 do
			local var9 = astFromValueUntyped(p1[tostring(i)])
			
			if boolean.toJSBoolean(var9) then
				table.insert(t, {
					kind = kind.OBJECT_FIELD,
					name = { kind = kind.NAME, value = i },
					value = var9
				})
			end
		end
		return { kind = kind.OBJECT, fields = t }
	elseif typeof(p1) == "boolean" then
		return { kind = kind.BOOLEAN, value = p1 }
	end
	local toJSBoolean = boolean.toJSBoolean
	local var10 = false
	
	if typeof(p1) == "number" then
		local ok, status = pcall(function() --[[ line: 32 ]]
			-- upvalues: p1 (ref), number (copy)
			local var5 = tonumber(p1)
			
			return number.isNaN(var5) or var5 == 1e999 or var5 == -1e999
		end)
		var10 = if not ok then false else status
	end
	if toJSBoolean(var10) then
		local var11 = tostring(p1)
		
		return if boolean.toJSBoolean(var3:test(var11)) then { kind = kind.INT, value = var11 } else { kind = kind.FLOAT, value = var11 }
	elseif typeof(p1) == "string" then
		return { kind = kind.STRING, value = p1 }
	end
	error(error.new(("Cannot convert value to AST: %s."):format(tostring(p1))))
end

t.astFromValueUntyped = astFromValueUntyped
var3 = luauRegExpModule("^-?(?:0|[1-9][0-9]*)$")

return t