local parent = script.Parent
local arrayModule = require(script.Array)
local mapModule = require(script.Map)
local _ = require(parent.ES7Types)

return {
	Array = arrayModule,
	Object = require(script.Object),
	Map = mapModule.Map,
	coerceToMap = mapModule.coerceToMap,
	coerceToTable = mapModule.coerceToTable,
	Set = require(script.Set),
	WeakMap = require(script.WeakMap),
	inspect = require(script.inspect)
}