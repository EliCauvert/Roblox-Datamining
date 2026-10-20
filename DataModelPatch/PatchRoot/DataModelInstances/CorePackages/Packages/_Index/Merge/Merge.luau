local Object = require(script.Parent.LuauPolyfill).Object
local MergeModule = {}
Object.assign(MergeModule, (require(script["merge-resolvers"])))
Object.assign(MergeModule, (require(script["typedefs-mergers"])))
Object.assign(MergeModule, (require(script.extensions)))

return MergeModule