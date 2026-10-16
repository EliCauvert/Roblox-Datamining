local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Console = LuauPolyfillModule.console
local Error1 = LuauPolyfillModule.Error
local self = setmetatable({}, { __index = Error1 })
self.__index = self

function self.new(Message) --[[ Line: 20 ]]
	-- upvalues: Error1 (copy), self (copy)
	local InvariantViolation = if Message == nil then "Invariant Violation" else Message
	local NewError = Error1.new(if typeof(InvariantViolation) == "number" then ("%s: %s (see https://github.com/apollographql/invariant-packages)"):format("Invariant Violation", (tostring(InvariantViolation))) else InvariantViolation)
	NewError.framesToPop = 1
	NewError.name = "Invariant Violation"
	
	return (setmetatable(NewError, self))
end

local function _(p1, p2) --[[ Line: 43 | Named "invariant" ]]
	-- upvalues: Boolean (copy), self (copy)
	if not Boolean.toJSBoolean(p1) then
		error(self.new(p2))
	end
end

local list = {
	"debug",
	"log",
	"warn",
	"error",
	"silent"
}
local Log = Array.indexOf(list, "log")

local _ = function(p1) --[[ Line: 53 | Named "wrapConsoleMethod" ]]
	-- upvalues: Array (copy), list (copy), Log (ref), Boolean (copy), Console (copy)
	return function(...) --[[ Line: 54 ]]
		-- upvalues: Array (upval), list (upval), p1 (copy), Log (upval), Boolean (upval), Console (upval)
		if Log > Array.indexOf(list, p1) then return end
		return (Boolean.toJSBoolean(Console[p1]) and Console[p1] or Console.log)(...)
	end
end

local v1 = "debug"

local function v11(...) --[[ Line: 54 ]]
	-- upvalues: Array (copy), list (copy), v1 (copy), Log (ref), Boolean (copy), Console (copy)
	if Log > Array.indexOf(list, v1) then return end
	return (Boolean.toJSBoolean(Console[v1]) and Console[v1] or Console.log)(...)
end

local v2 = "log"

local function Log1(...) --[[ Line: 54 ]]
	-- upvalues: Array (copy), list (copy), v2 (copy), Log (ref), Boolean (copy), Console (copy)
	if Log > Array.indexOf(list, v2) then return end
	return (Boolean.toJSBoolean(Console[v2]) and Console[v2] or Console.log)(...)
end

local v3 = "warn"

local function Warn(...) --[[ Line: 54 ]]
	-- upvalues: Array (copy), list (copy), v3 (copy), Log (ref), Boolean (copy), Console (copy)
	if Log > Array.indexOf(list, v3) then return end
	return (Boolean.toJSBoolean(Console[v3]) and Console[v3] or Console.log)(...)
end

local v4 = "error"

return {
	invariant = setmetatable({
		debug = v11,
		log = Log1,
		warn = Warn,
		error = function(...) --[[ Line: 54 ]]
			-- upvalues: Array (copy), list (copy), v4 (copy), Log (ref), Boolean (copy), Console (copy)
			if Log > Array.indexOf(list, v4) then return end
			return (Boolean.toJSBoolean(Console[v4]) and Console[v4] or Console.log)(...)
		end
	}, {
		__call = function(_, p1, p2) --[[ Line: 72 ]]
			-- upvalues: Boolean (copy), self (copy)
			if not Boolean.toJSBoolean(p1) then
				error(self.new(p2))
			end
		end
	}),
	InvariantError = self,
	setVerbosity = function(p1) --[[ Line: 77 ]]
		-- upvalues: list (copy), Log (ref), Array (copy)
		local Entry = list[Log]
		Log = math.max(1, Array.indexOf(list, p1))
		
		return Entry
	end
}