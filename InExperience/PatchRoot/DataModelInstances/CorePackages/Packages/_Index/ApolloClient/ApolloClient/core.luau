local Parent = script.Parent
local Parent1 = Parent.Parent
local Object = require(Parent1.LuauPolyfill).Object
local DEV = require(Parent.utilities).DEV
local ApolloClientModule = require(script.ApolloClient)
local ObservableQueryModule = require(script.ObservableQuery)
local _ = require(script.watchQueryOptions)
local CoreModule = {
	ApolloClient = ApolloClientModule.ApolloClient,
	mergeOptions = ApolloClientModule.mergeOptions,
	applyNextFetchPolicy = ObservableQueryModule.applyNextFetchPolicy,
	ObservableQuery = ObservableQueryModule.ObservableQuery,
	NetworkStatus = require(script.networkStatus).NetworkStatus
}
Object.assign(CoreModule, (require(script.types)))
local _ = require(script.LocalState)
local ErrorsModule = require(script.Parent.errors)
CoreModule.isApolloError = ErrorsModule.isApolloError
CoreModule.ApolloError = ErrorsModule.ApolloError
local CacheModule = require(script.Parent.cache)
CoreModule.ApolloCache = CacheModule.ApolloCache
CoreModule.defaultDataIdFromObject = CacheModule.defaultDataIdFromObject
CoreModule.InMemoryCache = CacheModule.InMemoryCache
CoreModule.MissingFieldError = CacheModule.MissingFieldError
CoreModule.makeVar = CacheModule.makeVar
CoreModule.None = CacheModule.None
Object.assign(CoreModule, (require(script.Parent.cache.inmemory.types)))
Object.assign(CoreModule, (require(script.Parent.link.core)))
Object.assign(CoreModule, (require(script.Parent.link.http)))
local UtilsModule = require(script.Parent.link.utils)
CoreModule.fromError = UtilsModule.fromError
CoreModule.toPromise = UtilsModule.toPromise
CoreModule.fromPromise = UtilsModule.fromPromise
CoreModule.throwServerError = UtilsModule.throwServerError
local UtilitiesModule = require(script.Parent.utilities)
CoreModule.Observable = UtilitiesModule.Observable
CoreModule.isReference = UtilitiesModule.isReference
CoreModule.makeReference = UtilitiesModule.makeReference
CoreModule.NULL = UtilitiesModule.NULL
local SetVerbosityFunction: (any) -> () = require(Parent.jsutils.invariant).setVerbosity
CoreModule.setLogVerbosity = SetVerbosityFunction
SetVerbosityFunction(if DEV then "log" else "silent")
local GraphQLTagModule = require(Parent1.GraphQLTag)
CoreModule.gql = GraphQLTagModule.default
CoreModule.resetCaches = GraphQLTagModule.resetCaches
CoreModule.disableFragmentWarnings = GraphQLTagModule.disableFragmentWarnings
CoreModule.enableExperimentalFragmentVariables = GraphQLTagModule.enableExperimentalFragmentVariables
CoreModule.disableExperimentalFragmentVariables = GraphQLTagModule.disableExperimentalFragmentVariables

return CoreModule