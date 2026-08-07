local object = require(script.Parent.Parent.LuauPolyfill).Object
local t = {}
object.assign(t, require(script.arguments))
object.assign(t, require(script.directives))
object.assign(t, require(script["enum-values"]))
object.assign(t, require(script.enum))
object.assign(t, require(script.fields))
object.assign(t, require(script["input-type"]))
object.assign(t, require(script.interface))
object.assign(t, require(script["merge-named-type-array"]))
object.assign(t, require(script["merge-nodes"]))
object.assign(t, require(script["merge-typedefs"]))
object.assign(t, require(script.scalar))
object.assign(t, require(script.type))
object.assign(t, require(script.union))
object.assign(t, require(script.utils))

return t