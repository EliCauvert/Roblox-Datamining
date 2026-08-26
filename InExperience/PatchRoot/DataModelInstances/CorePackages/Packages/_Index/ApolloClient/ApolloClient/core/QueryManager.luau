local t = {}
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local instanceof = luauPolyfillModule.instanceof
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local weakMap = luauPolyfillModule.WeakMap
local promiseModule = require(parent_1.Promise)
local httpService = game:GetService("HttpService")
local isCallableModule = require(parent.luaUtils.isCallable)
local toJSBoolean = require(parent.utilities.globals.null).toJSBoolean
local _ = require(parent_1.GraphQL)
local invariantModule = require(parent.jsutils.invariant)
local invariant = invariantModule.invariant
local invariantError = invariantModule.InvariantError
local equalModule = require(parent.jsutils.equal)
local execute = require(script.Parent.Parent.link.core).execute
local canonicalStringify = require(script.Parent.Parent.cache).canonicalStringify
local utilitiesModule = require(script.Parent.Parent.utilities)
local getDefaultValues = utilitiesModule.getDefaultValues
local getOperationDefinition = utilitiesModule.getOperationDefinition
local getOperationName = utilitiesModule.getOperationName
local hasClientExports = utilitiesModule.hasClientExports
local graphQLResultHasError = utilitiesModule.graphQLResultHasError
local removeConnectionDirectiveFromDocument = utilitiesModule.removeConnectionDirectiveFromDocument
local _ = utilitiesModule.canUseWeakMap
local observable = utilitiesModule.Observable
local asyncMap = utilitiesModule.asyncMap
local isNonEmptyArray = utilitiesModule.isNonEmptyArray
local concast = utilitiesModule.Concast
local makeUniqueId = utilitiesModule.makeUniqueId
local isDocumentNode = utilitiesModule.isDocumentNode
local isNonNullObject = utilitiesModule.isNonNullObject
local errorsModule = require(script.Parent.Parent.errors)
local apolloError = errorsModule.ApolloError
local isApolloError = errorsModule.isApolloError
local _ = require(script.Parent.watchQueryOptions_types)
local observableQueryModule = require(script.Parent.ObservableQuery)
local _ = require(script.Parent.ObservableQuery_types)
local observableQuery = observableQueryModule.ObservableQuery
local applyNextFetchPolicy = observableQueryModule.applyNextFetchPolicy
local networkStatusModule = require(script.Parent.networkStatus)
local networkStatus = networkStatusModule.NetworkStatus
local isNetworkRequestInFlight = networkStatusModule.isNetworkRequestInFlight
local _ = require(script.Parent.types)
local localState = require(script.Parent.LocalState).LocalState
local queryInfoModule = require(script.Parent.QueryInfo)
local queryInfo = queryInfoModule.QueryInfo
local shouldWriteResult = queryInfoModule.shouldWriteResult
local cacheWriteBehavior = queryInfoModule.CacheWriteBehavior
local hasOwnPropertyModule = require(parent.luaUtils.hasOwnProperty)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref), map (ref), weakMap (ref), localState (ref), boolean (ref)
	local cache = p1.cache
	local link = p1.link
	local queryDeduplication = p1.queryDeduplication
	local onBroadcast = p1.onBroadcast
	local ssrMode = p1.ssrMode
	local clientAwareness = p1.clientAwareness
	local localState_1 = p1.localState
	local assumeImmutableResults = p1.assumeImmutableResults
	
	if queryDeduplication == nil then
		queryDeduplication = false
	end
	if ssrMode == nil then
		ssrMode = false
	end
	if clientAwareness == nil then
		clientAwareness = {}
	end
	local tbl = setmetatable({}, t_1)
	tbl.clientAwareness = {}
	tbl.queries = map.new()
	tbl.fetchCancelFns = map.new()
	tbl.transformCache = weakMap.new()
	tbl.queryIdCounter = 1
	tbl.requestIdCounter = 1
	tbl.mutationIdCounter = 1
	tbl.inFlightLinkObservables = map.new()
	tbl.cache = cache
	tbl.link = link
	tbl.queryDeduplication = queryDeduplication
	tbl.clientAwareness = clientAwareness
	tbl.localState = localState_1 or localState.new({ cache = cache })
	tbl.ssrMode = ssrMode
	tbl.assumeImmutableResults = boolean.toJSBoolean(assumeImmutableResults)
	tbl.onBroadcast = onBroadcast
	
	if boolean.toJSBoolean(tbl.onBroadcast) then
		tbl.mutationStore = {}
	end
	return tbl
end

function t_1:stop()
	-- upvalues: invariantError (ref)
	self.queries:forEach(function(_, p1)
		-- upvalues: self (ref)
		self:stopQueryNoBroadcast(p1)
	end)
	self:cancelPendingFetches(invariantError.new("QueryManager stopped while query was in flight"))
end

function t_1:cancelPendingFetches(p1)
	self.fetchCancelFns:forEach(function(p2)
		-- upvalues: p1 (ref)
		return p2(p1)
	end)
	self.fetchCancelFns:clear()
end

function t_1.mutate(p1, p2)
	-- upvalues: promiseModule (ref), invariant (ref), boolean (ref), asyncMap (ref), object (ref), graphQLResultHasError (ref), apolloError (ref), isCallableModule (ref), instanceof (ref)
	return promiseModule.resolve():andThen(function()
		-- upvalues: p2 (ref), invariant (copy), boolean (copy), p1 (ref), promiseModule (copy), asyncMap (copy), object (copy), graphQLResultHasError (copy), apolloError (copy), isCallableModule (copy), instanceof (copy)
		local mutation = p2.mutation
		local variables = p2.variables
		local optimisticResponse = p2.optimisticResponse
		local updateQueries = p2.updateQueries
		local refetchQueries = p2.refetchQueries
		local awaitRefetchQueries = p2.awaitRefetchQueries
		local update = p2.update
		local onQueryUpdated = p2.onQueryUpdated
		local errorPolicy = p2.errorPolicy
		local fetchPolicy = p2.fetchPolicy
		local keepRootFields = p2.keepRootFields
		local context = p2.context
		local var1 = if refetchQueries == nil then {} else refetchQueries
		
		if awaitRefetchQueries == nil then
			awaitRefetchQueries = false
		end
		if errorPolicy == nil then
			errorPolicy = "none"
		end
		invariant(mutation, "mutation option is required. You must specify your GraphQL document in the mutation option.")
		invariant(not boolean.toJSBoolean(fetchPolicy) or fetchPolicy == "no-cache", "Mutations only support a 'no-cache' fetchPolicy. If you don't want to disable the cache, remove your fetchPolicy setting to proceed with the default mutation behavior.")
		local var2 = p1:generateMutationId()
		mutation = p1:transform(mutation).document
		variables = p1:getVariables(mutation, variables)
		
		if p1:transform(mutation).hasClientExports then
			variables = p1.localState:addExportedVariables(mutation, variables, context):expect()
		end
		local var3
		local _ = nil
		
		if boolean.toJSBoolean(p1.mutationStore) then
			p1.mutationStore[var2] = {
				loading = true,
				error = nil,
				mutation = mutation,
				variables = variables
			}
			var3 = p1.mutationStore[var2]
		else
			var3 = p1.mutationStore
		end
		if boolean.toJSBoolean(optimisticResponse) then
			p1:markMutationOptimistic(optimisticResponse, {
				mutationId = var2,
				document = mutation,
				variables = variables,
				fetchPolicy = fetchPolicy,
				errorPolicy = errorPolicy,
				context = context,
				updateQueries = updateQueries,
				update = update,
				keepRootFields = keepRootFields
			})
		end
		p1:broadcastQueries()
		
		return promiseModule.new(function(p3, p4)
			-- upvalues: asyncMap (copy), p1 (copy), mutation (write), object (copy), context (ref), optimisticResponse (ref), variables (write), graphQLResultHasError (copy), errorPolicy (write), apolloError (copy), boolean (copy), var3 (write), isCallableModule (copy), var1 (write), var2 (ref), fetchPolicy (ref), update (ref), updateQueries (ref), awaitRefetchQueries (write), onQueryUpdated (ref), keepRootFields (ref), p1 (ref), instanceof (copy)
			return asyncMap(p1:getObservableFromLink(mutation, object.assign({}, context, { optimisticResponse = optimisticResponse }), variables, false), function(p5)
				-- upvalues: graphQLResultHasError (copy), errorPolicy (copy), apolloError (copy), boolean (copy), var3 (copy), object (copy), isCallableModule (copy), var1 (copy), p1 (copy), var2 (copy), mutation (copy), variables (copy), fetchPolicy (copy), context (copy), update (copy), updateQueries (copy), awaitRefetchQueries (copy), optimisticResponse (copy), onQueryUpdated (copy), keepRootFields (copy)
				if graphQLResultHasError(p5) and errorPolicy == "none" then
					error(apolloError.new({ graphQLErrors = p5.errors }))
				end
				if boolean.toJSBoolean(var3) then
					var3.loading = false
					var3.error = nil
				end
				local var4 = object.assign({}, p5)
				
				if isCallableModule(var1) then
					var1 = var1(var4)
				end
				if errorPolicy == "ignore" and graphQLResultHasError(var4) then
					var4.errors = nil
				end
				return p1:markMutationResult({
					mutationId = var2,
					result = var4,
					document = mutation,
					variables = variables,
					fetchPolicy = fetchPolicy,
					errorPolicy = errorPolicy,
					context = context,
					update = update,
					updateQueries = updateQueries,
					awaitRefetchQueries = awaitRefetchQueries,
					refetchQueries = var1,
					removeOptimistic = if boolean.toJSBoolean(optimisticResponse) then var2 else nil,
					onQueryUpdated = onQueryUpdated,
					keepRootFields = keepRootFields
				})
			end):subscribe({
				next = function(_, p5)
					-- upvalues: p1 (copy), p3 (ref)
					p1:broadcastQueries()
					p3(p5)
				end,
				error = function(_, p5)
					-- upvalues: boolean (copy), var3 (copy), optimisticResponse (copy), p1 (copy), var2 (copy), p4 (ref), instanceof (copy), apolloError (copy)
					if boolean.toJSBoolean(var3) then
						var3.loading = false
						var3.error = p5
					end
					if boolean.toJSBoolean(optimisticResponse) then
						p1.cache:removeOptimistic(var2)
					end
					p1:broadcastQueries()
					p4(if instanceof(p5, apolloError) then p5 else apolloError.new({ networkError = p5 }))
				end
			})
		end)
	end)
end

function t_1:markMutationResult(p1, p2)
	-- upvalues: shouldWriteResult (ref), boolean (ref), hasOwnPropertyModule (ref), getOperationName (ref), array (ref), object (ref), promiseModule (ref), toJSBoolean (ref)
	if p2 == nil then
		p2 = self.cache
	end
	local result = p1.result
	local t = {}
	local var1 = p1.fetchPolicy == "no-cache"
	
	if not var1 and shouldWriteResult(result, p1.errorPolicy) then
		table.insert(t, {
			dataId = "ROOT_MUTATION",
			result = result.data,
			query = p1.document,
			variables = p1.variables
		})
		local updateQueries = p1.updateQueries
		
		if updateQueries ~= nil then
			self.queries:forEach(function(p3, p4)
				-- upvalues: boolean (copy), hasOwnPropertyModule (copy), updateQueries (ref), self (ref), p2 (write), result (write), getOperationName (copy), t (ref)
				local observableQuery = p3.observableQuery
				local var2 = if boolean.toJSBoolean(observableQuery) then observableQuery.queryName else observableQuery
				
				if not boolean.toJSBoolean(var2) or not hasOwnPropertyModule(updateQueries, var2) then return end
				local var3 = updateQueries[var2]
				local var4 = self.queries:get(p4)
				local document = var4.document
				local variables = var4.variables
				local var5 = p2:diff({
					returnPartialData = true,
					optimistic = false,
					query = document,
					variables = variables
				})
				local result_1 = var5.result
				
				if var5.complete and boolean.toJSBoolean(result_1) then
					local var6
					local t_1 = { mutationResult = result }
					
					if boolean.toJSBoolean(document) then
						local var7 = getOperationName(document)
						var6 = if boolean.toJSBoolean(var7) then var7 else nil
					else
						var6 = nil
					end
					t_1.queryName = var6
					t_1.queryVariables = variables
					local var8 = var3(updateQueries, result_1, t_1)
					
					if boolean.toJSBoolean(var8) then
						table.insert(t, {
							dataId = "ROOT_QUERY",
							result = var8,
							query = document,
							variables = variables
						})
					end
				end
			end)
		end
	end
	if #t > 0 or boolean.toJSBoolean(p1.refetchQueries) or (boolean.toJSBoolean(p1.update) or boolean.toJSBoolean(p1.onQueryUpdated)) or boolean.toJSBoolean(p1.removeOptimistic) then
		local t_1 = {}
		self:refetchQueries({
			optimistic = false,
			updateCache = function(_, p3)
				-- upvalues: var1 (ref), array (copy), t (ref), p1 (ref), boolean (copy), self (ref), result (write), object (copy)
				if not var1 then
					array.forEach(t, function(p4)
						-- upvalues: p3 (ref)
						return p3:write(p4)
					end)
				end
				local update = p1.update
				
				if update ~= nil and boolean.toJSBoolean(update) then
					if not var1 then
						local var2 = p3:diff({
							id = "ROOT_MUTATION",
							optimistic = false,
							returnPartialData = true,
							query = self:transform(p1.document).asQuery,
							variables = p1.variables
						})
						
						if var2.complete then
							result = object.assign({}, result, { data = var2.result })
						end
					end
					update(p1, p3, result, { context = p1.context, variables = p1.variables })
				end
				if not var1 and not p1.keepRootFields then
					p3:modify({
						id = "ROOT_MUTATION",
						fields = function(_, p4, p5)
							return if p5.fieldName == "__typename" then p4 else p5.DELETE
						end
					})
				end
			end,
			include = p1.refetchQueries,
			removeOptimistic = p1.removeOptimistic,
			onQueryUpdated = if boolean.toJSBoolean(p1.onQueryUpdated) then p1.onQueryUpdated else nil
		}):forEach(function(p3)
			-- upvalues: t_1 (ref)
			return table.insert(t_1, p3)
		end)
		
		return if p1.awaitRefetchQueries or boolean.toJSBoolean(p1.onQueryUpdated) then promiseModule.all(array.filter(t_1, toJSBoolean)):andThen(function()
			-- upvalues: result (write)
			return result
		end) else promiseModule.resolve(result)
	end
end

function t_1:markMutationOptimistic(p1, p2)
	-- upvalues: isCallableModule (ref), object (ref), invariant (ref)
	local var1 = if isCallableModule(p1) then p1(p2.variables) else p1
	
	return self.cache:recordOptimisticTransaction(function(p3)
		-- upvalues: self (ref), object (copy), p2 (ref), var1 (write), invariant (copy)
		local ok, status = pcall(function()
			-- upvalues: self (copy), object (copy), p2 (copy), var1 (copy), p3 (ref)
			self:markMutationResult(object.assign({}, p2, { result = { data = var1 } }), p3)
		end)
		
		if not ok then
			invariant.error(status)
		end
	end, p2.mutationId)
end

function t_1:fetchQuery(p1, p2, p3)
	return self:fetchQueryObservable(p1, p2, p3).promise
end

function t_1:getQueryStore()
	local t = {}
	self.queries:forEach(function(p1, p2)
		-- upvalues: t (ref)
		t[p2] = {
			variables = p1.variables,
			networkStatus = p1.networkStatus,
			networkError = p1.networkError,
			graphQLErrors = p1.graphQLErrors
		}
	end)
	
	return t
end

function t_1:resetErrors(p1)
	-- upvalues: boolean (ref)
	local var1 = self.queries:get(p1)
	
	if boolean.toJSBoolean(var1) then
		var1.networkError = nil
		var1.graphQLErrors = {}
	end
end

function t_1:transform(p1)
	-- upvalues: removeConnectionDirectiveFromDocument (ref), boolean (ref), hasClientExports (ref), getDefaultValues (ref), getOperationDefinition (ref), object (ref), array (ref)
	local transformCache = self.transformCache
	
	if not transformCache:has(p1) then
		local var1 = self.cache:transformDocument(p1)
		local var2 = removeConnectionDirectiveFromDocument(self.cache:transformForLink(var1))
		local var3 = self.localState:clientQuery(var1)
		local var4 = if boolean.toJSBoolean(var2) then self.localState:serverQuery(var2) else var2
		local t = {
			document = var1,
			hasClientExports = hasClientExports(var1),
			hasForcedResolvers = self.localState:shouldForceResolvers(var1),
			clientQuery = var3,
			serverQuery = var4,
			defaultVars = getDefaultValues(getOperationDefinition(var1)),
			asQuery = object.assign({}, var1, {
				definitions = array.map(var1.definitions, function(p2)
					-- upvalues: object (copy)
					return if p2.kind == "OperationDefinition" and p2.operation ~= "query" then object.assign({}, p2, { operation = "query" }) else p2
				end)
			})
		}
		
		local function _(p2)
			-- upvalues: transformCache (ref), t (ref)
			if p2 ~= nil and not transformCache:has(p2) then
				transformCache:set(p2, t)
			end
		end
		
		if p1 ~= nil and not transformCache:has(p1) then
			transformCache:set(p1, t)
		end
		if var1 ~= nil and not transformCache:has(var1) then
			transformCache:set(var1, t)
		end
		if var3 ~= nil and not transformCache:has(var3) then
			transformCache:set(var3, t)
		end
		local var5 = var4
		
		if var5 ~= nil and not transformCache:has(var5) then
			transformCache:set(var5, t)
		end
	end
	return transformCache:get(p1)
end

function t_1:getVariables(p1, p2)
	-- upvalues: object (ref)
	return object.assign({}, self:transform(p1).defaultVars, p2)
end

function t_1:watchQuery(p1)
	-- upvalues: object (ref), queryInfo (ref), observableQuery (ref)
	local var1 = object.assign({}, p1, { variables = self:getVariables(p1.query, p1.variables) })
	
	if typeof(var1.notifyOnNetworkStatusChange) == "nil" then
		var1.notifyOnNetworkStatusChange = false
	end
	local var2 = queryInfo.new(self.cache)
	local var3 = observableQuery.new({ queryManager = self, queryInfo = var2, options = var1 })
	self.queries:set(var3.queryId, var2)
	var2:init({
		document = var1.query,
		observableQuery = var3,
		variables = var1.variables
	})
	
	return var3
end

function t_1:query(p1, p2)
	-- upvalues: invariant (ref), boolean (ref)
	if p2 == nil then
		p2 = self:generateQueryId()
	end
	invariant(p1.query, "query option is required. You must specify your GraphQL document in the query option.")
	invariant(p1.query.kind == "Document", "You must wrap the query string in a \"gql\" tag.")
	invariant(not boolean.toJSBoolean(p1.returnPartialData), "returnPartialData option only supported on watchQuery.")
	invariant(not boolean.toJSBoolean(p1.pollInterval), "pollInterval option only supported on watchQuery.")
	
	return self:fetchQuery(p2, p1):andThen(function(p3)
		-- upvalues: self (ref), p2 (write)
		self:stopQuery(p2)
		
		return p3
	end):catch(function(p3)
		-- upvalues: self (ref), p2 (write)
		self:stopQuery(p2)
		error(p3)
	end)
end

function t_1:generateQueryId()
	local queryIdCounter = self.queryIdCounter
	self.queryIdCounter += 1
	
	return tostring(queryIdCounter)
end

function t_1:generateRequestId()
	local requestIdCounter = self.requestIdCounter
	self.requestIdCounter += 1
	
	return requestIdCounter
end

function t_1:generateMutationId()
	local mutationIdCounter = self.mutationIdCounter
	self.mutationIdCounter += 1
	
	return tostring(mutationIdCounter)
end

function t_1:stopQueryInStore(p1)
	self:stopQueryInStoreNoBroadcast(p1)
	self:broadcastQueries()
end

function t_1:stopQueryInStoreNoBroadcast(p1)
	-- upvalues: boolean (ref)
	local var1 = self.queries:get(p1)
	
	if boolean.toJSBoolean(var1) then
		var1:stop()
	end
end

function t_1:clearStore()
	-- upvalues: invariantError (ref), boolean (ref), networkStatus (ref)
	self:cancelPendingFetches(invariantError.new("Store reset while query was in flight (not completed in link chain)"))
	self.queries:forEach(function(p1, _)
		-- upvalues: boolean (copy), networkStatus (copy)
		if boolean.toJSBoolean(p1.observableQuery) then
			p1.networkStatus = networkStatus.loading
			
			return
		end
		p1:stop()
	end)
	
	if boolean.toJSBoolean(self.mutationStore) then
		self.mutationStore = {}
	end
	return self.cache:reset()
end

function t_1:resetStore()
	return self:clearStore():andThen(function()
		-- upvalues: self (ref)
		return self:reFetchObservableQueries()
	end)
end

function t_1:getObservableQueries(p1)
	-- upvalues: map (ref), set (ref), array (ref), isDocumentNode (ref), isNonNullObject (ref), boolean (ref), makeUniqueId (ref), observableQuery (ref), object (ref), invariant (ref), httpService (ref)
	if p1 == nil then
		p1 = "active"
	end
	local var1 = map.new(nil)
	local var2 = map.new(nil)
	local var3 = set.new()
	
	if array.isArray(p1) then
		array.forEach(p1, function(p2)
			-- upvalues: var2 (ref), isDocumentNode (copy), self (ref), isNonNullObject (copy), boolean (copy), var3 (ref)
			if typeof(p2) == "string" then
				var2:set(p2, false)
				
				return
			elseif isDocumentNode(p2) then
				var2:set(self:transform(p2).document, false)
				
				return
			elseif isNonNullObject(p2) and boolean.toJSBoolean(p2.query) then
				var3:add(p2)
			end
		end)
	end
	self.queries:forEach(function(p2, p3)
		-- upvalues: boolean (copy), p1 (write), var1 (ref), var2 (ref)
		local observableQuery = p2.observableQuery
		local document = p2.document
		
		if boolean.toJSBoolean(observableQuery) then
			if p1 == "all" then
				var1:set(p3, observableQuery)
				
				return
			end
			local queryName = observableQuery.queryName
			
			if observableQuery.options.fetchPolicy == "standby" or not observableQuery:hasObservers() then return end
			if p1 == "active" or boolean.toJSBoolean(queryName) and var2:has(queryName) or boolean.toJSBoolean(document) and var2:has(document) then
				var1:set(p3, observableQuery)
				
				if boolean.toJSBoolean(queryName) then
					var2:set(queryName, true)
				end
				if boolean.toJSBoolean(document) then
					var2:set(document, true)
				end
			end
		end
	end)
	
	if boolean.toJSBoolean(var3.size) then
		for i, v in var3 do
			local var4 = makeUniqueId("legacyOneTimeQuery")
			local var5 = self:getQuery(var4):init({ document = v.query, variables = v.variables })
			local var6 = observableQuery.new({
				queryManager = self,
				queryInfo = var5,
				options = object.assign({}, v, { fetchPolicy = "network-only" })
			})
			var5:setObservableQuery(var6)
			var1:set(var4, var6)
		end
	end
	if _G.__DEV__ and boolean.toJSBoolean(var2.size) then
		var2:forEach(function(p2, p3)
			-- upvalues: invariant (copy), httpService (copy)
			if not p2 then
				invariant.warn(("Unknown query %s%s requested in refetchQueries options.include array"):format(if typeof(p3) == "string" then "named " else "", httpService:JSONEncode(p3)))
			end
		end)
	end
	return var1
end

function t_1:reFetchObservableQueries(p2)
	-- upvalues: boolean (ref), promiseModule (ref), array (ref), toJSBoolean (ref)
	if p2 == nil then
		p2 = false
	end
	local t = {}
	self:getObservableQueries(if boolean.toJSBoolean(p2) then "all" else "active"):forEach(function(p3, p4)
		-- upvalues: boolean (copy), p2 (write), t (ref), self (ref)
		local fetchPolicy = p3.options.fetchPolicy
		p3:resetLastResults()
		
		if boolean.toJSBoolean(p2) or fetchPolicy ~= "standby" and fetchPolicy ~= "cache-only" then
			table.insert(t, p3:refetch())
		end
		self:getQuery(p4):setDiff(nil)
	end)
	self:broadcastQueries()
	
	return promiseModule.all(array.filter(t, toJSBoolean))
end

function t_1:setObservableQuery(p2)
	self:getQuery(p2.queryId):setObservableQuery(p2)
end

function t_1:startGraphQLSubscription(p2)
	-- upvalues: shouldWriteResult (ref), graphQLResultHasError (ref), apolloError (ref), observable (ref)
	local query = p2.query
	local fetchPolicy = p2.fetchPolicy
	local errorPolicy = p2.errorPolicy
	local variables = p2.variables
	local var7 = if p2.context == nil then {} else p2.context
	query = self:transform(query).document
	local var8 = self:getVariables(query, variables)
	
	local function makeObservable(p3)
		-- upvalues: self (ref), query (write), var7 (write), fetchPolicy (ref), shouldWriteResult (copy), errorPolicy (ref), graphQLResultHasError (copy), apolloError (copy)
		return self:getObservableFromLink(query, var7, p3):map(function(p4)
			-- upvalues: fetchPolicy (copy), shouldWriteResult (copy), errorPolicy (copy), self (copy), query (copy), p3 (ref), graphQLResultHasError (copy), apolloError (copy)
			if fetchPolicy ~= "no-cache" then
				if shouldWriteResult(p4, errorPolicy) then
					self.cache:write({
						dataId = "ROOT_SUBSCRIPTION",
						query = query,
						result = p4.data,
						variables = p3
					})
				end
				self:broadcastQueries()
			end
			if graphQLResultHasError(p4) then
				error(apolloError.new({ graphQLErrors = p4.errors }))
			end
			return p4
		end)
	end
	
	if self:transform(query).hasClientExports then
		local var9 = self.localState:addExportedVariables(query, var8, var7):andThen(makeObservable)
		
		return observable.new(function(p3)
			-- upvalues: var9 (ref)
			local var10 = nil
			var9:andThen(function(p4)
				-- upvalues: var10 (write), p3 (ref)
				var10 = p4:subscribe(p3)
				
				return var10
			end, p3.error)
			
			return function()
				-- upvalues: var10 (write)
				return if var10 == nil then var10 else var10:unsubscribe()
			end
		end)
	end
	return makeObservable(var8)
end

function t_1:stopQuery(p2)
	self:stopQueryNoBroadcast(p2)
	self:broadcastQueries()
end

function t_1:stopQueryNoBroadcast(p2)
	self:stopQueryInStoreNoBroadcast(p2)
	self:removeQuery(p2)
end

function t_1:removeQuery(p2)
	self.fetchCancelFns:delete(p2)
	self:getQuery(p2):stop()
	self.queries:delete(p2)
end

function t_1:broadcastQueries()
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(self.onBroadcast) then
		self:onBroadcast()
	end
	self.queries:forEach(function(p2, _)
		return p2:notify()
	end)
end

function t_1:getLocalState()
	return self.localState
end

function t_1:getObservableFromLink(p2, p3, p4, p5)
	-- upvalues: boolean (ref), getOperationName (ref), object (ref), map (ref), canonicalStringify (ref), concast (ref), execute (ref), observable (ref), toJSBoolean (ref), asyncMap (ref)
	if p5 == nil then
		p5 = if boolean.toJSBoolean(p3) then if p3.queryDeduplication ~= nil then self.queryDeduplication else p3.queryDeduplication else self.queryDeduplication
	end
	local var7
	local _ = nil
	local serverQuery = self:transform(p2).serverQuery
	
	if boolean.toJSBoolean(serverQuery) then
		local inFlightLinkObservables = self.inFlightLinkObservables
		local link = self.link
		local t = {
			query = serverQuery,
			variables = p4,
			operationName = boolean.toJSBoolean(getOperationName(serverQuery)) and getOperationName(serverQuery) or nil,
			context = self:prepareContext(object.assign({}, p3, { forceFetch = not p5 }))
		}
		p3 = t.context
		
		if p5 then
			local var8 = inFlightLinkObservables:get(serverQuery)
			local var9 = if boolean.toJSBoolean(var8) then var8 else map.new(nil)
			inFlightLinkObservables:set(serverQuery, var9)
			local var10 = canonicalStringify(p4)
			var7 = var9:get(var10)
			
			if not boolean.toJSBoolean(var7) then
				local var11 = concast.new({ execute(link, t) })
				var7 = var11
				var9:set(var10, var7)
				var11:cleanup(function()
					-- upvalues: boolean (copy), var9 (ref), var10 (ref), inFlightLinkObservables (ref), serverQuery (ref)
					if boolean.toJSBoolean(var9:delete(var10)) and var9.size < 1 then
						inFlightLinkObservables:delete(serverQuery)
					end
				end)
			end
		else
			var7 = concast.new({ execute(link, t) })
		end
	else
		var7 = concast.new({ observable.of({ data = {} }) })
		p3 = self:prepareContext(p3)
	end
	local clientQuery = self:transform(p2).clientQuery
	
	if toJSBoolean(clientQuery) then
		var7 = asyncMap(var7, function(p6)
			-- upvalues: self (ref), clientQuery (ref), p3 (write), p4 (ref)
			return self.localState:runResolvers({
				document = clientQuery,
				remoteResult = p6,
				context = p3,
				variables = p4
			})
		end)
	end
	return var7
end

function t_1:getResultsFromLink(p2, p3, p4)
	-- upvalues: asyncMap (ref), isNonEmptyArray (ref), apolloError (ref), boolean (ref), networkStatus (ref), isApolloError (ref)
	p2.lastRequestId = self:generateRequestId()
	local lastRequestId = p2.lastRequestId
	
	return asyncMap(self:getObservableFromLink(p2.document, p4.context, p4.variables), function(p5)
		-- upvalues: isNonEmptyArray (copy), lastRequestId (ref), p2 (ref), p4 (ref), apolloError (copy), p3 (ref), boolean (copy), networkStatus (copy)
		local var7 = isNonEmptyArray(p5.errors)
		
		if p2.lastRequestId <= lastRequestId then
			if var7 and p4.errorPolicy == "none" then
				error(p2:markError(apolloError.new({ graphQLErrors = p5.errors })))
			end
			p2:markResult(p5, p4, p3)
			p2:markReady()
		end
		local t = {
			loading = false,
			data = p5.data,
			networkStatus = if boolean.toJSBoolean(p2.networkStatus) then p2.networkStatus else networkStatus.ready
		}
		
		if var7 and p4.errorPolicy ~= "ignore" then
			t.errors = p5.errors
		end
		return t
	end, function(p5)
		-- upvalues: isApolloError (copy), apolloError (copy), lastRequestId (ref), p2 (ref)
		local var7 = if isApolloError(p5) then p5 else apolloError.new({ networkError = p5 })
		
		if p2.lastRequestId <= lastRequestId then
			p2:markError(var7)
		end
		error(var7)
	end)
end

function t_1:fetchQueryObservable(p2, p3, p4)
	-- upvalues: networkStatus (ref), object (ref), promiseModule (ref), concast (ref), applyNextFetchPolicy (ref)
	if p4 == nil then
		p4 = networkStatus.loading
	end
	local document = self:transform(p3.query).document
	local var7 = self:getVariables(document, p3.variables)
	local var8 = self:getQuery(p2)
	local fetchPolicy = p3.fetchPolicy
	local errorPolicy = p3.errorPolicy
	local returnPartialData = p3.returnPartialData
	local notifyOnNetworkStatusChange = p3.notifyOnNetworkStatusChange
	local context = p3.context
	
	if fetchPolicy == nil then
		fetchPolicy = "cache-first"
	end
	if errorPolicy == nil then
		errorPolicy = "none"
	end
	if returnPartialData == nil then
		returnPartialData = false
	end
	if notifyOnNetworkStatusChange == nil then
		notifyOnNetworkStatusChange = false
	end
	if context == nil then
		context = {}
	end
	local var9 = object.assign({}, p3, {
		query = document,
		variables = var7,
		fetchPolicy = fetchPolicy,
		errorPolicy = errorPolicy,
		returnPartialData = returnPartialData,
		notifyOnNetworkStatusChange = notifyOnNetworkStatusChange,
		context = context
	})
	
	local function fromVariables(p5)
		-- upvalues: var9 (ref), self (ref), var8 (ref), p4 (write)
		var9.variables = p5
		
		return self:fetchQueryByPolicy(var8, var9, p4)
	end
	
	local var10 = nil
	self.fetchCancelFns:set(p2, function(p5)
		-- upvalues: promiseModule (copy), var10 (write)
		promiseModule.delay(0):andThen(function()
			-- upvalues: var10 (copy), p5 (ref)
			return var10:cancel(p5)
		end)
	end)
	var10 = concast.new((function()
		-- upvalues: self (ref), var9 (ref), fromVariables (ref)
		return if self:transform(var9.query).hasClientExports then self.localState:addExportedVariables(var9.query, var9.variables, var9.context):andThen(fromVariables) else fromVariables(var9.variables)
	end)())
	var10:cleanup(function()
		-- upvalues: self (ref), p2 (ref), applyNextFetchPolicy (copy), p3 (ref)
		self.fetchCancelFns:delete(p2)
		applyNextFetchPolicy(p3)
	end)
	
	return var10
end

function t_1:refetchQueries(p2)
	-- upvalues: boolean (ref), makeUniqueId (ref), map (ref), instanceof (ref), queryInfo (ref)
	local updateCache = p2.updateCache
	local include = p2.include
	local optimistic = p2.optimistic
	local removeOptimistic = p2.removeOptimistic
	local onQueryUpdated = p2.onQueryUpdated
	
	if optimistic == nil then
		optimistic = false
	end
	if removeOptimistic == nil then
		removeOptimistic = if boolean.toJSBoolean(optimistic) then makeUniqueId("refetchQueries") else nil
	end
	local var7 = map.new(nil)
	
	if boolean.toJSBoolean(include) then
		self:getObservableQueries(include):forEach(function(p3, p4)
			-- upvalues: var7 (ref), self (ref)
			var7:set(p4, { oq = p3, lastDiff = self:getQuery(p4):getDiff() })
		end)
	end
	local var8 = map.new(nil)
	
	if boolean.toJSBoolean(updateCache) then
		self.cache:batch({
			update = updateCache,
			optimistic = if optimistic and boolean.toJSBoolean(removeOptimistic) then removeOptimistic else false,
			removeOptimistic = removeOptimistic,
			onWatchUpdated = function(_, p3, p4, p5)
				-- upvalues: instanceof (copy), queryInfo (copy), boolean (copy), onQueryUpdated (ref), var7 (ref), p2 (ref), var8 (ref)
				local var9 = if instanceof(p3.watcher, queryInfo) then p3.watcher.observableQuery else instanceof(p3.watcher, queryInfo)
				
				if boolean.toJSBoolean(var9) then
					if onQueryUpdated then
						var7:delete(var9.queryId)
						local var10 = onQueryUpdated(p2, var9, p4, p5)
						
						if var10 == true then
							var10 = var9:refetch()
						end
						if var10 ~= false then
							var8:set(var9, var10)
						end
						return false
					elseif onQueryUpdated then
						var7:set(var9.queryId, { oq = var9, lastDiff = p5, diff = p4 })
					end
				end
				return nil
			end
		})
	end
	if boolean.toJSBoolean(var7.size) then
		var7:forEach(function(p3, p4)
			-- upvalues: onQueryUpdated (ref), p2 (ref), var8 (ref), self (ref)
			local oq = p3.oq
			local lastDiff = p3.lastDiff
			local diff = p3.diff
			local var9 = nil
			
			if onQueryUpdated ~= nil then
				if diff == nil then
					local queryInfo = oq.queryInfo
					queryInfo:reset()
					diff = queryInfo:getDiff()
				end
				var9 = onQueryUpdated(p2, oq, diff, lastDiff)
			end
			if onQueryUpdated == nil or var9 == true then
				var9 = oq:refetch()
			end
			if var9 ~= false then
				var8:set(oq, var9)
			end
			local matchIndex = string.find(p4, "legacyOneTimeQuery")
			
			if matchIndex ~= nil and matchIndex >= 1 then
				self:stopQueryNoBroadcast(p4)
			end
		end)
	end
	if boolean.toJSBoolean(removeOptimistic) then
		self.cache:removeOptimistic(removeOptimistic)
	end
	return var8
end

function t_1.fetchQueryByPolicy(p2, p3, p4, p5)
	-- upvalues: boolean (ref), networkStatus (ref), isNonEmptyArray (ref), equalModule (ref), invariant (ref), array (ref), observable (ref), object (ref), isNetworkRequestInFlight (ref), cacheWriteBehavior (ref)
	local var7
	local query = p4.query
	local variables = p4.variables
	local fetchPolicy = p4.fetchPolicy
	local refetchWritePolicy = p4.refetchWritePolicy
	local errorPolicy = p4.errorPolicy
	local returnPartialData = p4.returnPartialData
	local context = p4.context
	local notifyOnNetworkStatusChange = p4.notifyOnNetworkStatusChange
	local networkStatus_1 = p3.networkStatus
	p3:init({
		document = query,
		variables = variables,
		networkStatus = p5
	})
	
	local function readCache()
		-- upvalues: p3 (ref), variables (ref)
		return p3:getDiff(variables)
	end
	
	local function resultsFromCache(p6, p7)
		-- upvalues: boolean (copy), p3 (ref), networkStatus (copy), isNonEmptyArray (copy), equalModule (copy), returnPartialData (ref), invariant (copy), array (copy), observable (copy), object (copy), isNetworkRequestInFlight (copy), p2 (ref), query (ref), context (ref), variables (ref)
		if p7 == nil then
			p7 = if boolean.toJSBoolean(p3.networkStatus) then p3.networkStatus else networkStatus.loading
		end
		local result = p6.result
		
		if _G.__DEV__ and p6.missing ~= nil and (isNonEmptyArray(p6.missing) and not equalModule(result, {})) and not boolean.toJSBoolean(returnPartialData) then
			invariant.debug(("Missing cache result fields: %s"):format(array.join(array.map(p6.missing, function(p8)
				-- upvalues: array (copy)
				return array.join(p8.path, ".")
			end), ", ")), p6.missing)
		end
		local function fromData(p8)
			-- upvalues: observable (copy), object (copy), isNetworkRequestInFlight (copy), p7 (write), boolean (copy), p6 (ref)
			return observable.of(object.assign({}, {
				data = p8,
				loading = isNetworkRequestInFlight(p7),
				networkStatus = p7
			}, if boolean.toJSBoolean(p6.complete) then nil else { partial = true }))
		end
		
		return if boolean.toJSBoolean(result) and p2:transform(query).hasForcedResolvers then p2.localState:runResolvers({
			onlyRunForcedResolvers = true,
			document = query,
			remoteResult = { data = result },
			context = context,
			variables = variables
		}):andThen(function(p8)
			-- upvalues: fromData (ref), boolean (copy)
			return fromData(if boolean.toJSBoolean(p8.data) then p8.data else nil)
		end) else fromData(result)
	end
	
	local _ = nil
	local var8 = if fetchPolicy == "no-cache" then cacheWriteBehavior.FORBID elseif p5 == networkStatus.refetch and refetchWritePolicy ~= "merge" then cacheWriteBehavior.OVERWRITE else cacheWriteBehavior.MERGE
	
	local function resultsFromLink()
		-- upvalues: p2 (ref), p3 (ref), var8 (write), variables (ref), context (ref), fetchPolicy (ref), errorPolicy (ref)
		return p2:getResultsFromLink(p3, var8, {
			variables = variables,
			context = context,
			fetchPolicy = fetchPolicy,
			errorPolicy = errorPolicy
		})
	end
	
	local var9 = notifyOnNetworkStatusChange and (typeof(networkStatus_1) == "number" and (networkStatus_1 ~= p5 and isNetworkRequestInFlight(p5)))
	
	if fetchPolicy == "cache-first" then
		local var10 = p3:getDiff(variables)
		
		return if boolean.toJSBoolean(var10.complete) then { resultsFromCache(var10, p3:markReady()) } elseif boolean.toJSBoolean(returnPartialData) or boolean.toJSBoolean(var9) then { resultsFromCache(var10), resultsFromLink() } else { resultsFromLink() }
	elseif fetchPolicy == "cache-and-network" then
		var7 = p3:getDiff(variables)
		
		return if boolean.toJSBoolean(var7.complete) or boolean.toJSBoolean(returnPartialData) or boolean.toJSBoolean(var9) then { resultsFromCache(var7), resultsFromLink() } else { resultsFromLink() }
	elseif fetchPolicy == "cache-only" then
		return {
			resultsFromCache(p3:getDiff(variables), p3:markReady())
		}
	elseif fetchPolicy == "network-only" then
		return if boolean.toJSBoolean(var9) then { resultsFromCache(readCache()), resultsFromLink() } else { resultsFromLink() }
	elseif fetchPolicy == "no-cache" then
		return if boolean.toJSBoolean(var9) then { resultsFromCache(p3:getDiff()), resultsFromLink() } else { resultsFromLink() }
	elseif fetchPolicy == "standby" then
		return {}
	end
	var7 = p3:getDiff(variables)
	
	return if boolean.toJSBoolean(var7.complete) then { resultsFromCache(var7, p3:markReady()) } elseif boolean.toJSBoolean(returnPartialData) or boolean.toJSBoolean(var9) then { resultsFromCache(var7), resultsFromLink() } else { resultsFromLink() }
end

function t_1:getQuery(p2)
	-- upvalues: boolean (ref), queryInfo (ref)
	if boolean.toJSBoolean(p2) and not self.queries:has(p2) then
		self.queries:set(p2, queryInfo.new(self.cache))
	end
	return self.queries:get(p2)
end

function t_1:prepareContext(p2)
	-- upvalues: object (ref)
	if p2 == nil then
		p2 = {}
	end
	return object.assign({}, self.localState:prepareContext(p2), { clientAwareness = self.clientAwareness })
end

t.QueryManager = t_1

return t