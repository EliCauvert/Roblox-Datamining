local Parent = script.Parent
local Parent1 = Parent.Parent
local Console = require(Parent1.LuauPolyfill).console
local ConsoleWithStackDevModule = require(Parent.consoleWithStackDev)

return if require(Parent1.ReactGlobals).__DEV__ then setmetatable({
	warn = ConsoleWithStackDevModule.warn,
	error = ConsoleWithStackDevModule.error
}, { __index = Console }) else Console