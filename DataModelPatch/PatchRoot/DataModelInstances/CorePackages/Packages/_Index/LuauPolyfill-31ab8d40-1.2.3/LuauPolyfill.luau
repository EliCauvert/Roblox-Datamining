local Parent = script.Parent
local CollectionsModule = require(Parent.Collections)
local TimersModule = require(Parent.Timers)
local _ = require(Parent.ES7Types)
local _ = require(script.Promise)

return {
	Array = CollectionsModule.Array,
	AssertionError = require(script.AssertionError),
	Boolean = require(Parent.Boolean),
	console = require(Parent.Console),
	Error = require(script.Error),
	extends = require(script.extends),
	instanceof = require(Parent.InstanceOf),
	Math = require(Parent.Math),
	Number = require(Parent.Number),
	Object = CollectionsModule.Object,
	Map = CollectionsModule.Map,
	coerceToMap = CollectionsModule.coerceToMap,
	coerceToTable = CollectionsModule.coerceToTable,
	Set = CollectionsModule.Set,
	WeakMap = CollectionsModule.WeakMap,
	String = require(Parent.String),
	Symbol = require(Parent.Symbol),
	setTimeout = TimersModule.setTimeout,
	clearTimeout = TimersModule.clearTimeout,
	setInterval = TimersModule.setInterval,
	clearInterval = TimersModule.clearInterval,
	util = { inspect = CollectionsModule.inspect }
}