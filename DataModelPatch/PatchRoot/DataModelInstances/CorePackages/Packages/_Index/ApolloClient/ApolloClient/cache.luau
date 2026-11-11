local Cache = {}
local Parent = script.Parent
local Object = require(Parent.Parent.LuauPolyfill).Object
local DEV = require(script.Parent.utilities).DEV
require(Parent.jsutils.invariant).invariant(typeof(DEV) == "boolean", DEV)
Cache.ApolloCache = require(script.core.cache).ApolloCache
local _ = require(script.core.types.Cache)
local _ = require(script.core.types.DataProxy)
Cache.MissingFieldError = require(script.core.types.common).MissingFieldError
local StoreUtilsModule = require(script.Parent.utilities.graphql.storeUtils)
Cache.isReference = StoreUtilsModule.isReference
Cache.makeReference = StoreUtilsModule.makeReference
Cache.EntityStore = require(script.inmemory.entityStore).EntityStore
Cache.fieldNameFromStoreName = require(script.inmemory.helpers).fieldNameFromStoreName
Cache.InMemoryCache = require(script.inmemory.inMemoryCache).InMemoryCache
local ReactiveVarsModule = require(script.inmemory.reactiveVars)
Cache.makeVar = ReactiveVarsModule.makeVar
Cache.cacheSlot = ReactiveVarsModule.cacheSlot
local PoliciesModule = require(script.inmemory.policies)
Cache.defaultDataIdFromObject = PoliciesModule.defaultDataIdFromObject
Cache.Policies = PoliciesModule.Policies
Cache.None = PoliciesModule.None
Cache.canonicalStringify = require(script.inmemory["object-canon"]).canonicalStringify
Object.assign(Cache, (require(script.inmemory.types)))

return Cache