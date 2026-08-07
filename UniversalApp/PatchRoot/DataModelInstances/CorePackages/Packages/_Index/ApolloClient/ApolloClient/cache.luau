local t = {}
local parent = script.Parent
local object = require(parent.Parent.LuauPolyfill).Object
local DEV = require(script.Parent.utilities).DEV
require(parent.jsutils.invariant).invariant(typeof(DEV) == "boolean", DEV)
t.ApolloCache = require(script.core.cache).ApolloCache
local _ = require(script.core.types.Cache)
local _ = require(script.core.types.DataProxy)
t.MissingFieldError = require(script.core.types.common).MissingFieldError
local storeUtilsModule = require(script.Parent.utilities.graphql.storeUtils)
t.isReference = storeUtilsModule.isReference
t.makeReference = storeUtilsModule.makeReference
t.EntityStore = require(script.inmemory.entityStore).EntityStore
t.fieldNameFromStoreName = require(script.inmemory.helpers).fieldNameFromStoreName
t.InMemoryCache = require(script.inmemory.inMemoryCache).InMemoryCache
local reactiveVarsModule = require(script.inmemory.reactiveVars)
t.makeVar = reactiveVarsModule.makeVar
t.cacheSlot = reactiveVarsModule.cacheSlot
local policiesModule = require(script.inmemory.policies)
t.defaultDataIdFromObject = policiesModule.defaultDataIdFromObject
t.Policies = policiesModule.Policies
t.None = policiesModule.None
t.canonicalStringify = require(script.inmemory["object-canon"]).canonicalStringify
object.assign(t, require(script.inmemory.types))

return t