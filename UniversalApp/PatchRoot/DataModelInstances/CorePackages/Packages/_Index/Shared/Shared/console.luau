local parent = script.Parent
local parent_1 = parent.Parent
local reactGlobalsModule = require(parent_1.ReactGlobals)
local console = require(parent_1.LuauPolyfill).console
local consoleWithStackDevModule = require(parent.consoleWithStackDev)

return if reactGlobalsModule.__DEV__ then setmetatable({
	warn = consoleWithStackDevModule.warn,
	error = consoleWithStackDevModule.error
}, { __index = console }) else console