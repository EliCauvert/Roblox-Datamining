local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local console = luauPolyfillModule.console
local error = luauPolyfillModule.Error
local tbl = setmetatable({}, { __index = error })
tbl.__index = tbl

function tbl.new(p1)
	-- upvalues: error (ref), tbl (ref)
	local var1 = if p1 == nil then "Invariant Violation" else p1
	local var2 = error.new(if typeof(var1) == "number" then ("%s: %s (see https://github.com/apollographql/invariant-packages)"):format("Invariant Violation", tostring(var1)) else var1)
	var2.framesToPop = 1
	var2.name = "Invariant Violation"
	
	return setmetatable(var2, tbl)
end

local function _(p1, p2)
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

local _ = function(p1)
	-- upvalues: array (ref), list (ref), log (write), boolean (ref), console (ref)
	return function(...)
		-- upvalues: array (copy), list (copy), p1 (ref), log (copy), boolean (copy), console (copy)
		if log <= array.indexOf(list, p1) then
			return (if boolean.toJSBoolean(console[p1]) then console[p1] else console.log)(...)
		end
	end
end

local t = {}
local t_1 = {}
local var1 = "debug"

function t_1.debug(...)
	-- upvalues: array (ref), list (ref), var1 (ref), log (write), boolean (ref), console (ref)
	if log <= array.indexOf(list, var1) then
		return (if boolean.toJSBoolean(console[var1]) then console[var1] else console.log)(...)
	end
end

local var2 = "log"

function t_1.log(...)
	-- upvalues: array (ref), list (ref), var2 (ref), log (write), boolean (ref), console (ref)
	if log <= array.indexOf(list, var2) then
		return (if boolean.toJSBoolean(console[var2]) then console[var2] else console.log)(...)
	end
end

local var3 = "warn"

function t_1.warn(...)
	-- upvalues: array (ref), list (ref), var3 (ref), log (write), boolean (ref), console (ref)
	if log <= array.indexOf(list, var3) then
		return (if boolean.toJSBoolean(console[var3]) then console[var3] else console.log)(...)
	end
end

local var4 = "error"

function t_1.error(...)
	-- upvalues: array (ref), list (ref), var4 (ref), log (write), boolean (ref), console (ref)
	if log <= array.indexOf(list, var4) then
		return (if boolean.toJSBoolean(console[var4]) then console[var4] else console.log)(...)
	end
end

t.invariant = setmetatable(t_1, {
	__call = function(_, p1, p2)
		-- upvalues: boolean (ref), tbl (ref)
		if not boolean.toJSBoolean(p1) then
			error(tbl.new(p2))
		end
	end
})
t.InvariantError = tbl

function t.setVerbosity(value)
	-- upvalues: list (ref), log (write), array (ref)
	local var5 = list[log]
	log = math.max(1, array.indexOf(list, value))
	
	return var5
end

return t