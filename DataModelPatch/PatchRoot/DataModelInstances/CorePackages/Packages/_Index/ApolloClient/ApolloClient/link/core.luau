local CoreModule = {}
local Parent = script.Parent.Parent
local Object = require(Parent.Parent.LuauPolyfill).Object
local DEV = require(Parent.utilities).DEV
require(Parent.jsutils.invariant).invariant(typeof(DEV) == "boolean", (tostring(DEV)))
CoreModule.empty = require(script.empty).empty
CoreModule.from = require(script.from).from
CoreModule.split = require(script.split).split
CoreModule.concat = require(script.concat).concat
CoreModule.execute = require(script.execute).execute
CoreModule.ApolloLink = require(script.ApolloLink).ApolloLink
Object.assign(CoreModule, (require(script.types)))

return CoreModule