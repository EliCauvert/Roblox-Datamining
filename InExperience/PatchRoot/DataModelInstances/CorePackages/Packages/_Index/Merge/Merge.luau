local object = require(script.Parent.LuauPolyfill).Object
local t = {}
object.assign(t, require(script["merge-resolvers"]))
object.assign(t, require(script["typedefs-mergers"]))
object.assign(t, require(script.extensions))

return t