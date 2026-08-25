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

local function mergeOptions(p0, p1)
	-- upvalues: compact (ref), boolean (ref), object (ref)
	return compact(p0, p1, boolean.toJSBoolean(p1.variables) and ({
		variables = object.assign({}, p0.variables, p1.variables)
	} or p1.variables))
end

t.mergeOptions = mergeOptions
local t_1 = {}
t_1.__index = t_1

function t_1.new(p2)
	-- upvalues: t_1 (ref), boolean (ref), httpLink (ref), apolloLink (ref), invariantError (ref), setTimeout (ref), version (ref), localState (ref), queryManager (ref)
	local tbl = setmetatable({}, t_1)
	tbl.defaultOptions = {}
	tbl.resetStoreCallbacks = {}
	tbl.clearStoreCallbacks = {}
	local uri = p2.uri
	local credentials = p2.credentials
	local headers = p2.headers
	local cache = p2.cache
	local defaultOptions = p2.defaultOptions
	local resolvers = p2.resolvers
	local typeDefs = p2.typeDefs
	local fragmentMatcher = p2.fragmentMatcher
	local name = p2.name
	local version_1 = p2.version
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var8 = if p2.ssrMode == nil then false else p2.ssrMode
	local var9 = if p2.ssrForceFetchDelay == nil then 0 else p2.ssrForceFetchDelay
	local var10 = if p2.connectToDevTools == nil then typeof(_G) == "table" and (not boolean.toJSBoolean(_G.__APOLLO_CLIENT__) and _G.__DEV__) else p2.connectToDevTools
	local var11 = p2.queryDeduplication == nil or p2.queryDeduplication
	local var12 = if p2.assumeImmutableResults == nil then false else p2.assumeImmutableResults
	local link = p2.link
	
	if not boolean.toJSBoolean(link) then
		link = if boolean.toJSBoolean(uri) then httpLink.new({ uri = uri, credentials = credentials, headers = headers }) else apolloLink.empty()
	end
	if not boolean.toJSBoolean(cache) then
		error(invariantError.new("To initialize Apollo Client, you must specify a 'cache' property in the options object. \nFor more information, please visit: https://go.apollo.dev/c/docs"))
	end
	tbl.link = link
	tbl.cache = cache
	tbl.disableNetworkFetches = if boolean.toJSBoolean(var8) then var8 else var9 > 0
	tbl.queryDeduplication = var11
	tbl.defaultOptions = if boolean.toJSBoolean(defaultOptions) then defaultOptions else {}
	tbl.typeDefs = typeDefs
	
	if boolean.toJSBoolean(var9) then
		setTimeout(function()
			-- upvalues: tbl (ref)
			tbl.disableNetworkFetches = false
			
			return tbl.disableNetworkFetches
		end, var9)
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
		queryDeduplication = var11,
		ssrMode = var8,
		clientAwareness = { name = name, version = version_1 },
		localState = tbl.localState,
		assumeImmutableResults = var12,
		onBroadcast = if var10 then function() end else nil
	})
	
	return tbl
end

function t_1:stop()
	self.queryManager:stop()
end

function t_1:watchQuery(p3)
	-- upvalues: boolean (ref), mergeOptions (ref), object (ref)
	if boolean.toJSBoolean(self.defaultOptions.watchQuery) then
		p3 = mergeOptions(self.defaultOptions.watchQuery, p3)
	end
	if self.disableNetworkFetches and (p3.fetchPolicy == "network-only" or p3.fetchPolicy == "cache-and-network") then
		p3 = object.assign({}, p3, { fetchPolicy = "cache-first" })
	end
	return self.queryManager:watchQuery(p3)
end

function t_1:query(p4)
	-- upvalues: boolean (ref), mergeOptions (ref), invariant (ref), object (ref)
	if boolean.toJSBoolean(self.defaultOptions.query) then
		p4 = mergeOptions(self.defaultOptions.query, p4)
	end
	invariant(p4.fetchPolicy ~= "cache-and-network", "The cache-and-network fetchPolicy does not work with client.query, because client.query can only return a single result. Please use client.watchQuery to receive multiple results from the cache and the network, or consider using a different fetchPolicy, such as cache-first or network-only.")
	
	if self.disableNetworkFetches and p4.fetchPolicy == "network-only" then
		p4 = object.assign({}, p4, { fetchPolicy = "cache-first" })
	end
	return self.queryManager:query(p4)
end

function t_1:mutate(p5)
	-- upvalues: boolean (ref), mergeOptions (ref)
	if boolean.toJSBoolean(self.defaultOptions.mutate) then
		p5 = mergeOptions(self.defaultOptions.mutate, p5)
	end
	return self.queryManager:mutate(p5)
end

function t_1:subscribe(p6)
	return self.queryManager:startGraphQLSubscription(p6)
end

function t_1:readQuery(p7, p8)
	if p8 == nil then
		p8 = false
	end
	return self.cache:readQuery(p7, p8)
end

function t_1:readFragment(p9, p10)
	if p10 == nil then
		p10 = false
	end
	return self.cache:readFragment(p9, p10)
end

function t_1:writeQuery(p11)
	self.cache:writeQuery(p11)
	self.queryManager:broadcastQueries()
end

function t_1:writeFragment(p12)
	self.cache:writeFragment(p12)
	self.queryManager:broadcastQueries()
end

function t_1:__actionHookForDevTools(p13)
	self.devToolsHookCb = p13
end

function t_1:__requestRaw(p14)
	-- upvalues: execute (ref)
	return execute(self.link, p14)
end

function t_1.resetStore(value)
	-- upvalues: promiseModule (ref), array (ref)
	return promiseModule.delay(0):andThen(function()
		-- upvalues: value (ref)
		return value.queryManager:clearStore()
	end):andThen(function()
		-- upvalues: promiseModule (copy), array (copy), value (ref)
		return promiseModule.all(array.map(value.resetStoreCallbacks, function(p15)
			return p15()
		end))
	end):andThen(function()
		-- upvalues: value (ref)
		return value:reFetchObservableQueries()
	end)
end

function t_1.clearStore(p16)
	-- upvalues: promiseModule (ref), array (ref)
	return promiseModule.delay(0):andThen(function()
		-- upvalues: p16 (ref)
		return p16.queryManager:clearStore()
	end):andThen(function()
		-- upvalues: promiseModule (copy), array (copy), p16 (ref)
		return promiseModule.all(array.map(p16.clearStoreCallbacks, function(p17)
			return p17()
		end))
	end)
end

function t_1:onResetStore(p18)
	-- upvalues: array (ref)
	table.insert(self.resetStoreCallbacks, p18)
	
	return function()
		-- upvalues: self (ref), array (copy), p18 (ref)
		self.resetStoreCallbacks = array.filter(self.resetStoreCallbacks, function(p19)
			-- upvalues: p18 (copy)
			return p19 ~= p18
		end)
	end
end

function t_1:onClearStore(p20)
	-- upvalues: array (ref)
	table.insert(self.clearStoreCallbacks, p20)
	
	return function()
		-- upvalues: self (ref), array (copy), p20 (ref)
		self.clearStoreCallbacks = array.filter(self.clearStoreCallbacks, function(p21)
			-- upvalues: p20 (copy)
			return p21 ~= p20
		end)
	end
end

function t_1:reFetchObservableQueries(p22)
	return self.queryManager:reFetchObservableQueries(p22)
end

function t_1:refetchQueries(p23)
	-- upvalues: promiseModule (ref), invariant (ref)
	local var13 = self.queryManager:refetchQueries(p23)
	local t = {}
	local t_1 = {}
	var13:forEach(function(p24, p25)
		-- upvalues: t (ref), t_1 (ref)
		table.insert(t, p25)
		table.insert(t_1, p24)
	end)
	local var16 = promiseModule.all(t_1)
	var16.queries = t
	var16.results = t_1
	var16:catch(function(p26)
		-- upvalues: invariant (copy)
		invariant.debug(("In client.refetchQueries, Promise.all promise rejected with error %s"):format(p26.message))
	end)
	
	return var16
end

function t_1:getObservableQueries(p27)
	if p27 == nil then
		p27 = "active"
	end
	return self.queryManager:getObservableQueries(p27)
end

function t_1:extract(p28)
	return self.cache:extract(p28)
end

function t_1:restore(p29)
	return self.cache:restore(p29)
end

function t_1:addResolvers(p30)
	self.localState:addResolvers(p30)
end

function t_1:setResolvers(p31)
	self.localState:setResolvers(p31)
end

function t_1:getResolvers()
	return self.localState:getResolvers()
end

function t_1:setLocalStateFragmentMatcher(p32)
	self.localState:setFragmentMatcher(p32)
end

function t_1:setLink(p33)
	self.queryManager.link = p33
	self.link = self.queryManager.link
end

t.ApolloClient = t_1

return t