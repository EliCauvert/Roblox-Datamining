-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:14 2026 Pacific Standard Time.

local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local console = luauPolyfillModule.console
local error = luauPolyfillModule.Error
local tbl = setmetatable({}, { __index = error })
tbl.__index = tbl

function tbl.new(p0) --[[ line: 20 ]]
	-- upvalues: error (ref), tbl (ref)
	local var10 = if p0 == nil then "Invariant Violation" else p0
	local var11 = error.new(if typeof(var10) == "number" then ("%s: %s (see https://github.com/apollographql/invariant-packages)"):format("Invariant Violation", tostring(var10)) else var10)
	var11.framesToPop = 1
	var11.name = "Invariant Violation"
	
	return setmetatable(var11, tbl)
end

local function _(p1, p2) --[[ line: 43 | named "invariant" ]]
	-- upvalues: boolean (ref), tbl (ref)
	if not boolean.toJSBoolean(p1) then
		error(tbl.new(p2))
	end
end

local list = {
	"debug",
	"log",
	"warn",
	"error",
	"silent"
}
local log = array.indexOf(list, "log")

local _ = function(p3) --[[ line: 53 | named "wrapConsoleMethod" ]]
	-- upvalues: array (ref), list (ref), log (write), boolean (ref), console (ref)
	return function(...) --[[ line: 54 ]]
		-- upvalues: array (copy), list (copy), p3 (ref), log (copy), boolean (copy), console (copy)
		if log <= array.indexOf(list, p3) then
			return (if boolean.toJSBoolean(console[p3]) then console[p3] else console.log)(...)
		end
	end
end

local t = {}
local t_1 = {}
local var6 = "debug"

function t_1.debug(...) --[[ line: 54 ]]
	-- upvalues: array (ref), list (ref), var6 (ref), log (write), boolean (ref), console (ref)
	if log <= array.indexOf(list, var6) then
		return (if boolean.toJSBoolean(console[var6]) then console[var6] else console.log)(...)
	end
end

local var7 = "log"

function t_1.log(...) --[[ line: 54 ]]
	-- upvalues: array (ref), list (ref), var7 (ref), log (write), boolean (ref), console (ref)
	if log <= array.indexOf(list, var7) then
		return (if boolean.toJSBoolean(console[var7]) then console[var7] else console.log)(...)
	end
end

local var8 = "warn"

function t_1.warn(...) --[[ line: 54 ]]
	-- upvalues: array (ref), list (ref), var8 (ref), log (write), boolean (ref), console (ref)
	if log <= array.indexOf(list, var8) then
		return (if boolean.toJSBoolean(console[var8]) then console[var8] else console.log)(...)
	end
end

local var9 = "error"

function t_1.error(...) --[[ line: 54 ]]
	-- upvalues: array (ref), list (ref), var9 (ref), log (write), boolean (ref), console (ref)
	if log <= array.indexOf(list, var9) then
		return (if boolean.toJSBoolean(console[var9]) then console[var9] else console.log)(...)
	end
end

t.invariant = setmetatable(t_1, {
	__call = function(_, p4, p5) --[[ line: 72 ]]
		-- upvalues: boolean (ref), tbl (ref)
		if not boolean.toJSBoolean(p4) then
			error(tbl.new(p5))
		end
	end
})
t.InvariantError = tbl

function t.setVerbosity(value) --[[ line: 77 ]]
	-- upvalues: list (ref), log (write), array (ref)
	local var12 = list[log]
	log = math.max(1, array.indexOf(list, value))
	
	return var12
end

return t