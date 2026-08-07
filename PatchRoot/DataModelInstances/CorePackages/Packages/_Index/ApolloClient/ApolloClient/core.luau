-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:14 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent
local parent_1 = parent.Parent
local object = require(parent_1.LuauPolyfill).Object
local DEV = require(parent.utilities).DEV
local apolloClientModule = require(script.ApolloClient)
t.ApolloClient = apolloClientModule.ApolloClient
t.mergeOptions = apolloClientModule.mergeOptions
local observableQueryModule = require(script.ObservableQuery)
t.applyNextFetchPolicy = observableQueryModule.applyNextFetchPolicy
t.ObservableQuery = observableQueryModule.ObservableQuery
local _ = require(script.watchQueryOptions)
t.NetworkStatus = require(script.networkStatus).NetworkStatus
object.assign(t, require(script.types))
local _ = require(script.LocalState)
local errorsModule = require(script.Parent.errors)
t.isApolloError = errorsModule.isApolloError
t.ApolloError = errorsModule.ApolloError
local cacheModule = require(script.Parent.cache)
t.ApolloCache = cacheModule.ApolloCache
t.defaultDataIdFromObject = cacheModule.defaultDataIdFromObject
t.InMemoryCache = cacheModule.InMemoryCache
t.MissingFieldError = cacheModule.MissingFieldError
t.makeVar = cacheModule.makeVar
t.None = cacheModule.None
object.assign(t, require(script.Parent.cache.inmemory.types))
object.assign(t, require(script.Parent.link.core))
object.assign(t, require(script.Parent.link.http))
local utilsModule = require(script.Parent.link.utils)
t.fromError = utilsModule.fromError
t.toPromise = utilsModule.toPromise
t.fromPromise = utilsModule.fromPromise
t.throwServerError = utilsModule.throwServerError
local utilitiesModule = require(script.Parent.utilities)
t.Observable = utilitiesModule.Observable
t.isReference = utilitiesModule.isReference
t.makeReference = utilitiesModule.makeReference
t.NULL = utilitiesModule.NULL
local setVerbosity = require(parent.jsutils.invariant).setVerbosity
t.setLogVerbosity = setVerbosity
setVerbosity(if DEV then "log" else "silent")
local graphQLTagModule = require(parent_1.GraphQLTag)
t.gql = graphQLTagModule.default
t.resetCaches = graphQLTagModule.resetCaches
t.disableFragmentWarnings = graphQLTagModule.disableFragmentWarnings
t.enableExperimentalFragmentVariables = graphQLTagModule.enableExperimentalFragmentVariables
t.disableExperimentalFragmentVariables = graphQLTagModule.disableExperimentalFragmentVariables

return t