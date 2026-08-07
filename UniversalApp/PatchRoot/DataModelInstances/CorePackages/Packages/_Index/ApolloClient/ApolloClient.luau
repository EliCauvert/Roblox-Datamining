local t = {}
local object = require(script.Parent.LuauPolyfill).Object
local coreModule = require(script.core)
object.assign(t, coreModule)
t.None = coreModule.None
object.assign(t, require(script.react))

return t