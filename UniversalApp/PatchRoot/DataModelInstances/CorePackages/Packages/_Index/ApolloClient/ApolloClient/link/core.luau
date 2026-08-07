local t = {}
local parent = script.Parent.Parent
local object = require(parent.Parent.LuauPolyfill).Object
local DEV = require(parent.utilities).DEV
require(parent.jsutils.invariant).invariant(typeof(DEV) == "boolean", tostring(DEV))
t.empty = require(script.empty).empty
t.from = require(script.from).from
t.split = require(script.split).split
t.concat = require(script.concat).concat
t.execute = require(script.execute).execute
t.ApolloLink = require(script.ApolloLink).ApolloLink
object.assign(t, require(script.types))

return t