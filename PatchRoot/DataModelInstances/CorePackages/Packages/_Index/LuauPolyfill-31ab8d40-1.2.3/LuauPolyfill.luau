-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:43 2026 Pacific Standard Time.

local parent = script.Parent
local booleanModule = require(parent.Boolean)
local collectionsModule = require(parent.Collections)
local consoleModule = require(parent.Console)
local mathModule = require(parent.Math)
local numberModule = require(parent.Number)
local stringModule = require(parent.String)
local symbolModule = require(parent.Symbol)
local timersModule = require(parent.Timers)
local _ = require(parent.ES7Types)
local _ = require(script.Promise)

return {
	Array = collectionsModule.Array,
	AssertionError = require(script.AssertionError),
	Boolean = booleanModule,
	console = consoleModule,
	Error = require(script.Error),
	extends = require(script.extends),
	instanceof = require(parent.InstanceOf),
	Math = mathModule,
	Number = numberModule,
	Object = collectionsModule.Object,
	Map = collectionsModule.Map,
	coerceToMap = collectionsModule.coerceToMap,
	coerceToTable = collectionsModule.coerceToTable,
	Set = collectionsModule.Set,
	WeakMap = collectionsModule.WeakMap,
	String = stringModule,
	Symbol = symbolModule,
	setTimeout = timersModule.setTimeout,
	clearTimeout = timersModule.clearTimeout,
	setInterval = timersModule.setInterval,
	clearInterval = timersModule.clearInterval,
	util = { inspect = collectionsModule.inspect }
}