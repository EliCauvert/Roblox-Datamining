local ReactModule = {}
local Parent = script.Parent
local Object = require(Parent.Parent.LuauPolyfill).Object
local DEV = require(Parent.utilities).DEV
require(Parent.jsutils.invariant).invariant(typeof(DEV) == "boolean", (tostring(DEV)))
local ContextModule = require(script.context)
ReactModule.ApolloProvider = ContextModule.ApolloProvider
ReactModule.ApolloConsumer = ContextModule.ApolloConsumer
ReactModule.getApolloContext = ContextModule.getApolloContext
ReactModule.resetApolloContext = ContextModule.resetApolloContext
Object.assign(ReactModule, (require(script.hooks)))
local ParserModule = require(script.parser)
ReactModule.DocumentType = ParserModule.DocumentType
ReactModule.operationName = ParserModule.operationName
ReactModule.parser = ParserModule.parser
Object.assign(ReactModule, (require(script.types.types)))

return ReactModule