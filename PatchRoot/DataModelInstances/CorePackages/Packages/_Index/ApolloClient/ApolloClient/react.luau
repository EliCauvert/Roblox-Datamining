-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent
local object = require(parent.Parent.LuauPolyfill).Object
local DEV = require(parent.utilities).DEV
require(parent.jsutils.invariant).invariant(typeof(DEV) == "boolean", tostring(DEV))
local contextModule = require(script.context)
t.ApolloProvider = contextModule.ApolloProvider
t.ApolloConsumer = contextModule.ApolloConsumer
t.getApolloContext = contextModule.getApolloContext
t.resetApolloContext = contextModule.resetApolloContext
object.assign(t, require(script.hooks))
local parserModule = require(script.parser)
t.DocumentType = parserModule.DocumentType
t.operationName = parserModule.operationName
t.parser = parserModule.parser
object.assign(t, require(script.types.types))

return t