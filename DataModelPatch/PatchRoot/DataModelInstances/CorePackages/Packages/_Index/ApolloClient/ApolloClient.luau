local ApolloClientModule = {}
local Object = require(script.Parent.LuauPolyfill).Object
local CoreModule = require(script.core)
Object.assign(ApolloClientModule, CoreModule)
ApolloClientModule.None = CoreModule.None
Object.assign(ApolloClientModule, (require(script.react)))

return ApolloClientModule