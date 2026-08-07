-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:19 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent
local reactGlobalsModule = require(parent_1.ReactGlobals)
local console = require(parent_1.LuauPolyfill).console
local consoleWithStackDevModule = require(parent.consoleWithStackDev)

return if reactGlobalsModule.__DEV__ then setmetatable({
	warn = consoleWithStackDevModule.warn,
	error = consoleWithStackDevModule.error
}, { __index = console }) else console