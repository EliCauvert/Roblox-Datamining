local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local PromiseModule = require(Parent1.Promise)
local _ = require(Parent1.GraphQL)
local InvariantModule = require(Parent.jsutils.invariant)
local InvariantFunction = InvariantModule.invariant
local InvariantError = InvariantModule.InvariantError
local CoreModule = require(script.Parent.Parent.link.core)
local ApolloLink = CoreModule.ApolloLink
local ExecuteFunction = CoreModule.execute
local _ = require(script.Parent.Parent.cache)
local CompactFunction = require(script.Parent.Parent.utilities).compact
local Version = require(script.Parent.Parent.version).version
local HttpLink = require(script.Parent.Parent.link.http).HttpLink
local QueryManager = require(script.Parent.QueryManager).QueryManager
local _ = require(script.Parent.ObservableQuery_types)
local _ = require(Parent.core.types)
local _ = require(script.Parent.watchQueryOptions_types)
local _ = require(script.Parent.watchQueryOptions)
local LocalState = require(script.Parent.LocalState).LocalState
local _ = require(script.Parent.ApolloClient_types)

local function mergeOptions(Mutate, AssignResult) --[[ Line: 133 ]]
	-- upvalues: CompactFunction (copy), Boolean (copy), Object (copy)
	return CompactFunction(Mutate, AssignResult, Boolean.toJSBoolean(AssignResult.variables) and {
		variables = Object.assign({}, Mutate.variables, AssignResult.variables)
	} or AssignResult.variables)
end

local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 189 ]]
	-- upvalues: Module (copy), Boolean (copy), HttpLink (copy), ApolloLink (copy), InvariantError (copy), SetTimeoutFunction (copy), Version (copy), LocalState (copy), QueryManager (copy)
	local self = setmetatable({}, Module)
	self.defaultOptions = {}
	self.resetStoreCallbacks = {}
	self.clearStoreCallbacks = {}
	local Uri = p1.uri
	local Credentials = p1.credentials
	local Headers = p1.headers
	local Cache = p1.cache
	local DefaultOptions = p1.defaultOptions
	local Resolvers = p1.resolvers
	local TypeDefs = p1.typeDefs
	local FragmentMatcher = p1.fragmentMatcher
	local Name = p1.name
	local Version1 = p1.version
	local SsrMode = p1.ssrMode ~= nil and p1.ssrMode
	local SsrForceFetchDelay = if p1.ssrForceFetchDelay == nil then 0 else p1.ssrForceFetchDelay
	local DEV = if p1.connectToDevTools == nil then typeof(_G) == "table" and (not Boolean.toJSBoolean(_G.__APOLLO_CLIENT__) and _G.__DEV__) else p1.connectToDevTools
	local NoQueryDeduplication = p1.queryDeduplication == nil or p1.queryDeduplication
	local AssumeImmutableResults = p1.assumeImmutableResults ~= nil and p1.assumeImmutableResults
	local Link = p1.link
	
	if not Boolean.toJSBoolean(Link) then
		Link = if Boolean.toJSBoolean(Uri) then HttpLink.new({ uri = Uri, credentials = Credentials, headers = Headers }) else ApolloLink.empty()
	end
	if not Boolean.toJSBoolean(Cache) then
		error(InvariantError.new("To initialize Apollo Client, you must specify a 'cache' property in the options object. \nFor more information, please visit: https://go.apollo.dev/c/docs"))
	end
	self.link = Link
	self.cache = Cache
	self.disableNetworkFetches = Boolean.toJSBoolean(SsrMode) and SsrMode or SsrForceFetchDelay > 0
	self.queryDeduplication = NoQueryDeduplication
	self.defaultOptions = Boolean.toJSBoolean(DefaultOptions) and DefaultOptions or {}
	self.typeDefs = TypeDefs
	
	if Boolean.toJSBoolean(SsrForceFetchDelay) then
		SetTimeoutFunction(function() --[[ Line: 271 ]]
			-- upvalues: self (copy)
			self.disableNetworkFetches = false
			
			return self.disableNetworkFetches
		end, SsrForceFetchDelay)
	end
	self.version = Version
	self.localState = LocalState.new({
		cache = Cache,
		client = self,
		resolvers = Resolvers,
		fragmentMatcher = FragmentMatcher
	})
	self.queryManager = QueryManager.new({
		cache = self.cache,
		link = self.link,
		queryDeduplication = NoQueryDeduplication,
		ssrMode = SsrMode,
		clientAwareness = { name = Name, version = Version1 },
		localState = self.localState,
		assumeImmutableResults = AssumeImmutableResults,
		onBroadcast = if DEV then function() --[[ Line: 425 ]] end else nil
	})
	
	return self
end

function Module:stop() --[[ Line: 438 ]]
	self.queryManager:stop()
end

function Module:watchQuery(AssignResult) --[[ Line: 461 ]]
	-- upvalues: Boolean (copy), mergeOptions (copy), Object (copy)
	if Boolean.toJSBoolean(self.defaultOptions.watchQuery) then
		AssignResult = mergeOptions(self.defaultOptions.watchQuery, AssignResult)
	end
	if self.disableNetworkFetches and (AssignResult.fetchPolicy == "network-only" or AssignResult.fetchPolicy == "cache-and-network") then
		AssignResult = Object.assign({}, AssignResult, { fetchPolicy = "cache-first" })
	end
	return self.queryManager:watchQuery(AssignResult)
end

function Module:query(AssignResult) --[[ Line: 486 ]]
	-- upvalues: Boolean (copy), mergeOptions (copy), InvariantFunction (copy), Object (copy)
	if Boolean.toJSBoolean(self.defaultOptions.query) then
		AssignResult = mergeOptions(self.defaultOptions.query, AssignResult)
	end
	InvariantFunction(AssignResult.fetchPolicy ~= "cache-and-network", "The cache-and-network fetchPolicy does not work with client.query, because client.query can only return a single result. Please use client.watchQuery to receive multiple results from the cache and the network, or consider using a different fetchPolicy, such as cache-first or network-only.")
	
	if self.disableNetworkFetches and AssignResult.fetchPolicy == "network-only" then
		AssignResult = Object.assign({}, AssignResult, { fetchPolicy = "cache-first" })
	end
	return self.queryManager:query(AssignResult)
end

function Module:mutate(p1) --[[ Line: 513 ]]
	-- upvalues: Boolean (copy), mergeOptions (copy)
	if Boolean.toJSBoolean(self.defaultOptions.mutate) then
		p1 = mergeOptions(self.defaultOptions.mutate, p1)
	end
	return self.queryManager:mutate(p1)
end

function Module:subscribe(p1) --[[ Line: 526 ]]
	return self.queryManager:startGraphQLSubscription(p1)
end

function Module:readQuery(p1, p2: boolean) --[[ Line: 539 ]]
	if p2 == nil then
		p2 = false
	end
	return self.cache:readQuery(p1, p2)
end

function Module:readFragment(p1, p2: boolean) --[[ Line: 560 ]]
	if p2 == nil then
		p2 = false
	end
	return self.cache:readFragment(p1, p2)
end

function Module:writeQuery(p1) --[[ Line: 572 ]]
	self.cache:writeQuery(p1)
	self.queryManager:broadcastQueries()
end

function Module:writeFragment(p1) --[[ Line: 588 ]]
	self.cache:writeFragment(p1)
	self.queryManager:broadcastQueries()
end

function Module:__actionHookForDevTools(DevToolsHookCb) --[[ Line: 593 ]]
	self.devToolsHookCb = DevToolsHookCb
end

function Module:__requestRaw(p1) --[[ Line: 597 ]]
	-- upvalues: ExecuteFunction (copy)
	return ExecuteFunction(self.link, p1)
end

function Module.resetStore(p1) --[[ Line: 617 ]]
	-- upvalues: PromiseModule (copy), Array (copy)
	return PromiseModule.delay(0):andThen(function() --[[ Line: 619 ]]
		-- upvalues: p1 (copy)
		return p1.queryManager:clearStore()
	end):andThen(function() --[[ Line: 622 ]]
		-- upvalues: PromiseModule (upval), Array (upval), p1 (copy)
		return PromiseModule.all(Array.map(p1.resetStoreCallbacks, function(Callback) --[[ Line: 623 ]]
			return Callback()
		end))
	end):andThen(function() --[[ Line: 627 ]]
		-- upvalues: p1 (copy)
		return p1:reFetchObservableQueries()
	end)
end

function Module.clearStore(p1) --[[ Line: 636 ]]
	-- upvalues: PromiseModule (copy), Array (copy)
	return PromiseModule.delay(0):andThen(function() --[[ Line: 638 ]]
		-- upvalues: p1 (copy)
		return p1.queryManager:clearStore()
	end):andThen(function() --[[ Line: 641 ]]
		-- upvalues: PromiseModule (upval), Array (upval), p1 (copy)
		return PromiseModule.all(Array.map(p1.clearStoreCallbacks, function(Callback) --[[ Line: 642 ]]
			return Callback()
		end))
	end)
end

function Module:onResetStore(p1) --[[ Line: 653 ]]
	-- upvalues: Array (copy)
	table.insert(self.resetStoreCallbacks, p1)
	
	return function() --[[ Line: 655 ]]
		-- upvalues: self (copy), Array (upval), p1 (copy)
		self.resetStoreCallbacks = Array.filter(self.resetStoreCallbacks, function(p2): boolean --[[ Line: 656 ]]
			-- upvalues: p1 (upval)
			return p2 ~= p1
		end)
	end
end

function Module:onClearStore(p1) --[[ Line: 667 ]]
	-- upvalues: Array (copy)
	table.insert(self.clearStoreCallbacks, p1)
	
	return function() --[[ Line: 669 ]]
		-- upvalues: self (copy), Array (upval), p1 (copy)
		self.clearStoreCallbacks = Array.filter(self.clearStoreCallbacks, function(p2): boolean --[[ Line: 670 ]]
			-- upvalues: p1 (upval)
			return p2 ~= p1
		end)
	end
end

function Module:reFetchObservableQueries(p1) --[[ Line: 688 ]]
	return self.queryManager:reFetchObservableQueries(p1)
end

function Module:refetchQueries(p1) --[[ Line: 703 ]]
	-- upvalues: PromiseModule (copy), InvariantFunction (copy)
	local Queries = {}
	local Results = {}
	self.queryManager:refetchQueries(p1):forEach(function(p2, p3) --[[ Line: 708 ]]
		-- upvalues: Queries (copy), Results (copy)
		table.insert(Queries, p3)
		table.insert(Results, p2)
	end)
	local AllResult = PromiseModule.all(Results)
	AllResult.queries = Queries
	AllResult.results = Results
	AllResult:catch(function(Err) --[[ Line: 723 ]]
		-- upvalues: InvariantFunction (upval)
		InvariantFunction.debug(("In client.refetchQueries, Promise.all promise rejected with error %s"):format(Err.message))
	end)
	
	return AllResult
end

function Module:getObservableQueries(p1: string) --[[ Line: 738 ]]
	if p1 == nil then
		p1 = "active"
	end
	return self.queryManager:getObservableQueries(p1)
end

function Module:extract(p1) --[[ Line: 748 ]]
	return self.cache:extract(p1)
end

function Module:restore(p1) --[[ Line: 759 ]]
	return self.cache:restore(p1)
end

function Module:addResolvers(p1) --[[ Line: 766 ]]
	self.localState:addResolvers(p1)
end

function Module:setResolvers(p1) --[[ Line: 773 ]]
	self.localState:setResolvers(p1)
end

function Module:getResolvers() --[[ Line: 780 ]]
	return self.localState:getResolvers()
end

function Module:setLocalStateFragmentMatcher(p1) --[[ Line: 787 ]]
	self.localState:setFragmentMatcher(p1)
end

function Module:setLink(Link) --[[ Line: 794 ]]
	self.queryManager.link = Link
	self.link = self.queryManager.link
end

return { mergeOptions = mergeOptions, ApolloClient = Module }