local MapModule = require(script.Map)
local _ = require(script.Parent.ES7Types)

return {
	Array = require(script.Array),
	Object = require(script.Object),
	Map = MapModule.Map,
	coerceToMap = MapModule.coerceToMap,
	coerceToTable = MapModule.coerceToTable,
	Set = require(script.Set),
	WeakMap = require(script.WeakMap),
	inspect = require(script.inspect)
}