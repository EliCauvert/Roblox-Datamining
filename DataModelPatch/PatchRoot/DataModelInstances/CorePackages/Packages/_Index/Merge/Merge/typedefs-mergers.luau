local Object = require(script.Parent.Parent.LuauPolyfill).Object
local Module = {}
Object.assign(Module, (require(script.arguments)))
Object.assign(Module, (require(script.directives)))
Object.assign(Module, (require(script["enum-values"])))
Object.assign(Module, (require(script.enum)))
Object.assign(Module, (require(script.fields)))
Object.assign(Module, (require(script["input-type"])))
Object.assign(Module, (require(script.interface)))
Object.assign(Module, (require(script["merge-named-type-array"])))
Object.assign(Module, (require(script["merge-nodes"])))
Object.assign(Module, (require(script["merge-typedefs"])))
Object.assign(Module, (require(script.scalar)))
Object.assign(Module, (require(script.type)))
Object.assign(Module, (require(script.union)))
Object.assign(Module, (require(script.utils)))

return Module