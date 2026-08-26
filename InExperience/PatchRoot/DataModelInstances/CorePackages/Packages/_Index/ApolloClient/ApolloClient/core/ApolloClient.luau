local t = {}
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local setTimeout = luauPolyfillModule.setTimeout
local promiseModule = require(parent_1.Promise)
local _ = require(parent_1.GraphQL)
local invariantModule = require(parent.jsutils.invariant)
local invariant = invariantModule.invariant
local invariantError = invariantModule.InvariantError
local coreModule = require(script.Parent.Parent.link.core)
local apolloLink = coreModule.ApolloLink
local execute = coreModule.execute
local _ = require(script.Parent.Parent.cache)
local compact = require(script.Parent.Parent.utilities).compact
local version = require(script.Parent.Parent.version).version
local httpLink = require(script.Parent.Parent.link.http).HttpLink
local queryManager = require(script.Parent.QueryManager).QueryManager
local _ = require(script.Parent.ObservableQuery_types)
local _ = require(parent.core.types)
local _ = require(script.Parent.watchQueryOptions_types)
local _ = require(script.Parent.watchQueryOptions)
local localState = require(script.Parent.LocalState).LocalState
local _ = require(script.Parent.ApolloClient_types)

local function mergeOptions(p1, p2)
	-- upvalues: compact (ref), boolean (ref), object (ref)
	return compact(p1, p2, boolean.toJSBoolean(p2.variables) and ({
		variables = object.assign({}, p1.variables, p2.variables)
	} or p2.variables))
end

t.mergeOptions = mergeOptions
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref), boolean (ref), httpLink (ref), apolloLink (ref), invariantError (ref), setTimeout (ref), version (ref), localState (ref), queryManager (ref)
	local tbl = setmetatable({}, t_1)
	tbl.defaultOptions = {}
	tbl.resetStoreCallbacks = {}
	tbl.clearStoreCallbacks = {}
	local uri = p1.uri
	local credentials = p1.credentials
	local headers = p1.headers
	local cache = p1.cache
	local defaultOptions = p1.defaultOptions
	local resolvers = p1.resolvers
	local typeDefs = p1.typeDefs
	local fragmentMatcher = p1.fragmentMatcher
	local name = p1.name
	local version_1 = p1.version
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var1 = if p1.ssrMode == nil then false else p1.ssrMode
	local var2 = if p1.ssrForceFetchDelay == nil then 0 else p1.ssrForceFetchDelay
	local var3 = if p1.connectToDevTools == nil then typeof(_G) == "table" and (not boolean.toJSBoolean(_G.__APOLLO_CLIENT__) and _G.__DEV__) else p1.connectToDevTools
	local var4 = p1.queryDeduplication == nil or p1.queryDeduplication
	local var5 = if p1.assumeImmutableResults == nil then false else p1.assumeImmutableResults
	local link = p1.link
	
	if not boolean.toJSBoolean(link) then
		link = if boolean.toJSBoolean(uri) then httpLink.new({ uri = uri, credentials = credentials, headers = headers }) else apolloLink.empty()
	end
	if not boolean.toJSBoolean(cache) then
		error(invariantError.new("To initialize Apollo Client, you must specify a 'cache' property in the options object. \nFor more information, please visit: https://go.apollo.dev/c/docs"))
	end
	tbl.link = link
	tbl.cache = cache
	tbl.disableNetworkFetches = if boolean.toJSBoolean(var1) then var1 else var2 > 0
	tbl.queryDeduplication = var4
	tbl.defaultOptions = if boolean.toJSBoolean(defaultOptions) then defaultOptions else {}
	tbl.typeDefs = typeDefs
	
	if boolean.toJSBoolean(var2) then
		setTimeout(function()
			-- upvalues: tbl (ref)
			tbl.disableNetworkFetches = false
			
			return tbl.disableNetworkFetches
		end, var2)
	end
	tbl.version = version
	tbl.localState = localState.new({
		cache = cache,
		client = tbl,
		resolvers = resolvers,
		fragmentMatcher = fragmentMatcher
	})
	tbl.queryManager = queryManager.new({
		cache = tbl.cache,
		link = tbl.link,
		queryDeduplication = var4,
		ssrMode = var1,
		clientAwareness = { name = name, version = version_1 },
		localState = tbl.localState,
		assumeImmutableResults = var5,
		onBroadcast = if var3 then function() end else nil
	})
	
	return tbl
end

function t_1:stop()
	self.queryManager:stop()
end

function t_1:watchQuery(p1)
	-- upvalues: boolean (ref), mergeOptions (ref), object (ref)
	if boolean.toJSBoolean(self.defaultOptions.watchQuery) then
		p1 = mergeOptions(self.defaultOptions.watchQuery, p1)
	end
	if self.disableNetworkFetches and (p1.fetchPolicy == "network-only" or p1.fetchPolicy == "cache-and-network") then
		p1 = object.assign({}, p1, { fetchPolicy = "cache-first" })
	end
	return self.queryManager:watchQuery(p1)
end

function t_1:query(p1)
	-- upvalues: boolean (ref), mergeOptions (ref), invariant (ref), object (ref)
	if boolean.toJSBoolean(self.defaultOptions.query) then
		p1 = mergeOptions(self.defaultOptions.query, p1)
	end
	invariant(p1.fetchPolicy ~= "cache-and-network", "The cache-and-network fetchPolicy does not work with client.query, because client.query can only return a single result. Please use client.watchQuery to receive multiple results from the cache and the network, or consider using a different fetchPolicy, such as cache-first or network-only.")
	
	if self.disableNetworkFetches and p1.fetchPolicy == "network-only" then
		p1 = object.assign({}, p1, { fetchPolicy = "cache-first" })
	end
	return self.queryManager:query(p1)
end

function t_1:mutate(p1)
	-- upvalues: boolean (ref), mergeOptions (ref)
	if boolean.toJSBoolean(self.defaultOptions.mutate) then
		p1 = mergeOptions(self.defaultOptions.mutate, p1)
	end
	return self.queryManager:mutate(p1)
end

function t_1:subscribe(p1)
	return self.queryManager:startGraphQLSubscription(p1)
end

function t_1:readQuery(p1, p2)
	if p2 == nil then
		p2 = false
	end
	return self.cache:readQuery(p1, p2)
end

function t_1:readFragment(p1, p2)
	if p2 == nil then
		p2 = false
	end
	return self.cache:readFragment(p1, p2)
end

function t_1:writeQuery(p1)
	self.cache:writeQuery(p1)
	self.queryManager:broadcastQueries()
end

function t_1:writeFragment(p1)
	self.cache:writeFragment(p1)
	self.queryManager:broadcastQueries()
end

function t_1:__actionHookForDevTools(p1)
	self.devToolsHookCb = p1
end

function t_1:__requestRaw(p1)
	-- upvalues: execute (ref)
	return execute(self.link, p1)
end

function t_1.resetStore(value)
	-- upvalues: promiseModule (ref), array (ref)
	return promiseModule.delay(0):andThen(function()
		-- upvalues: value (ref)
		return value.queryManager:clearStore()
	end):andThen(function()
		-- upvalues: promiseModule (copy), array (copy), value (ref)
		return promiseModule.all(array.map(value.resetStoreCallbacks, function(p1)
			return p1()
		end))
	end):andThen(function()
		-- upvalues: value (ref)
		return value:reFetchObservableQueries()
	end)
end

function t_1.clearStore(p1)
	-- upvalues: promiseModule (ref), array (ref)
	return promiseModule.delay(0):andThen(function()
		-- upvalues: p1 (ref)
		return p1.queryManager:clearStore()
	end):andThen(function()
		-- upvalues: promiseModule (copy), array (copy), p1 (ref)
		return promiseModule.all(array.map(p1.clearStoreCallbacks, function(p2)
			return p2()
		end))
	end)
end

function t_1:onResetStore(p1)
	-- upvalues: array (ref)
	table.insert(self.resetStoreCallbacks, p1)
	
	return function()
		-- upvalues: self (ref), array (copy), p1 (ref)
		self.resetStoreCallbacks = array.filter(self.resetStoreCallbacks, function(p2)
			-- upvalues: p1 (copy)
			return p2 ~= p1
		end)
	end
end

function t_1:onClearStore(p1)
	-- upvalues: array (ref)
	table.insert(self.clearStoreCallbacks, p1)
	
	return function()
		-- upvalues: self (ref), array (copy), p1 (ref)
		self.clearStoreCallbacks = array.filter(self.clearStoreCallbacks, function(p2)
			-- upvalues: p1 (copy)
			return p2 ~= p1
		end)
	end
end

function t_1:reFetchObservableQueries(p1)
	return self.queryManager:reFetchObservableQueries(p1)
end

function t_1:refetchQueries(p1)
	-- upvalues: promiseModule (ref), invariant (ref)
	local var1 = self.queryManager:refetchQueries(p1)
	local t = {}
	local t_1 = {}
	var1:forEach(function(p2, p3)
		-- upvalues: t (ref), t_1 (ref)
		table.insert(t, p3)
		table.insert(t_1, p2)
	end)
	local var2 = promiseModule.all(t_1)
	var2.queries = t
	var2.results = t_1
	var2:catch(function(p2)
		-- upvalues: invariant (copy)
		invariant.debug(("In client.refetchQueries, Promise.all promise rejected with error %s"):format(p2.message))
	end)
	
	return var2
end

function t_1:getObservableQueries(p1)
	if p1 == nil then
		p1 = "active"
	end
	return self.queryManager:getObservableQueries(p1)
end

function t_1:extract(p1)
	return self.cache:extract(p1)
end

function t_1:restore(p1)
	return self.cache:restore(p1)
end

function t_1:addResolvers(p1)
	self.localState:addResolvers(p1)
end

function t_1:setResolvers(p1)
	self.localState:setResolvers(p1)
end

function t_1:getResolvers()
	return self.localState:getResolvers()
end

function t_1:setLocalStateFragmentMatcher(p1)
	self.localState:setFragmentMatcher(p1)
end

function t_1:setLink(p1)
	self.queryManager.link = p1
	self.link = self.queryManager.link
end

t.ApolloClient = t_1

return t