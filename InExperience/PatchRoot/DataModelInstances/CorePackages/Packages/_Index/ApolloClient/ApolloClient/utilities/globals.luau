local t = { DEV = require(script.DEV).default }
local removeTemporaryGlobals = require(script.graphql).removeTemporaryGlobals
t.removeTemporaryGlobals = removeTemporaryGlobals
t.NULL = require(script.null).NULL
removeTemporaryGlobals()

return t